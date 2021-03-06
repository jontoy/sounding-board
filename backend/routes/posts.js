/** Routes for users. */

const express = require("express");
const router = express.Router();

const { requireLogin } = require("../middleware/auth");

const DetailedUser = require("../models/detailedUser");
const Post = require("../models/post");
const DetailedPost = require("../models/detailedPost");
const Comment = require("../models/comment");
const Tag = require("../models/tag");

const {
  postUpdateSchema,
  postNewSchema,
  commentSchema,
} = require("../schemas");

const {
  requireProperSchema,
  validateSchema,
} = require("../middleware/validate");

const { validateOwnership } = require("../helpers/validateOwnership");

// Post Routes

/** GET / => {post: [postData, ...]} */

router.get("/", async function (req, res, next) {
  try {
    const { title, author, tagId, sort } = req.query;
    const posts = await Post.getAll({ title, author, tagId, sort });
    return res.json({ posts });
  } catch (err) {
    return next(err);
  }
});

/** POST / {postData}  => {post:newPost} */

router.post(
  "/",
  requireLogin,
  requireProperSchema(postNewSchema),
  async function (req, res, next) {
    try {
      const user = await DetailedUser.getById(req.username);
      const post = await user.createPost(req.body);
      return res.status(201).json({ post });
    } catch (e) {
      return next(e);
    }
  }
);

/** GET /[postId] => {post: postData} */

router.get("/:postId", async function (req, res, next) {
  try {
    const post = await DetailedPost.getById(req.params.postId);
    return res.json({ post });
  } catch (err) {
    return next(err);
  }
});

/** PUT /[postId] {postData} => {post: updatedPost} */

router.put(
  "/:postId",
  requireLogin,
  requireProperSchema(postUpdateSchema),
  async function (req, res, next) {
    try {
      const post = await DetailedPost.getById(req.params.postId);
      validateOwnership(post.author, req);
      post.title = req.body.title || post.title;
      post.body = req.body.body || post.body;
      await post.sync();
      return res.json({ post });
    } catch (err) {
      return next(err);
    }
  }
);

/** DELETE /[postId]  =>  {message: "Post [postId] deleted"}  */

router.delete("/:postId", requireLogin, async function (req, res, next) {
  try {
    const post = await DetailedPost.getById(req.params.postId);
    validateOwnership(post.author, req);
    await post.remove();
    return res.json({ message: `Post ${post.id} deleted.` });
  } catch (err) {
    return next(err);
  }
});

// Comment Routes

/** GET /[postId]/comments/ => {comments: [commentData, ...]} */

router.get("/:postId/comments", async function (req, res, next) {
  try {
    const post = await DetailedPost.getById(req.params.postId);
    const comments = await Comment.getAll({ postId: post.id });
    return res.json({ comments });
  } catch (err) {
    return next(err);
  }
});

/** POST /[postId]/comments/ {commentData}  => {comment:newCommentt} */

router.post(
  "/:postId/comments",
  requireLogin,
  requireProperSchema(commentSchema),
  async function (req, res, next) {
    try {
      const user = await DetailedUser.getById(req.username);
      const post = await DetailedPost.getById(req.params.postId);
      const comment = await Comment.create(
        post.id,
        req.body.text,
        user.username
      );
      return res.status(201).json({ comment });
    } catch (e) {
      return next(e);
    }
  }
);

/** GET /[postId]/comments/[commentId] => {comment: comment} */

router.get("/:postId/comments/:commentId", async function (req, res, next) {
  try {
    const comment = await Comment.getById(req.params.commentId);
    return res.json({ comment });
  } catch (err) {
    return next(err);
  }
});

/** PUT /[postId]/comments/[commentId] {text} => {comment: updatedComment} */

router.put(
  "/:postId/comments/:commentId",
  requireLogin,
  requireProperSchema(commentSchema),
  async function (req, res, next) {
    try {
      const comment = await Comment.getById(req.params.commentId);
      validateOwnership(comment.author, req);
      comment.text = req.body.text || comment.text;
      await comment.sync();
      return res.json({ comment });
    } catch (err) {
      return next(err);
    }
  }
);

/** DELETE /[postId]/comments/[commentId]  =>  {message: "Comment [commentId] deleted"}  */

router.delete("/:postId/comments/:commentId", requireLogin, async function (
  req,
  res,
  next
) {
  try {
    const comment = await Comment.getById(req.params.commentId);
    validateOwnership(comment.author, req);
    await comment.remove();
    return res.json({ message: `Comment ${comment.commentId} deleted.` });
  } catch (err) {
    return next(err);
  }
});

// Post Tag Routes

/** POST /[postId]/tags/[tagId]  =>  {message: "Tag [tag.name] removed from post [postId]"}  */
router.post("/:postId/tags/:tagId", requireLogin, async function (
  req,
  res,
  next
) {
  try {
    const post = await DetailedPost.getById(req.params.postId);
    validateOwnership(post.author, req);
    const tag = await Tag.getById(req.params.tagId);
    await post.addTag(tag);
    return res.json({
      post,
    });
  } catch (err) {
    return next(err);
  }
});

/** DELETE /[postId]/tags/[tagId]  =>  {message: "Tag [tag.name] removed from post [postId]"}  */
router.delete("/:postId/tags/:tagId", requireLogin, async function (
  req,
  res,
  next
) {
  try {
    const post = await DetailedPost.getById(req.params.postId);
    validateOwnership(post.author, req);
    const tag = await Tag.getById(req.params.tagId);
    await post.removeTag(tag);
    return res.json({
      post,
    });
  } catch (err) {
    return next(err);
  }
});

// Vote routes

/** POST /[postId]/upvote  =>  {message: "User [user.username] has upvoted [postId]", post:post}  */
router.post("/:postId/upvote", requireLogin, async function (req, res, next) {
  try {
    const post = await DetailedPost.getById(req.params.postId);
    const user = await DetailedUser.getById(req.username);
    await user.upvote(post);
    return res.json({
      message: `User ${user.username} has upvoted post ${post.id}`,
      user,
      post,
    });
  } catch (err) {
    return next(err);
  }
});

/** POST /[postId]/downvote  =>  {message: "User [user.username] has downvoted [postId]", post:post}  */
router.post("/:postId/downvote", requireLogin, async function (req, res, next) {
  try {
    const post = await DetailedPost.getById(req.params.postId);
    const user = await DetailedUser.getById(req.username);
    await user.downvote(post);
    return res.json({
      message: `User ${user.username} has downvoted post ${post.id}`,
      user,
      post,
    });
  } catch (err) {
    return next(err);
  }
});
module.exports = router;
