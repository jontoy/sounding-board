const PostDataAccess = require("../dataAccess/post");
const UserDataAccess = require("../dataAccess/user");
const VoteDataAccess = require("../dataAccess/vote");
const { BCRYPT_WORK_FACTOR } = require("../config");
const bcrypt = require("bcrypt");
const ExpressError = require("../helpers/expressError");
const Post = require("./post");

class User {
  constructor({
    username,
    avatar_url,
    member_since,
    bio,
    authoredPosts = [],
    likedPostIds = [],
    dislikedPostIds = [],
  }) {
    this.username = username;
    this.avatar_url = avatar_url;
    this.member_since = member_since;
    this.bio = bio;
    this.authoredPosts = authoredPosts;
    this.likedPostIds = likedPostIds;
    this.dislikedPostIds = dislikedPostIds;
  }

  async remove() {
    await UserDataAccess.delete(this.username);
  }
  async sync() {
    await UserDataAccess.update(this.username, {
      avatar_url: this.avatar_url,
      bio: this.bio,
    });
  }
  async upvote(post) {
    const voteData = await this.vote(post, 1);
    if (!this.likedPostIds.includes(post.id)) {
      this.likedPostIds.push(post.id);
      post.incrementNetVotes(1);
    }
    if (this.dislikedPostIds.includes(post.id)) {
      this.dislikedPostIds = this.dislikedPostIds.filter(
        (id) => id !== post.id
      );
      post.incrementNetVotes(1);
    }
    return voteData;
  }
  async downvote(post) {
    const voteData = await this.vote(post, -1);
    if (!this.dislikedPostIds.includes(post.id)) {
      this.dislikedPostIds.push(post.id);
      post.incrementNetVotes(-1);
    }
    if (this.likedPostIds.includes(post.id)) {
      this.likedPostIds = this.likedPostIds.filter((id) => id !== post.id);
      post.incrementNetVotes(-1);
    }
    return voteData;
  }
  async vote(post, value) {
    let voteData = await VoteDataAccess.update(post.id, this.username, value);
    if (!voteData) {
      voteData = await VoteDataAccess.create({
        post_id: post.id,
        username: this.username,
        value,
      });
    }
    return voteData;
  }
  async createPost({ title, body }) {
    const post = await Post.create({ title, author: this.username, body });
    this.authoredPosts.push(post);
    await this.upvote(post);
    return post;
  }

  static async create({ title, author, body }) {
    const postData = await PostDataAccess.create({ title, author, body });
    return new Post(postData);
  }
  static async authenticate({ username, password }) {
    const user = await UserDataAccess.getOne(username);
    if (!user) return false;
    const hashedPassword = await UserDataAccess.fetchPassword(username);
    if (await bcrypt.compare(password, hashedPassword)) {
      return new User(user);
    }
    return false;
  }

  static async create({ username, password, bio = "" }) {
    const userExistence = await UserDataAccess.getOne(username);
    if (userExistence)
      throw new ExpressError(
        `User with username ${username} already exists`,
        401
      );
    const hashedPassword = await bcrypt.hash(password, BCRYPT_WORK_FACTOR);
    const userData = await UserDataAccess.create({
      username,
      password: hashedPassword,
      bio,
    });
    return new User(userData);
  }
  static async getById(username) {
    const userData = await UserDataAccess.getOne(username);

    if (!userData)
      throw new ExpressError(`No user found with username ${username}`, 404);
    const posts = await Post.getAll({ author: username });
    const voteData = await VoteDataAccess.getAll({ username });
    userData.authoredPosts = posts;
    userData.likedPostIds = voteData
      .filter((vote) => vote.value === 1)
      .map((vote) => vote.post_id);
    userData.dislikedPostIds = voteData
      .filter((vote) => vote.value === -1)
      .map((vote) => vote.post_id);

    return new User(userData);
  }
  static async getAll({ username }) {
    const usersData = await UserDataAccess.getAll({ username });
    return usersData.map((user) => new User(user));
  }
}

module.exports = User;
