const CommentDataAccess = require("../dataAccess/comment");
const ExpressError = require("../helpers/expressError");

class Comment {
  constructor({ commentId, postId, text, author, createdAt }) {
    this.commentId = commentId;
    this.postId = postId;
    this.text = text;
    this.author = author;
    this.createdAt = createdAt;
  }

  async remove() {
    await CommentDataAccess.delete(this.commentId);
  }
  async sync() {
    await CommentDataAccess.update(this.commentId, {
      text: this.text,
    });
  }

  static async create(postId, text, author) {
    const commentData = await CommentDataAccess.create({
      postId,
      text,
      author,
    });
    return new Comment(commentData);
  }
  static async getById(commentId) {
    const commentData = await CommentDataAccess.getOne(commentId);
    if (!commentData)
      throw new ExpressError(
        `No comment found with commentId ${commentId}`,
        404
      );
    return new Comment(commentData);
  }
  static async getAll({ postId, author }) {
    const commentsData = await CommentDataAccess.getAll({
      postId: postId,
      author,
    });
    return commentsData.map((comment) => new Comment(comment));
  }
  static async countTotal() {
    const totalComments = await CommentDataAccess.countTotal();
    return totalComments;
  }
}

module.exports = Comment;
