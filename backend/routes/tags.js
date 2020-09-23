/** Routes for tags. */

const express = require("express");
const router = express.Router();

const { requireLogin } = require("../middleware/auth");

const Tag = require("../models/tag");
const {
  requireProperSchema,
  validateSchema,
} = require("../middleware/validate");
const { tagSchema } = require("../schemas");

/** GET / => {tags: [tag, ...]} */

router.get("/", async function (req, res, next) {
  try {
    const { name, sort } = req.query;
    const tags = await Tag.getAll({ name, sort });
    return res.json({ tags });
  } catch (err) {
    return next(err);
  }
});

/** POST / => {tag: newTagData} */

router.post("/", requireLogin, requireProperSchema(tagSchema), async function (
  req,
  res,
  next
) {
  try {
    const tag = await Tag.create(req.body.name);
    return res.status(201).json({ tag });
  } catch (err) {
    return next(err);
  }
});

/** GET /[tagId] => {tag: tag} */

router.get("/:tagId", async function (req, res, next) {
  try {
    const tag = await Tag.getById(req.params.tagId);
    return res.json({ tag });
  } catch (err) {
    return next(err);
  }
});

/** DELETE /[tagId]  =>  {message: "Tag [tagId] deleted"}  */

router.delete("/:tagId", requireLogin, async function (req, res, next) {
  try {
    const tag = await Tag.getById(req.params.tagId);
    await tag.remove();
    return res.json({ message: `Tag ${tag.id} deleted.` });
  } catch (err) {
    return next(err);
  }
});

module.exports = router;
