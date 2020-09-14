/** Routes for user authentication. */

const express = require("express");
const router = express.Router();

const DetailedUser = require("../models/detailedUser");
const { validate } = require("jsonschema");

const { userNewSchema } = require("../schemas");

const createToken = require("../helpers/createToken");
const ExpressError = require("../helpers/expressError");

/** POST /register {userdata}  => {token: token} */

router.post("/register", async function (req, res, next) {
  try {
    delete req.body._token;
    const validation = validate(req.body, userNewSchema);

    if (!validation.valid) {
      return next({
        status: 400,
        message: validation.errors.map((e) => e.stack),
      });
    }

    const newUser = await DetailedUser.create(req.body);
    const token = createToken(newUser);
    return res.status(201).json({ token });
  } catch (e) {
    return next(e);
  }
});

router.post("/login", async function (req, res, next) {
  try {
    const { username, password } = req.body;
    const user = await DetailedUser.authenticate({ username, password });
    if (!user) throw new ExpressError("Invalid login credentials", 401);
    const token = createToken(user);
    return res.status(200).json({ token });
  } catch (e) {
    return next(e);
  }
});

module.exports = router;
