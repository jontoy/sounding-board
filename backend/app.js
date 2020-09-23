/** Express app for the Sounding Board API. */

const express = require("express");

const ExpressError = require("./helpers/expressError");
const { VERBOSE_ERRORS } = require("./config");
const morgan = require("morgan");
const { authUser } = require("./middleware/auth");
const app = express();

app.use(express.json());
app.use(function (req, res, next) {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Methods", "*");
  next();
});
app.use(morgan("tiny"));
app.use(authUser);

const usersRoutes = require("./routes/users");
const postsRoutes = require("./routes/posts");
const tagRoutes = require("./routes/tags");
const authRoutes = require("./routes/auth");
const statsRoutes = require("./routes/stats");

app.use("/users", usersRoutes);
app.use("/posts", postsRoutes);
app.use("/tags", tagRoutes);
app.use("/stats", statsRoutes);
app.use("/", authRoutes);

app.get("/", (req, res, next) => {
  return res.json({ message: "Welcome to the Sounding Board API" });
});

/** 404 handler */

app.use(function (req, res, next) {
  const err = new ExpressError("Not Found", 404);

  // pass the error to the next piece of middleware
  return next(err);
});

/** general error handler */

app.use(function (err, req, res, next) {
  res.status(err.status || 500);
  if (VERBOSE_ERRORS === "v") {
    console.error(err.stack);
  }
  return res.json({
    status: err.status,
    message: err.message,
  });
});

module.exports = app;
