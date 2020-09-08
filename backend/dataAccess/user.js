const db = require("../db");
const sqlForPartialUpdate = require("../helpers/partialUpdate");

/** The data access layer relating to user queries */
class User {
  /** Returns list of basic user info:
   *
   * [{username, avatar_url}, ...]
   *
   * Optionally allows filtering by username
   * */
  static async getAll({ username }) {
    let baseQuery = "SELECT username, avatar_url, bio FROM users";
    const whereExpressions = [];
    const queryValues = [];
    if (username && username.length > 0) {
      queryValues.push(`%${username}%`);
      whereExpressions.push(`username ILIKE $${queryValues.length}`);
    }
    if (whereExpressions.length > 0) {
      baseQuery += " WHERE ";
    }
    const finalQuery = baseQuery + whereExpressions.join(" AND ");
    const results = await db.query(finalQuery, queryValues);
    return results.rows;
  }

  /** Creates a user and returns full user info: {username, avatar_url, member_since, bio} **/
  static async create({
    username,
    password,
    bio,
    avatar_url = "https://s3.amazonaws.com/37assets/svn/765-default-avatar.png",
  }) {
    const result = await db.query(
      `INSERT INTO users
            (username, password, bio, avatar_url)
            VALUES ($1, $2, $3, $4)
            RETURNING username, avatar_url, member_since, bio`,
      [username, password, bio, avatar_url]
    );
    return result.rows[0];
  }
  static async fetchPassword(username) {
    const result = await db.query(
      `SELECT password FROM users
        WHERE username = $1`,
      [username]
    );
    const passwordData = result.rows[0];
    return passwordData.password;
  }

  /** Returns user info: {username, avatar_url, member_since, bio}
   *
   * If user cannot be found, raises a 404 error.
   *
   **/
  static async getOne(username) {
    const result = await db.query(
      `SELECT username, avatar_url, member_since, bio
        FROM users
        WHERE username = $1`,
      [username]
    );
    const user = result.rows[0];
    return user;
  }

  /** Selectively updates user from given data
   *
   * Returns all data about user.
   *
   * If user cannot be found, raises a 404 error.
   *
   **/
  static async update(username, data) {
    let { query, values } = sqlForPartialUpdate(
      "users",
      data,
      "username",
      username
    );
    const result = await db.query(query, values);
    const { password, ...user } = result.rows[0];
    return user;
  }
  /** Deletes user. Returns true. **/
  static async delete(username) {
    const result = await db.query(
      `DELETE FROM users 
        WHERE username = $1
        RETURNING username`,
      [username]
    );
    return !!result.rows[0];
  }
}

module.exports = User;
