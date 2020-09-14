process.env.DATABASE_URL = "sounding-board-test";
process.env.VERBOSE_ERRORS = "s";

const app = require("../../../app");
const request = require("supertest");
const db = require("../../../db");
const jwt = require("jsonwebtoken");
const createToken = require("../../../helpers/createToken");
const User = require("../../../models/user");
const Comment = require("../../../models/comment");

let testUser;
let testPost;
let testComment;
let testUserW;
let token;
let badToken = jwt.sign({ username: "routeC1" }, "invalid-key");
beforeAll(async function () {
  testUserW = await User.create({ username: "routeCW", password: "passwordW" });
});
beforeEach(async function () {
  testUser = await User.create({ username: "routeC1", password: "password1" });
  token = createToken(testUser);
  testPost = await testUser.createPost({ title: "tc1", body: "bc1" });
  testComment = await Comment.create(testPost.id, "first", testUser.username);
});

afterEach(async function () {
  await testUser.remove();
});

describe("GET /posts/:postId/comments", function () {
  let testComment2;
  beforeEach(async function () {
    testComment2 = await Comment.create(
      testPost.id,
      "second",
      testUser.username
    );
  });
  afterEach(async function () {
    await testComment2.remove();
  });
  it("should return list of all posts when given no parameters", async function () {
    const response = await request(app).get(`/posts/${testPost.id}/comments`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.comments).toEqual(
      expect.arrayContaining([
        { ...testComment, createdAt: expect.any(String) },
        { ...testComment2, createdAt: expect.any(String) },
      ])
    );
  });
});

describe("GET /posts/:postId/comments/:commentId", function () {
  it("should return detailed information on a single comment", async function () {
    const response = await request(app).get(
      `/posts/${testPost.id}/comments/${testComment.commentId}`
    );
    expect(response.statusCode).toEqual(200);
    expect(response.body.comment).toEqual({
      ...testComment,
      createdAt: expect.any(String),
    });
  });
  it("should return a 404 if given an invalid commentId", async function () {
    const response = await request(app).get(
      `/posts/${testPost.id}/comments/00000000-0000-0000-0000-000000000000`
    );
    expect(response.statusCode).toEqual(404);
  });
});

describe("POST /posts/:postId/comments", function () {
  it("should create a new comment by the associated user", async function () {
    const newComment = {
      text: "new comment",
    };

    let response = await request(app)
      .post(`/posts/${testPost.id}/comments`)
      .send({ ...newComment, _token: token });
    expect(response.statusCode).toEqual(201);
    expect(response.body.comment).toEqual({
      ...newComment,
      commentId: expect.any(String),
      postId: testPost.id,
      createdAt: expect.any(String),
      author: testUser.username,
    });
    const commentId = response.body.comment.commentId;
    response = await request(app).get(
      `/posts/${testPost.id}/comments/${commentId}`
    );
    expect(response.statusCode).toEqual(200);
    expect(response.body.comment).toEqual({
      ...newComment,
      commentId: commentId,
      postId: testPost.id,
      createdAt: expect.any(String),
      author: testUser.username,
    });
    await request(app)
      .delete(`/posts/${testPost.id}/comments/${commentId}`)
      .send({ _token: token });
  });
});

describe("PATCH /posts/:postId/comments/:commentId", function () {
  it("should modify an existing comment", async function () {
    const updatedCommentInfo = {
      text: "updated text",
    };

    let response = await request(app)
      .patch(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send({ ...updatedCommentInfo, _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.comment).toEqual({
      ...testComment,
      ...updatedCommentInfo,
      createdAt: expect.any(String),
    });
    response = await request(app)
      .get(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.comment).toEqual({
      ...testComment,
      ...updatedCommentInfo,
      createdAt: expect.any(String),
    });
  });
  it("should deny access if no token is present", async function () {
    const updatedCommentInfo = {
      text: "updated text",
    };

    let response = await request(app)
      .patch(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send(updatedCommentInfo);
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token is present", async function () {
    const updatedCommentInfo = {
      text: "updated text",
    };

    let response = await request(app)
      .patch(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send({ ...updatedCommentInfo, _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access if incorrect user", async function () {
    const updatedCommentInfo = {
      text: "updated text",
    };

    let response = await request(app)
      .patch(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send({ ...updatedCommentInfo, _token: createToken(testUserW) });
    expect(response.statusCode).toEqual(403);
  });
});

describe("DELETE /posts/:postId/commments/:commentId", function () {
  it("should delete an existing comment", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
  });
  it("should deny access if no token is present", async function () {
    let response = await request(app).delete(
      `/posts/${testPost.id}/comments/${testComment.commentId}`
    );
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token is present", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access if incorrect user", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}/comments/${testComment.commentId}`)
      .send({ _token: createToken(testUserW) });
    expect(response.statusCode).toEqual(403);
  });
});

afterAll(async function () {
  await testUserW.remove();
  db.end();
});
