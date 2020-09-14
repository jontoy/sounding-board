const db = require("../db");
const ExpressError = require("../helpers/expressError");
const sqlForPartialUpdate = require("../helpers/partialUpdate");

/** The data access layer relating to vote queries */
class Vote {
  /** Returns list of basic vote info:
   *
   * [{post_id, username, value}, ...]
   *
   * Optionally allows filtering by post_id and username
   * */
  static async getAll({ postId, username }) {
    let baseQuery = "SELECT post_id, username, value FROM votes";
    const whereExpressions = [];
    const queryValues = [];
    if (postId && post_id.length > 0) {
      queryValues.push(postId);
      whereExpressions.push(`post_id = $${queryValues.length}`);
    }
    if (username && username.length > 0) {
      queryValues.push(username);
      whereExpressions.push(`username = $${queryValues.length}`);
    }
    if (whereExpressions.length > 0) {
      baseQuery += " WHERE ";
    }
    const finalQuery = baseQuery + whereExpressions.join(" AND ");
    const results = await db.query(finalQuery, queryValues);
    return results.rows.map(({ post_id, username, value }) => ({
      postId: post_id,
      username,
      value,
    }));
  }

  /** Creates a vote and returns full vote info: {post_id, username, value} **/
  static async create({ postId, username, value }) {
    const result = await db.query(
      `INSERT INTO votes
            (post_id, username, value)
            VALUES ($1, $2, $3)
            RETURNING post_id, username, value`,
      [postId, username, value]
    );
    const vote = result.rows[0];
    Vote.deserialize(vote);
    return vote;
  }
  /** Returns vote info: {post_id, username, value}
   *
   * If vote cannot be found, raises a 404 error.
   *
   **/
  static async getOne(postId, username) {
    const result = await db.query(
      `SELECT post_id, username, value 
        FROM votes
        WHERE post_id = $1
        AND username = $2`,
      [postId, username]
    );
    const vote = result.rows[0];
    if (!vote) {
      throw new ExpressError(
        `No vote found with post_id ${postId} and username ${username}`,
        404
      );
    }
    Vote.deserialize(vote);
    return vote;
  }

  /** Selectively updates vote from given data
   *
   * Returns all data about vote.
   *
   * If vote cannot be found, raises a 404 error.
   *
   **/
  static async update(postId, username, value) {
    const result = await db.query(
      `UPDATE votes SET value = $3
          WHERE post_id = $1
          AND username = $2
          RETURNING post_id, username, value`,
      [postId, username, value]
    );
    const vote = result.rows[0];
    if (vote) {
      Vote.deserialize(vote);
    }
    return vote;
  }
  /** Deletes vote. Returns true.
   *
   * Returns true if vote is exists.
   *
   **/
  static async delete(postId, username) {
    const result = await db.query(
      `DELETE FROM votes 
        WHERE post_id = $1
        AND username = $2
        RETURNING post_id, username`,
      [postId, username]
    );
    return !!result.rows[0];
  }
  static deserialize(vote) {
    vote.postId = vote.post_id;
    delete vote.post_id;
  }
}

module.exports = Vote;
