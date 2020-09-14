const Post = require("./post");
const PostTagDataAccess = require("../dataAccess/postTag");
const PostDataAccess = require("../dataAccess/post");
const Tag = require("./tag");
const Comment = require("./comment");

class DetailedPost extends Post {
  constructor({
    id,
    title,
    author,
    body,
    createdAt,
    netVotes,
    comments = [],
    tags = [],
  }) {
    super({ id, title, author, body, createdAt, netVotes });
    this.comments = comments;
    this.tags = tags;
  }
  async sync() {
    await PostDataAccess.update(this.id, {
      title: this.title,
      body: this.body,
    });
  }
  async addTag(tag) {
    if (!this.tags.find((t) => t.id === tag.id)) {
      await PostTagDataAccess.create({
        postId: this.id,
        tagId: tag.id,
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
    const post = await super.create({ title, author, body });
    const detailedPost = new DetailedPost(post);
    return detailedPost;
  }
  static async getById(id) {
    const postData = await PostDataAccess.getOne(id);
    if (!postData) throw new ExpressError(`No post found with id ${id}`, 404);
    const comments = await Comment.getAll({ postId: id });
    const tags = await Tag.getAllByPostId(id);
    postData.comments = comments;
    postData.tags = tags;
    const detailedPost = new DetailedPost(postData);
    return detailedPost;
  }
}

module.exports = DetailedPost;
