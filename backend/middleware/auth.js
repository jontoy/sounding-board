const jwt = require("jsonwebtoken");
const { SECRET } = require("../config");

/** Authentication middleware. Checks for the presence of a token.
 * If present, verifies its authenticity and attaches username/admin
 * payload to req.
 *
 * If invalid token, raises 401 error.
 */
const authUser = (req, res, next) => {
  try {
    const token = req.body._token || req.query._token;
    if (token) {
      let payload = jwt.verify(token, SECRET);
      req.username = payload.username;
    }
    return next();
  } catch (err) {
    err.status = 401;
    return next(err);
  }
};

/** Authorization middleware. Checks for the presence of curr_username on request.
 *
 * If missing, raises 403 error.
 */
const requireLogin = (req, res, next) => {
  try {
    if (req.username) {
      return next();
    } else {
      return next({ status: 403, message: "User must be logged in" });
    }
  } catch (err) {
    return next(err);
  }
};
/** Authorization middleware. Checks for the presence of curr_username on request.
 *
 * If missing or not matching params username, raises 403 error.
 */
const requireCorrectUser = (req, res, next) => {
  try {
    if (req.username && req.params.username === req.username) {
      return next();
    } else {
      return next({ status: 403, message: "Unauthorized" });
    }
  } catch (err) {
    return next(err);
  }
};

/** Authorization middleware. Checks for the presence of curr_admin on request.
 *
 * If missing or false, raises 403 error.
 */
const requireAdmin = (req, res, next) => {
  try {
    if (req.is_admin) {
      return next();
    } else {
      return next({ status: 403, message: "Unauthorized" });
    }
  } catch (err) {
    return next(err);
  }
};

module.exports = { authUser, requireLogin, requireCorrectUser, requireAdmin };
