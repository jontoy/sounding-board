const PostDataAccess = require("../dataAccess/post");
const CommentDataAccess = require("../dataAccess/comment");
const TagDataAccess = require("../dataAccess/tag");
const ExpressError = require("../helpers/expressError");

class Tag {
  constructor({ id, name, totalPosts = 0 }) {
    this.id = id;
    this.name = name;
    this.totalPosts = totalPosts;
  }

  async remove() {
    await TagDataAccess.delete(this.id);
  }
  async save() {
    await TagDataAccess.update(this.id, this.name);
  }

  static async create(name) {
    const tagData = await TagDataAccess.create({ name });
    return new Tag(tagData);
  }
  static async getById(id) {
    const postData = await PostDataAccess.getOne(id);
    if (!postData) throw new ExpressError(`No tag exists with id ${id}`, 404);
    const commentData = await CommentDataAccess.getAll({ post_id: id });
    const tagData = await TagDataAccess.getAllByPostId(id);
    postData.comments = commentData;
    postData.tags = tagData;
    return new Post(postData);
  }
  static async getAll({ title }) {
    const postsData = await PostDataAccess.getAll({ title });
    return postsData.map((post) => new Post(post));
  }
}

module.exports = Tag;
