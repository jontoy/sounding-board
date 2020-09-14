process.env.DATABASE_URL = "sounding-board-test";
process.env.VERBOSE_ERRORS = "s";

const app = require("../../../app");
const request = require("supertest");
const db = require("../../../db");
const jwt = require("jsonwebtoken");
const createToken = require("../../../helpers/createToken");
const DetailedUser = require("../../../models/detailedUser");

let testUser;
let testUserX;
let testPost;
let token;
let badToken = jwt.sign({ username: "routeU1" }, "invalid-key");
beforeAll(async function () {
  testUserX = await DetailedUser.create({
    username: "routeUX",
    password: "passwordX",
  });
});
beforeEach(async function () {
  testUser = await DetailedUser.create({
    username: "routeU1",
    password: "password1",
  });
  token = createToken(testUser);
  testPost = await testUser.createPost({ title: "tu1", body: "bu1" });
});

afterEach(async function () {
  await testUser.remove();
});

describe("GET /users", function () {
  let testUser2;
  let testUser3;
  beforeAll(async function () {
    testUser2 = await DetailedUser.create({
      username: "routeU2",
      password: "p2",
    });
    testUser3 = await DetailedUser.create({
      username: "routeU3",
      password: "p3",
    });
  });
  afterAll(async function () {
    await testUser2.remove();
    await testUser3.remove();
  });
  it("should return list of all users when given no parameters", async function () {
    const response = await request(app).get("/users").send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.users).toEqual(
      expect.arrayContaining(
        [testUser, testUser2, testUser3].map(
          ({ username, avatarUrl, bio, memberSince }) => ({
            username,
            avatarUrl,
            bio,
            memberSince: expect.any(String),
          })
        )
      )
    );
  });
  it("should appropriately filter by username", async function () {
    const response = await request(app)
      .get("/users?username=routeU1")
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.users[0].username).toEqual("routeU1");
  });
  it("should reject requests without a token", async function () {
    const response = await request(app).get("/users");
    expect(response.statusCode).toEqual(403);
  });
  it("should reject requests without a malformed token", async function () {
    const response = await request(app)
      .get("/users")
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
});

