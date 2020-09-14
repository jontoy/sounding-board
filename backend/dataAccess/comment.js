const db = require("../db");
const sqlForPartialUpdate = require("../helpers/partialUpdate");

/** The data access layer relating to comment queries */
class Comment {
  /** Returns list of basic comment info:
   *
   * [{comment_id, post_id, text, author, created_at}, ...]
   *
   * Allows filtering by post_id, author
   *
   * */
  static async getAll({ postId, author }) {
    let baseQuery =
      "SELECT comment_id, post_id, text, author, created_at FROM comments";
    const whereExpressions = [];
    const queryValues = [];
    if (postId && postId.length > 0) {
      queryValues.push(postId);
      whereExpressions.push(`post_id = $${queryValues.length}`);
    }
    if (author && author.length > 0) {
      queryValues.push(author);
      whereExpressions.push(`author = $${queryValues.length}`);
    }
    if (whereExpressions.length > 0) {
      baseQuery += " WHERE ";
    }
    const finalQuery =
      baseQuery + whereExpressions.join(" AND ") + " ORDER BY created_at";
    const results = await db.query(finalQuery, queryValues);
    return results.rows.map(
      ({ comment_id, post_id, text, author, created_at }) => ({
        commentId: comment_id,
        postId: post_id,
        text,
        author,
        createdAt: created_at,
      })
    );
  }

  /** Creates a comment and returns full comment info:
   * {comment_id, post_id, text, author, created_at} **/
  static async create({ postId, text, author }) {
    const result = await db.query(
      `INSERT INTO comments
            (post_id, text, author)
            VALUES ($1, $2, $3)
            RETURNING comment_id, post_id, text, author, created_at`,
      [postId, text, author]
    );
    const comment = result.rows[0];
    Comment.deserialize(comment);
    return comment;
  }
  /** Returns comment info: {comment_id, post_id, text, author, created_at}
   *
   * If comment cannot be found, raises a 404 error.
   *
   **/
  static async getOne(commentId) {
    const result = await db.query(
      `SELECT comment_id, post_id, text, author, created_at 
        FROM comments
        WHERE comment_id = $1`,
      [commentId]
    );
    const comment = result.rows[0];
    if (comment) {
      Comment.deserialize(comment);
    }
    return comment;
  }

  /** Selectively updates comment from given data
   *
   * Returns all data about comment.
   *
   * If comment cannot be found, raises a 404 error.
   *
   **/
  static async update(commentId, data) {
    let { query, values } = sqlForPartialUpdate(
      "comments",
      data,
      "comment_id",
      commentId
    );
    const result = await db.query(query, values);
    const comment = result.rows[0];
    if (comment) {
      Comment.deserialize(comment);
    }
    return comment;
  }
  /** Deletes comment. Returns true.
   *
   * If comment cannot be found, raises a 404 error.
   *
   **/
  static async delete(commentId) {
    const result = await db.query(
      `DELETE FROM comments 
        WHERE comment_id = $1
        RETURNING comment_id`,
      [commentId]
    );
    return !!result.rows[0];
  }

  static deserialize(comment) {
    comment.commentId = comment.comment_id;
    comment.postId = comment.post_id;
    comment.createdAt = comment.created_at;
    delete comment.comment_id;
    delete comment.post_id;
    delete comment.created_at;
  }
}

module.exports = Comment;
