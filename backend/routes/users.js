/** Routes for users. */

const express = require("express");
const router = express.Router();

const { requireCorrectUser, requireLogin } = require("../middleware/auth");

const User = require("../models/user");
const DetailedUser = require("../models/detailedUser");

const { userUpdateSchema } = require("../schemas");

const {
  requireProperSchema,
  validateSchema,
} = require("../middleware/validate");

/** GET / => {users: [user, ...]} */

router.get("/", requireLogin, async function (req, res, next) {
  try {
    const { username } = req.query;
    const users = await User.getAll({ username });
    return res.json({ users });
  } catch (err) {
    return next(err);
  }
});

/** GET /[username] => {user: user} */

router.get("/:username", requireLogin, async function (req, res, next) {
  try {
    const user = await DetailedUser.getById(req.params.username);
    return res.json({ user });
  } catch (err) {
    return next(err);
  }
});

/** PUT /[username] {userData} => {user: updatedUser} */

router.put(
  "/:username",
  requireCorrectUser,
  requireProperSchema(userUpdateSchema),
  async function (req, res, next) {
    try {
      const user = await DetailedUser.getById(req.params.username);
      user.avatarUrl = req.body.avatarUrl || user.avatarUrl;
      user.bio = req.body.bio || user.bio;
      await user.sync();
      return res.json({ user });
    } catch (err) {
      return next(err);
    }
  }
);

/** DELETE /[username]  =>  {message: "User deleted"}  */

router.delete("/:username", requireCorrectUser, async function (
  req,
  res,
  next
) {
  try {
    const user = await DetailedUser.getById(req.params.username);
    await user.remove();
    return res.json({ message: `User ${user.username} deleted.` });
  } catch (err) {
    return next(err);
  }
});

module.exports = router;