describe("GET /users/:username", function () {
  it("should return detailed information on a single user", async function () {
    const response = await request(app)
      .get(`/users/${testUser.username}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.user).toEqual({
      username: testUser.username,
      avatarUrl: expect.any(String),
      bio: "",
      memberSince: expect.any(String),
      authoredPosts: [
        {
          author: testPost.author,
          body: testPost.body,
          id: testPost.id,
          netVotes: testPost.netVotes,
          title: testPost.title,
          createdAt: expect.any(String),
        },
      ],
      likedPostIds: [testPost.id],
      dislikedPostIds: [],
    });
  });
  it("should return a 404 if given an invalid username", async function () {
    const response = await request(app)
      .get("/users/not-a-valid-username")
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
  it("should reject requests without a token", async function () {
    const response = await request(app).get(`/users/${testUser.username}`);
    expect(response.statusCode).toEqual(403);
  });
  it("should reject requests without a malformed token", async function () {
    const response = await request(app)
      .get(`/users/${testUser.username}`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
});

describe("POST /register", function () {
  it("should create a new user and return appropriate token", async function () {
    const newUser = {
      username: "u19",
      password: "password19",
      bio: "fake bio",
    };

    let response = await request(app).post(`/register`).send(newUser);
    expect(response.statusCode).toEqual(201);
    expect(response.body).toEqual({ token: expect.any(String) });
    const newToken = response.body.token;
    expect(jwt.decode(newToken)).toEqual(
      expect.objectContaining({
        username: newUser.username,
      })
    );

    response = await request(app)
      .get(`/users/${newUser.username}`)
      .send({ _token: newToken });
    expect(response.statusCode).toEqual(200);
    expect(response.body.user).toEqual({
      username: newUser.username,
      avatarUrl: expect.any(String),
      bio: newUser.bio,
      memberSince: expect.any(String),
      authoredPosts: [],
      likedPostIds: [],
      dislikedPostIds: [],
    });
    await request(app)
      .delete(`/users/${newUser.username}`)
      .send({ _token: newToken });
  });
  it("should return a 409 if username is not unique", async function () {
    const newUser = {
      username: "routeU1",
      password: "password19",
    };
    let response = await request(app).post(`/register`).send(newUser);
    expect(response.statusCode).toEqual(409);
  });
});

describe("POST /login", function () {
  it("should return a valid JWT if credentials are correct", async function () {
    const response = await request(app)
      .post("/login")
      .send({ username: "routeU1", password: "password1" });
    expect(response.statusCode).toEqual(200);
    expect(response.body).toEqual({ token: expect.any(String) });
    expect(jwt.decode(response.body.token)).toEqual(
      expect.objectContaining({
        username: "routeU1",
      })
    );
  });
  it("should return a 401 error if username is invalid", async function () {
    const response = await request(app)
      .post("/login")
      .send({ username: "routeU0", password: "password1" });
    expect(response.statusCode).toEqual(401);
  });
  it("should return a 401 error if password is invalid", async function () {
    const response = await request(app)
      .post("/login")
      .send({ username: "routeU1", password: "password0" });
    expect(response.statusCode).toEqual(401);
  });
});

describe("PATCH /users/:username", function () {
  it("should modify an existing user", async function () {
    const updatedUserInfo = {
      bio: "updated bio",
      avatarUrl: "www.fakeurl.com",
    };

    let response = await request(app)
      .patch(`/users/${testUser.username}`)
      .send({ ...updatedUserInfo, _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.user).toEqual({
      username: testUser.username,
      avatarUrl: "www.fakeurl.com",
      bio: "updated bio",
      memberSince: expect.any(String),
      authoredPosts: [
        {
          author: testPost.author,
          body: testPost.body,
          id: testPost.id,
          netVotes: testPost.netVotes,
          title: testPost.title,
          createdAt: expect.any(String),
        },
      ],
      likedPostIds: [testPost.id],
      dislikedPostIds: [],
    });
    response = await request(app)
      .get(`/users/${testUser.username}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.user).toEqual({
      username: testUser.username,
      avatarUrl: "www.fakeurl.com",
      bio: "updated bio",
      memberSince: expect.any(String),
      authoredPosts: [
        {
          author: testPost.author,
          body: testPost.body,
          id: testPost.id,
          netVotes: testPost.netVotes,
          title: testPost.title,
          createdAt: expect.any(String),
        },
      ],
      likedPostIds: [testPost.id],
      dislikedPostIds: [],
    });
  });
  it("should deny access if no token is present", async function () {
    const updatedUserInfo = {
      bio: "updated bio",
      avatarUrl: "www.fakeurl.com",
    };
    let response = await request(app)
      .patch(`/users/${testUser.username}`)
      .send({ updatedUserInfo });
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token is present", async function () {
    const updatedUserInfo = {
      bio: "updated bio",
      avatarUrl: "www.fakeurl.com",
    };
    let response = await request(app)
      .patch(`/users/${testUser.username}`)
      .send({ ...updatedUserInfo, _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access if incorrect user", async function () {
    const updatedUserInfo = {
      bio: "updated bio",
      avatarUrl: "www.fakeurl.com",
    };
    let response = await request(app)
      .patch(`/users/routeUX`)
      .send({ ...updatedUserInfo, _token: token });
    expect(response.statusCode).toEqual(403);
  });
});

describe("DELETE /users/:username", function () {
  it("should delete an existing user", async function () {
    let response = await request(app)
      .delete(`/users/${testUser.username}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
  });
  it("should deny access if no token is present", async function () {
    let response = await request(app).delete(`/users/${testUser.username}`);
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token is present", async function () {
    let response = await request(app)
      .delete(`/users/${testUser.username}`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access if incorrect user", async function () {
    response = await request(app)
      .delete(`/users/routeUX`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(403);
  });
});

afterAll(async function () {
  await testUserX.remove();
  db.end();
});
