const { BCRYPT_WORK_FACTOR } = require("../config");
const bcrypt = require("bcrypt");
const ExpressError = require("../helpers/expressError");
const UserDataAccess = require("../dataAccess/user");
const VoteDataAccess = require("../dataAccess/vote");
const DetailedPost = require("./detailedPost");

class User {
  constructor({ username, avatarUrl, bio, memberSince }) {
    this.username = username;
    this.avatarUrl = avatarUrl;
    this.bio = bio;
    this.memberSince = memberSince;
  }

  async remove() {
    await UserDataAccess.delete(this.username);
  }
  async sync() {
    await UserDataAccess.update(this.username, {
      avatar_url: this.avatarUrl,
      bio: this.bio,
    });
  }
  async createPost({ title, body }) {
    const post = await DetailedPost.create({
      title,
      author: this.username,
      body,
    });
    await this.upvote(post);
    return post;
  }

  async upvote(post) {
    const voteData = await this.vote(post, 1);

    return voteData;
  }
  async downvote(post) {
    const voteData = await this.vote(post, -1);
    return voteData;
  }
  async vote(post, value) {
    let voteData = await VoteDataAccess.update(post.id, this.username, value);
    if (!voteData) {
      voteData = await VoteDataAccess.create({
        postId: post.id,
        username: this.username,
        value,
      });
    }
    return voteData;
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
        409
      );
    const hashedPassword = await bcrypt.hash(password, BCRYPT_WORK_FACTOR);
    const userData = await UserDataAccess.create({
      username,
      password: hashedPassword,
      bio,
    });
    return new User(userData);
  }
  static async getAll({ username }) {
    const usersData = await UserDataAccess.getAll({ username });
    return usersData.map((user) => new User(user));
  }
}

module.exports = User;
