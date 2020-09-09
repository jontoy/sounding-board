const db = require("../db");

/** The data access layer relating to tag queries */
class Tag {
  /** Returns list of basic tag info:
   *
   * [{id, name}, ...]
   *
   * Optionally allows filtering by name, post_id
   * */
  static async getAll({ name }) {
    let baseQuery = `SELECT t.id, t.name, count(pt.tag_id) as total_posts FROM tags t
                      LEFT JOIN posttags pt ON pt.tag_id = t.id`;
    const whereExpressions = [];
    const queryValues = [];
    if (name && name.length > 0) {
      queryValues.push(`%${name}%`);
      whereExpressions.push(`name ILIKE $${queryValues.length}`);
    }
    if (whereExpressions.length > 0) {
      baseQuery += " WHERE ";
    }
    const finalQuery =
      baseQuery +
      whereExpressions.join(" AND ") +
      " GROUP BY t.id ORDER BY name";
    const results = await db.query(finalQuery, queryValues);
    return results.rows;
  }

  /** Returns list of basic tag info for specified post_id: */
  static async getAllByPostId(post_id) {
    const results = await db.query(
      `SELECT t.id, t.name, count(pt.tag_id) as total_posts FROM tags t
          LEFT JOIN posttags pt ON pt.tag_id = t.id
          WHERE pt.post_id = $1
          GROUP BY t.id`,
      [post_id]
    );
    return results.rows;
  }

  /** Creates a tag and returns full tag info: {id, name} **/
  static async create({ name }) {
    const result = await db.query(
      `INSERT INTO tags
            (name)
            VALUES ($1)
            RETURNING id, name`,
      [name]
    );
    return result.rows[0];
  }
  /** Returns tag info: {id, name}
   *
   * If tag cannot be found, raises a 404 error.
   *
   **/
  static async getOne(id) {
    const result = await db.query(
      `SELECT t.id, t.name, count(pt.tag_id) as total_posts
        FROM tags t LEFT JOIN posttags pt ON t.id = pt.tag_id
        WHERE t.id = $1 
        GROUP BY t.id`,
      [id]
    );
    const tag = result.rows[0];
    return tag;
  }

  /** Selectively updates tag from given data
   *
   * Returns all data about tag.
   *
   * If tag cannot be found, raises a 404 error.
   *
   **/
  static async update(id, name) {
    const result = await db.query(
      `UPDATE tags SET name = $2
            WHERE id = $1
            RETURNING id, name`,
      [id, name]
    );
    const tag = result.rows[0];
    return tag;
  }
  /** Deletes tag. Returns true.
   *
   * If tag cannot be found, raises a 404 error.
   *
   **/
  static async delete(id) {
    const result = await db.query(
      `DELETE FROM tags 
        WHERE id = $1
        RETURNING id`,
      [id]
    );
    return true;
  }
}

module.exports = Tag;
