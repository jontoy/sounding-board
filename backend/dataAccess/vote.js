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
  static async getAll({ post_id, username }) {
    let baseQuery = "SELECT post_id, username, value FROM votes";
    const whereExpressions = [];
    const queryValues = [];
    if (post_id && post_id.length > 0) {
      queryValues.push(post_id);
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
    return results.rows;
  }

  /** Creates a vote and returns full vote info: {post_id, username, value} **/
  static async create({ post_id, username, value }) {
    const result = await db.query(
      `INSERT INTO votes
            (post_id, username, value)
            VALUES ($1, $2, $3)
            RETURNING post_id, username, value`,
      [post_id, username, value]
    );
    return result.rows[0];
  }
  /** Returns vote info: {post_id, username, value}
   *
   * If vote cannot be found, raises a 404 error.
   *
   **/
  static async getOne(post_id, username) {
    const result = await db.query(
      `SELECT post_id, username, value 
        FROM votes
        WHERE post_id = $1
        AND username = $2`,
      [post_id, username]
    );
    const vote = result.rows[0];
    if (!vote) {
      throw new ExpressError(
        `No vote found with post_id ${post_id} and username ${username}`,
        404
      );
    }
    return vote;
  }

  /** Selectively updates vote from given data
   *
   * Returns all data about vote.
   *
   * If vote cannot be found, raises a 404 error.
   *
   **/
  static async update(post_id, username, value) {
    const result = await db.query(
      `UPDATE votes SET value = $3
          WHERE post_id = $1
          AND username = $2
          RETURNING post_id, username, value`,
      [post_id, username, value]
    );
    const vote = result.rows[0];
    return vote;
  }
  /** Deletes vote. Returns true.
   *
   * Returns true if vote is exists.
   *
   **/
  static async delete(post_id, username) {
    const result = await db.query(
      `DELETE FROM votes 
        WHERE post_id = $1
        AND username = $2
        RETURNING post_id, username`,
      [post_id, username]
    );
    return !!result.rows[0];
  }
}

module.exports = Vote;
