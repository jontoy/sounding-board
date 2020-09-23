const TagDataAccess = require("../dataAccess/tag");
const ExpressError = require("../helpers/expressError");

class Tag {
  constructor({ id, name, totalPosts = 0 }) {
    this.id = id;
    this.name = name;
    this.totalPosts = Number(totalPosts);
  }
  incrementTotalPosts(delta) {
    this.totalPosts += delta;
  }
  async remove() {
    await TagDataAccess.delete(this.id);
  }
  async sync() {
    await TagDataAccess.update(this.id, this.name);
  }

  static async create(name) {
    const tagData = await TagDataAccess.create({ name });
    return new Tag(tagData);
  }
  static async getById(id) {
    const tagData = await TagDataAccess.getOne(id);
    if (!tagData) throw new ExpressError(`No tag exists with id ${id}`, 404);
    return new Tag(tagData);
  }
  static async getAll({ name, sort }) {
    const tagsData = await TagDataAccess.getAll({ name, sort });
    return tagsData.map((tag) => new Tag(tag));
  }
  static async getAllByPostId(postId) {
    const tagsData = await TagDataAccess.getAllByPostId(postId);
    return tagsData.map((tag) => new Tag(tag));
  }
}

module.exports = Tag;
