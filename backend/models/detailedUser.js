const User = require("./user");
const UserDataAccess = require("../dataAccess/user");
const VoteDataAccess = require("../dataAccess/vote");
const Post = require("./post");
const ExpressError = require("../helpers/expressError");

class DetailedUser extends User {
  constructor({
    username,
    avatarUrl,
    memberSince,
    bio,
    authoredPosts = [],
    likedPostIds = [],
    dislikedPostIds = [],
  }) {
    super({ username, avatarUrl, bio, memberSince });
    this.authoredPosts = authoredPosts;
    this.likedPostIds = likedPostIds;
    this.dislikedPostIds = dislikedPostIds;
  }
  async createPost({ title, body }) {
    const post = await super.createPost({ title, body });
    this.authoredPosts.push(post);
    this.addLikedPostId(post);
    return post;
  }
  addLikedPostId(post) {
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
  }
  addDislikedPostId(post) {
    if (!this.dislikedPostIds.includes(post.id)) {
      this.dislikedPostIds.push(post.id);
      post.incrementNetVotes(-1);
    }
    if (this.likedPostIds.includes(post.id)) {
      this.likedPostIds = this.likedPostIds.filter((id) => id !== post.id);
      post.incrementNetVotes(-1);
    }
  }
  async upvote(post) {
    const voteData = await super.upvote(post);
    this.addLikedPostId(post);
    return voteData;
  }
  async downvote(post) {
    const voteData = await super.downvote(post);
    this.addDislikedPostId(post);
    return voteData;
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
      .map((vote) => vote.postId);
    userData.dislikedPostIds = voteData
      .filter((vote) => vote.value === -1)
      .map((vote) => vote.postId);
    const detailedUser = new DetailedUser(userData);
    return detailedUser;
  }
  static async create({ username, password, bio = "" }) {
    const user = await super.create({ username, password, bio });
    return new DetailedUser({
      ...user,
      avatarUrl: user.avatarUrl,
      memberSince: user.memberSince,
    });
  }
}

module.exports = DetailedUser;
