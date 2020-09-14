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
  static async getAll({ postId, tagId }) {
    let baseQuery = "SELECT post_id, tag_id FROM posttags";
    const whereExpressions = [];
    const queryValues = [];
    if (postId && postId.length > 0) {
      queryValues.push(`%${postId}%`);
      whereExpressions.push(`post_id ILIKE $${queryValues.length}`);
    }
    if (tagId && tagId.length > 0) {
      queryValues.push(`%${tagId}%`);
      whereExpressions.push(`tag_id ILIKE $${queryValues.length}`);
    }
    if (whereExpressions.length > 0) {
      baseQuery += " WHERE ";
    }
    const finalQuery = baseQuery + whereExpressions.join(" AND ");
    const results = await db.query(finalQuery, queryValues);
    return results.rows.map(({ post_id, tag_id }) => ({
      postId: post_id,
      tagId: tag_id,
    }));
  }

  /** Creates a tag and returns full post-tag info: {post_id, tag_id} **/
  static async create({ postId, tagId }) {
    const result = await db.query(
      `INSERT INTO posttags
            (post_id, tag_id)
            VALUES ($1, $2)
            RETURNING post_id, tag_id`,
      [postId, tagId]
    );
    const postTag = result.rows[0];
    PostTag.deserialize(postTag);
    return postTag;
  }
  /** Returns post-tag info: {id, name}
   *
   * If post-tag cannot be found, raises a 404 error.
   *
   **/
  static async getOne(postId, tagId) {
    const result = await db.query(
      `SELECT post_id, tag_id 
        FROM posttags
        WHERE post_id = $1
        AND tag_id = $2`,
      [postId, tagId]
    );
    const postTag = result.rows[0];
    if (!tag) {
      throw new ExpressError(
        `No post-tag found with post_id ${postId} and tag_id ${tagId}`,
        404
      );
    }
    PostTag.deserialize(postTag);
    return postTag;
  }

  /** Deletes post-tag. Returns true.
   *
   * If post-tag cannot be found, raises a 404 error.
   *
   **/
  static async delete(postId, tagId) {
    const result = await db.query(
      `DELETE FROM posttags 
        WHERE post_id = $1
        AND tag_id = $2
        RETURNING post_id, tag_id`,
      [postId, tagId]
    );
    if (!result.rows[0]) {
      throw new ExpressError(
        `No post-tag found with post_id ${postId} and tag_id ${tagId}`,
        404
      );
    }
    return true;
  }
  static deserialize(postTag) {
    postTag.postId = postTag.post_id;
    postTag.tagId = postTag.tag_id;
    delete postTag.post_id;
    delete postTag.tag_id;
  }
}

module.exports = PostTag;
