const PostDataAccess = require("../dataAccess/post");
const PostTagDataAccess = require("../dataAccess/postTag");
const VoteDataAccess = require("../dataAccess/vote");
const Tag = require("./tag");
const Comment = require("./comment");

class Post {
  constructor({
    id,
    title,
    author,
    body,
    timestamp,
    net_votes = 0,
    comments = [],
    tags = [],
  }) {
    this.id = id;
    this.title = title;
    this.author = author;
    this.body = body;
    this.timestamp = timestamp;
    this.net_votes = Number(net_votes);
    this.comments = comments;
    this.tags = tags;
  }
  incrementNetVotes(delta) {
    this.net_votes += delta;
  }

  async remove() {
    await PostDataAccess.delete(this.id);
  }
  async sync() {
    await PostDataAccess.update(this.id, {
      title: this.title,
      body: this.body,
    });
    this.net_votes = await VoteDataAccess.getNetVotes(this.id);
  }
  async addTag(tag) {
    if (!this.tags.find((t) => t.id === tag.id)) {
      await PostTagDataAccess.create({
        post_id: this.id,
        tag_id: tag.id,
      });
      this.tags.push(tag);
      tag.incrementTotalPosts(1);
    }
  }
  async removeTag(tag) {
    if (this.tags.find((t) => t.id === tag.id)) {
      await PostTagDataAccess.delete(this.id, tag.id);
      this.tags = this.tags.filter((t) => t.id !== tag.id);
      tag.incrementTotalPosts(-1);
    }
  }

  static async create({ title, author, body }) {
    const postData = await PostDataAccess.create({ title, author, body });
    return new Post(postData);
  }
  static async getById(id) {
    const postData = await PostDataAccess.getOne(id);
    if (!postData) throw new ExpressError(`No post found with id ${id}`, 404);
    const comments = await Comment.getAll({ post_id: id });
    const tags = await Tag.getAllByPostId(id);
    postData.comments = comments;
    postData.tags = tags;
    return new Post(postData);
  }
  static async getAll({ title, author }) {
    const postsData = await PostDataAccess.getAll({ title, author });
    return postsData.map((post) => new Post(post));
  }
}

module.exports = Post;
