const PostDataAccess = require("../dataAccess/post");
const CommentDataAccess = require("../dataAccess/comment");
const TagDataAccess = require("../dataAccess/tag");
const PostTagDataAccess = require("../dataAccess/postTag");

class Post {
  constructor({
    id,
    title,
    author,
    body,
    timestamp,
    netVotes = 0,
    comments = [],
    tags = [],
  }) {
    this.id = id;
    this.title = title;
    this.author = author;
    this.body = body;
    this.timestamp = timestamp;
    this.netVotes = netVotes;
    this.comments = comments;
    this.tags = tags;
  }

  async remove() {
    await PostDataAccess.delete(this.id);
  }
  async save() {
    await PostDataAccess.update(this.id, {
      title: this.title,
      body: this.body,
    });
  }
  async addTag(tag_id) {
    if (!this.tags.find((tag) => tag.id === tag_id)) {
      const tag = await TagDataAccess.getOne(tag_id);
      if (tag) {
        PostTagDataAccess.create({ post_id: this.id, tag_id });
        this.tags.push(tag);
      }
    }
  }
  async removeTag(tag_id) {
    const tag = this.tags.find((tag) => tag.id === tag_id);
    if (tag) {
      await PostTagDataAccess.delete(this.id, tag_id);
      this.tags = this.tags.filter((tag) => tag.id !== tag_id);
    }
  }

  static async create(title, author, body) {
    const postData = await PostDataAccess.create({ title, author, body });
    return new Post(postData);
  }
  static async getById(id) {
    const postData = await PostDataAccess.getOne(id);
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

module.exports = Post;
