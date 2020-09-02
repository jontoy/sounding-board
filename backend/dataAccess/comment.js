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
  static async getAll({ post_id, author }) {
    let baseQuery =
      "SELECT comment_id, post_id, text, author, created_at FROM comments";
    const whereExpressions = [];
    const queryValues = [];
    if (post_id && post_id.length > 0) {
      queryValues.push(post_id);
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
    return results.rows;
  }

  /** Creates a comment and returns full comment info:
   * {comment_id, post_id, text, author, created_at} **/
  static async create({ post_id, text, author }) {
    const result = await db.query(
      `INSERT INTO comments
            (post_id, text, author)
            VALUES ($1, $2, $3)
            RETURNING comment_id, post_id, text, author, created_at`,
      [post_id, text, author]
    );
    return result.rows[0];
  }
  /** Returns comment info: {comment_id, post_id, text, author, created_at}
   *
   * If comment cannot be found, raises a 404 error.
   *
   **/
  static async getOne(comment_id) {
    const result = await db.query(
      `SELECT comment_id, post_id, text, author, created_at 
        FROM comments
        WHERE comment_id = $1`,
      [comment_id]
    );
    const comment = result.rows[0];
    return comment;
  }

  /** Selectively updates comment from given data
   *
   * Returns all data about comment.
   *
   * If comment cannot be found, raises a 404 error.
   *
   **/
  static async update(comment_id, data) {
    let { query, values } = sqlForPartialUpdate(
      "comments",
      data,
      "comment_id",
      comment_id
    );
    const result = await db.query(query, values);
    const comment = result.rows[0];
    return comment;
  }
  /** Deletes comment. Returns true.
   *
   * If comment cannot be found, raises a 404 error.
   *
   **/
  static async delete(comment_id) {
    const result = await db.query(
      `DELETE FROM comments 
        WHERE comment_id = $1
        RETURNING comment_id`,
      [comment_id]
    );
    return !!result.rows[0];
  }
}

module.exports = Comment;
