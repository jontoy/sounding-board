const PostDataAccess = require("../dataAccess/post");

class Post {
  constructor({ id, title, body, author, createdAt, netVotes = 0 }) {
    this.id = id;
    this.title = title;
    this.body = body;
    this.author = author;
    this.createdAt = createdAt;
    this.netVotes = netVotes ? parseInt(netVotes) : 0;
  }
  incrementNetVotes(delta) {
    this.netVotes += delta;
  }

  async remove() {
    await PostDataAccess.delete(this.id);
  }
  static async create({ title, author, body }) {
    const postData = await PostDataAccess.create({ title, author, body });
    return new Post(postData);
  }
  static async getAll({ title, author, tagId, sort }) {
    const postsData = await PostDataAccess.getAll({
      title,
      author,
      tagId,
      sort,
    });
    return postsData.map((post) => new Post(post));
  }
  static async countTotal() {
    const totalPosts = await PostDataAccess.countTotal();
    return totalPosts;
  }
}

module.exports = Post;
