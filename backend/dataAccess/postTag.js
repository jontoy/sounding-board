const db = require("../db");
const ExpressError = require("../helpers/expressError");

/** The data access layer relating to post-tag queries */
class PostTag {
  /** Returns list of basic post-tag info:
   *
   * [{post_id, tag_id}, ...]
   *
   * Optionally allows filtering by post_id and tag_id
   * */
  static async getAll({ post_id, tag_id }) {
    let baseQuery = "SELECT post_id, tag_id, timestamp FROM posttags";
    const whereExpressions = [];
    const queryValues = [];
    if (post_id && post_id.length > 0) {
      queryValues.push(`%${post_id}%`);
      whereExpressions.push(`post_id ILIKE $${queryValues.length}`);
    }
    if (tag_id && tag_id.length > 0) {
      queryValues.push(`%${tag_id}%`);
      whereExpressions.push(`tag_id ILIKE $${queryValues.length}`);
    }
    if (whereExpressions.length > 0) {
      baseQuery += " WHERE ";
    }
    const finalQuery = baseQuery + whereExpressions.join(" AND ");
    const results = await db.query(finalQuery, queryValues);
    return results.rows;
  }

  /** Creates a tag and returns full post-tag info: {post_id, tag_id} **/
  static async create({ post_id, tag_id }) {
    const result = await db.query(
      `INSERT INTO posttags
            (post_id, tag_id)
            VALUES ($1, $2)
            RETURNING post_id, tag_id`,
      [post_id, tag_id]
    );
    return result.rows[0];
  }
  /** Returns post-tag info: {id, name}
   *
   * If post-tag cannot be found, raises a 404 error.
   *
   **/
  static async getOne(post_id, tag_id) {
    const result = await db.query(
      `SELECT post_id, tag_id 
        FROM posttags
        WHERE post_id = $1
        AND tag_id = $2`,
      [post_id, tag_id]
    );
    const tag = result.rows[0];
    if (!tag) {
      throw new ExpressError(
        `No post-tag found with post_id ${post_id} and tag_id ${tag_id}`,
        404
      );
    }
    return tag;
  }

  /** Deletes post-tag. Returns true.
   *
   * If post-tag cannot be found, raises a 404 error.
   *
   **/
  static async delete(post_id, tag_id) {
    const result = await db.query(
      `DELETE FROM posttags 
        WHERE post_id = $1
        AND tag_id = $2
        RETURNING post_id, tag_id`,
      [post_id, tag_id]
    );
    if (!result.rows[0]) {
      throw new ExpressError(
        `No post-tag found with post_id ${post_id} and tag_id ${tag_id}`,
        404
      );
    }
    return true;
  }
}

module.exports = PostTag;
