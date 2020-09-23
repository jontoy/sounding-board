process.env.DATABASE_URL = "sounding-board-test";
process.env.VERBOSE_ERRORS = "s";

const app = require("../../../app");
const request = require("supertest");
const db = require("../../../db");
const jwt = require("jsonwebtoken");
const createToken = require("../../../helpers/createToken");
const User = require("../../../models/user");

let testUser;
let testPost;
let testUserY;
let testPostY;
let token;
let badToken = jwt.sign({ username: "routeP1" }, "invalid-key");
beforeAll(async function () {
  testUserY = await User.create({ username: "routePY", password: "passwordY" });
  testPostY = await testUserY.createPost({ title: "tpy1", body: "bpy1" });
});
beforeEach(async function () {
  testUser = await User.create({ username: "routeP1", password: "password1" });
  token = createToken(testUser);
  testPost = await testUser.createPost({ title: "tp1", body: "bp1" });
});

afterEach(async function () {
  await testUser.remove();
});

describe("GET /posts", function () {
  let testPost2;
  let testPost3;
  beforeAll(async function () {
    testPost2 = await testUserY.createPost({ title: "tp2", body: "bp2" });
    testPost3 = await testUserY.createPost({ title: "tp3", body: "bp3" });
  });
  afterAll(async function () {
    await testPost2.remove();
    await testPost3.remove();
  });
  it("should return list of all posts when given no parameters", async function () {
    const response = await request(app).get("/posts");
    expect(response.statusCode).toEqual(200);
    expect(response.body.posts.map((p) => p.id)).toEqual(
      expect.arrayContaining([testPost.id, testPost2.id, testPost3.id])
    );
  });
  it("should appropriately filter by title", async function () {
    const response = await request(app).get("/posts?title=tp2");
    expect(response.statusCode).toEqual(200);
    expect(response.body.posts[0].id).toEqual(testPost2.id);
  });
  it("should appropriately filter by author", async function () {
    const response = await request(app).get(
      `/posts?author=${testUserY.username}`
    );
    expect(response.statusCode).toEqual(200);
    expect(response.body.posts).toEqual(
      [testPost3, testPost2, testPostY].map(
        ({ author, body, createdAt, id, netVotes, title }) => ({
          author,
          body,
          createdAt: expect.any(String),
          id,
          netVotes: 1,
          title,
        })
      )
    );
  });
});

describe("GET /posts/:postId", function () {
  it("should return detailed information on a single post", async function () {
    const response = await request(app).get(`/posts/${testPost.id}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...testPost,
      createdAt: expect.any(String),
      netVotes: 1,
    });
  });
  it("should return a 404 if given an invalid id", async function () {
    const response = await request(app).get(
      "/posts/00000000-0000-0000-0000-000000000000"
    );
    expect(response.statusCode).toEqual(404);
  });
});

describe("POST /posts", function () {
  it("should create a new post by the associated user", async function () {
    const newPost = {
      title: "new post",
      body: "some body",
    };

    let response = await request(app)
      .post(`/posts`)
      .send({ ...newPost, _token: token });
    expect(response.statusCode).toEqual(201);
    expect(response.body.post).toEqual({
      ...newPost,

      id: expect.any(String),
      createdAt: expect.any(String),
      author: testUser.username,
      comments: [],
      netVotes: 1,
      tags: [],
    });
    const postId = response.body.post.id;
    response = await request(app).get(`/posts/${postId}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...newPost,
      id: postId,
      createdAt: expect.any(String),
      author: testUser.username,
      comments: [],
      netVotes: 1,
      tags: [],
    });
    await request(app).delete(`/posts/${postId}`).send({ _token: token });
  });
});

describe("POST /posts/:postId/downvote", function () {
  it("should add downvote from current user and return update post", async function () {
    let response = await request(app)
      .post(`/posts/${testPost.id}/downvote`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.message).toEqual(
      `User ${testUser.username} has downvoted post ${testPost.id}`
    );
    expect(response.body.post.id).toEqual(testPost.id);
    expect(response.body.post.netVotes).toEqual(-1);

    response = await request(app).get(`/posts/${testPost.id}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post.netVotes).toEqual(-1);
  });
  it("should should deny access if no token is present", async function () {
    let response = await request(app).post(`/posts/${testPostY.id}/downvote`);
    expect(response.statusCode).toEqual(403);
  });
  it("should should deny access if malformed token is present", async function () {
    let response = await request(app)
      .post(`/posts/${testPostY.id}/downvote`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should should return not found error for invalid postId", async function () {
    let response = await request(app)
      .post(`/posts/00000000-0000-0000-0000-000000000000/downvote`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
});

describe("POST /posts/:postId/upvote", function () {
  it("should add upvote from current user and return update post", async function () {
    let response = await request(app)
      .post(`/posts/${testPostY.id}/upvote`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.message).toEqual(
      `User ${testUser.username} has upvoted post ${testPostY.id}`
    );
    expect(response.body.post.id).toEqual(testPostY.id);
    expect(response.body.post.netVotes).toEqual(2);

    response = await request(app).get(`/posts/${testPostY.id}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post.netVotes).toEqual(2);
  });
  it("should should deny access if no token is present", async function () {
    let response = await request(app).post(`/posts/${testPostY.id}/upvote`);
    expect(response.statusCode).toEqual(403);
  });
  it("should should deny access if malformed token is present", async function () {
    let response = await request(app)
      .post(`/posts/${testPostY.id}/upvote`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should should return not found error for invalid postId", async function () {
    let response = await request(app)
      .post(`/posts/00000000-0000-0000-0000-000000000000/upvote`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
});

describe("PUT /posts/:postId", function () {
  it("should modify an existing post", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };

    let response = await request(app)
      .put(`/posts/${testPost.id}`)
      .send({ ...updatedPostInfo, _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...updatedPostInfo,

      id: expect.any(String),
      createdAt: expect.any(String),
      author: testUser.username,
      comments: [],
      netVotes: 1,
      tags: [],
    });
    response = await request(app)
      .get(`/posts/${testPost.id}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...updatedPostInfo,

      id: expect.any(String),
      createdAt: expect.any(String),
      author: testUser.username,
      comments: [],
      netVotes: 1,
      tags: [],
    });
  });
  it("should deny access if no token is present", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };

    let response = await request(app)
      .put(`/posts/${testPost.id}`)
      .send(updatedPostInfo);
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token is present", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };
    let response = await request(app)
      .put(`/posts/${testPost.id}`)
      .send({ ...updatedPostInfo, _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access if incorrect user", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };
    let response = await request(app)
      .put(`/posts/${testPost.id}`)
      .send({ ...updatedPostInfo, _token: createToken(testUserY) });
    expect(response.statusCode).toEqual(403);
  });
});

describe("DELETE /posts/:postId", function () {
  it("should delete an existing post", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
  });
  it("should deny access if no token is present", async function () {
    let response = await request(app).delete(`/posts/${testPost.id}`);
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token is present", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access if incorrect user", async function () {
    response = await request(app)
      .delete(`/posts/${testPost.id}`)
      .send({ _token: createToken(testUserY) });
    expect(response.statusCode).toEqual(403);
  });
});

afterAll(async function () {
  await testUserY.remove();
  db.end();
});
