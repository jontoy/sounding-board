const db = require("../db");
const ExpressError = require("../helpers/expressError");
const sqlForPartialUpdate = require("../helpers/partialUpdate");

/** The data access layer relating to post queries */
class Post {
  /** Returns list of full post info:
   *
   * [{id, title, author, body, created_at}, ...]
   *
   * Optionally allows filtering by title
   * Results are sorted by created_at
   * */
  static async getAll({ title, author }) {
    let baseQuery = `SELECT p.id, p.title, p.author, p.body, p.created_at, SUM(v.value) as net_votes 
                      FROM posts p LEFT JOIN votes v ON v.post_id = p.id`;
    const whereExpressions = [];
    const queryValues = [];
    if (title && title.length > 0) {
      queryValues.push(`%${title}%`);
      whereExpressions.push(`p.title ILIKE $${queryValues.length}`);
    }
    if (author && author.length > 0) {
      queryValues.push(author);
      whereExpressions.push(`p.author = $${queryValues.length}`);
    }
    if (whereExpressions.length > 0) {
      baseQuery += " WHERE ";
    }
    const finalQuery =
      baseQuery +
      whereExpressions.join(" AND ") +
      " GROUP BY p.id ORDER BY created_at";
    const results = await db.query(finalQuery, queryValues);
    return results.rows;
  }

  /** Creates a post and returns full post info: {id, title, author, body, created_at} **/
  static async create({ title, author, body }) {
    const result = await db.query(
      `INSERT INTO posts
            (title, author, body)
            VALUES ($1, $2, $3)
            RETURNING id, title, author, body, created_at`,
      [title, author, body]
    );
    return result.rows[0];
  }
  /** Returns post info: {id, title, author, body, created_at}
   *
   * If post cannot be found, raises a 404 error.
   *
   **/
  static async getOne(id) {
    const result = await db.query(
      `SELECT p.id, p.title, p.author, p.body, p.created_at, SUM(v.value) as net_votes
        FROM posts p LEFT JOIN votes v ON v.post_id = p.id
        WHERE p.id = $1 GROUP BY p.id`,
      [id]
    );
    const post = result.rows[0];
    if (!post) {
      throw new ExpressError(`No post found with id ${id}`, 404);
    }
    return post;
  }

  /** Selectively updates post from given data
   *
   * Returns all data about post.
   *
   * If post cannot be found, raises a 404 error.
   *
   **/
  static async update(id, data) {
    let { query, values } = sqlForPartialUpdate("posts", data, "id", id);
    const result = await db.query(query, values);
    const post = result.rows[0];
    if (!post) {
      throw new ExpressError(`No post found with id ${id}`, 404);
    }
    return post;
  }
  /** Deletes post. Returns true.
   *
   * If post cannot be found, raises a 404 error.
   *
   **/
  static async delete(id) {
    const result = await db.query(
      `DELETE FROM posts 
        WHERE id = $1
        RETURNING id`,
      [id]
    );
    if (!result.rows[0]) {
      throw new ExpressError(`No post found with id ${id}`, 404);
    }
    return true;
  }
}

module.exports = Post;
