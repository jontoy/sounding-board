const TagDataAccess = require("../dataAccess/tag");
const ExpressError = require("../helpers/expressError");

class Tag {
  constructor({ id, name, total_posts = 0 }) {
    this.id = id;
    this.name = name;
    this.total_posts = Number(total_posts);
  }
  incrementTotalPosts(delta) {
    this.total_posts += delta;
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
  static async getAll({ name }) {
    const tagsData = await TagDataAccess.getAll({ name });
    return tagsData.map((tag) => new Tag(tag));
  }
  static async getAllByPostId(post_id) {
    const tagsData = await TagDataAccess.getAllByPostId(post_id);
    return tagsData.map((tag) => new Tag(tag));
  }
}

module.exports = Tag;
