/** Shared config for application; can be req'd many places. */

require("dotenv").config();

const PORT = +process.env.PORT || 3001;
const SECRET = process.env.SECRET_KEY || "test";
// database is:
//
// - on Heroku, get from env var DATABASE_URL
// - else: 'sounding-board'

let DB_URI;

DB_URI = process.env.DATABASE_URL || "sounding-board";

const BCRYPT_WORK_FACTOR = +process.env.BCRYPT_WORK_FACTOR || 12;
module.exports = {
  PORT,
  SECRET,
  DB_URI,
  BCRYPT_WORK_FACTOR,
};
