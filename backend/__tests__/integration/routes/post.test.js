process.env.DATABASE_URL = "sounding-board-test";

const app = require("../../../app");
const request = require("supertest");
const db = require("../../../db");
const jwt = require("jsonwebtoken");
const createToken = require("../../../helpers/createToken");
const User = require("../../../models/user");
const Post = require("../../../models/post");

let testUser;
let testPost;
let testUserY;
let testPostY;
let token;
let badToken = jwt.sign({ username: "routeU1" }, "invalid-key");
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
    expect(response.body.posts).toEqual([
      { ...testPostY, created_at: expect.any(String) },
      { ...testPost2, created_at: expect.any(String) },
      { ...testPost3, created_at: expect.any(String) },
    ]);
  });
});

describe("GET /posts/:postId", function () {
  it("should return detailed information on a single post", async function () {
    const response = await request(app).get(`/posts/${testPost.id}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...testPost,
      created_at: expect.any(String),
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
      created_at: expect.any(String),
      author: testUser.username,
      comments: [],
      net_votes: 1,
      tags: [],
    });
    const postId = response.body.post.id;
    response = await request(app).get(`/posts/${postId}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...newPost,
      id: postId,
      created_at: expect.any(String),
      author: testUser.username,
      comments: [],
      net_votes: 1,
      tags: [],
    });
    await request(app).delete(`/posts/${postId}`).send({ _token: token });
  });
});

// describe("POST /login", function () {
//   it("should return a valid JWT if credentials are correct", async function () {
//     const response = await request(app)
//       .post("/login")
//       .send({ username: "routeU1", password: "password1" });
//     expect(response.statusCode).toEqual(200);
//     expect(response.body).toEqual({ token: expect.any(String) });
//     expect(jwt.decode(response.body.token)).toEqual(
//       expect.objectContaining({
//         username: "routeU1",
//       })
//     );
//   });
//   it("should return a 401 error if username is invalid", async function () {
//     const response = await request(app)
//       .post("/login")
//       .send({ username: "routeU0", password: "password1" });
//     expect(response.statusCode).toEqual(401);
//   });
//   it("should return a 401 error if password is invalid", async function () {
//     const response = await request(app)
//       .post("/login")
//       .send({ username: "routeU1", password: "password0" });
//     expect(response.statusCode).toEqual(401);
//   });
// });

describe("PATCH /posts/:postId", function () {
  it("should modify an existing post", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };

    let response = await request(app)
      .patch(`/posts/${testPost.id}`)
      .send({ ...updatedPostInfo, _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...updatedPostInfo,

      id: expect.any(String),
      created_at: expect.any(String),
      author: testUser.username,
      comments: [],
      net_votes: 1,
      tags: [],
    });
    response = await request(app)
      .get(`/posts/${testPost.id}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.post).toEqual({
      ...updatedPostInfo,

      id: expect.any(String),
      created_at: expect.any(String),
      author: testUser.username,
      comments: [],
      net_votes: 1,
      tags: [],
    });
  });
  it("should deny access if no token is present", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };

    let response = await request(app)
      .patch(`/posts/${testPost.id}`)
      .send(updatedPostInfo);
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token is present", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };
    let response = await request(app)
      .patch(`/posts/${testPost.id}`)
      .send({ ...updatedPostInfo, _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access if incorrect user", async function () {
    const updatedPostInfo = {
      title: "updated title",
      body: "updated body",
    };
    let response = await request(app)
      .patch(`/posts/${testPostY.id}`)
      .send({ ...updatedPostInfo, _token: token });
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
      .delete(`/posts/${testPostY.id}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(403);
  });
});

afterAll(async function () {
  await testUserY.remove();
  db.end();
});
