const CommentDataAccess = require("../dataAccess/comment");
const ExpressError = require("../helpers/expressError");

class Comment {
  constructor({ comment_id, post_id, text, author, timestamp }) {
    this.comment_id = comment_id;
    this.post_id = post_id;
    this.text = text;
    this.author = author;
    this.timestamp = timestamp;
  }

  async remove() {
    await CommentDataAccess.delete(this.comment_id);
  }
  async sync() {
    await CommentDataAccess.update(this.comment_id, {
      text: this.text,
    });
  }

  static async create(post_id, text, author) {
    const commentData = await CommentDataAccess.create({
      post_id,
      text,
      author,
    });
    return new Comment(commentData);
  }
  static async getById(comment_id) {
    const commentData = await CommentDataAccess.getOne(comment_id);
    if (!commentData)
      throw new ExpressError(
        `No comment found with comment_id ${comment_id}`,
        404
      );
    return new Comment(commentData);
  }
  static async getAll({ post_id, author }) {
    const commentsData = await CommentDataAccess.getAll({ post_id, author });
    return commentsData.map((comment) => new Comment(comment));
  }
}

module.exports = Comment;
