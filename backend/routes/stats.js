/** Routes for users. */

const express = require("express");
const router = express.Router();

const User = require("../models/user");
const Post = require("../models/post");
const Comment = require("../models/comment");

/** GET / => {users: totalUsers, posts: totalPosts, comments: totalComments} */

router.get("/", async function (req, res, next) {
  try {
    const { username } = req.query;
    const totalUsers = await User.countTotal();
    const totalPosts = await Post.countTotal();
    const totalComments = await Comment.countTotal();
    return res.json({
      users: totalUsers,
      posts: totalPosts,
      comments: totalComments,
    });
  } catch (err) {
    return next(err);
  }
});

module.exports = router;
