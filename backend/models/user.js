const PostDataAccess = require("../dataAccess/post");
const UserDataAccess = require("../dataAccess/user");
const VoteDataAccess = require("../dataAccess/vote");
const TagDataAccess = require("../dataAccess/tag");
const { BCRYPT_WORK_FACTOR } = require("../config");
const bcrypt = require("bcrypt");
const ExpressError = require("../helpers/expressError");
const Vote = require("../dataAccess/vote");

class User {
  constructor({
    username,
    avatar_url,
    member_since,
    bio,
    authoredPosts = [],
    likedPosts = [],
    dislikedPosts = [],
  }) {
    this.username = username;
    this.avatar_url = avatar_url;
    this.member_since = member_since;
    this.bio = bio;
    this.authoredPosts = authoredPosts;
    this.likedPosts = likedPosts;
    this.dislikedPosts = dislikedPosts;
  }

  async remove() {
    await UserDataAccess.delete(this.username);
  }
  async save() {
    await TagDataAccess.update(this.username, {
      avatar_url: this.avatar_url,
      bio: this.bio,
    });
  }
  async upvote(post_id) {
    return await this.vote(post_id, 1);
  }
  async downvote(post_id) {
    return await this.vote(post_id, -1);
  }
  async vote(post_id, value) {
    const postExistence = await PostDataAccess.getOne(post_id);
    if (!postExistence)
      throw new ExpressError(`No post found with id ${post_id}`, 404);
    let voteData = VoteDataAccess.update(post_id, this.username, value);
    if (!voteData) {
      voteData = await VoteDataAccess.create({
        post_id,
        username: this.username,
        value,
      });
    }
    return voteData;
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
    const postData = await PostDataAccess.getAll({ author: username });
    const voteData = await VoteDataAccess.getAll({ username });
    postData.authoredPosts = postData;
    postData.likedPosts = voteData
      .filter((vote) => vote.value === 1)
      .map((vote) => vote.post_id);
    postData.dislikedPosts = voteData
      .filter((vote) => vote.value === -1)
      .map((vote) => vote.post_id);
    return new User(userData);
  }
  //   static async getAll({ title }) {
  //     const postsData = await PostDataAccess.getAll({ title });
  //     return postsData.map((post) => new Post(post));
  //   }
}

module.exports = User;
