process.env.DATABASE_URL = "sounding-board-test";
process.env.VERBOSE_ERRORS = "s";

const app = require("../../../app");
const request = require("supertest");
const db = require("../../../db");
const jwt = require("jsonwebtoken");
const createToken = require("../../../helpers/createToken");
const User = require("../../../models/user");
const Tag = require("../../../models/tag");

let testUser;
let testPost;
let testTag;
let testUserZ;
let testPostZ;
let token;
let badToken = jwt.sign({ username: "routeT1" }, "invalid-key");
beforeAll(async function () {
  testUserZ = await User.create({ username: "routeTZ", password: "passwordZ" });
  testPostZ = await testUserZ.createPost({ title: "ttz1", body: "btz1" });
});
beforeEach(async function () {
  testUser = await User.create({ username: "routeT1", password: "password1" });
  token = createToken(testUser);
  testPost = await testUser.createPost({ title: "tt1", body: "bt1" });
  testTag = await Tag.create("testing");
});

afterEach(async function () {
  await testUser.remove();
  await testTag.remove();
});

describe("GET /posts", function () {
  let testTag2;
  let testTag3;
  beforeAll(async function () {
    testTag2 = await Tag.create("misc");
    testTag3 = await Tag.create("other");
  });
  afterAll(async function () {
    await testTag2.remove();
    await testTag3.remove();
  });
  it("should return list of all tags when given no parameters", async function () {
    const response = await request(app).get("/tags");
    expect(response.statusCode).toEqual(200);
    expect(response.body.tags).toEqual(
      expect.arrayContaining([testTag, testTag2, testTag3])
    );
  });
  it("should appropriately filter by name", async function () {
    const response = await request(app).get("/tags?name=misc");
    expect(response.statusCode).toEqual(200);
    expect(response.body.tags).toEqual([testTag2]);
  });
});

describe("GET /tags/:tagId", function () {
  it("should return detailed information on a single tag", async function () {
    const response = await request(app).get(`/tags/${testTag.id}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.tag).toEqual(testTag);
  });
  it("should return a 404 if given an invalid id", async function () {
    const response = await request(app).get(
      "/tags/00000000-0000-0000-0000-000000000000"
    );
    expect(response.statusCode).toEqual(404);
  });
});

describe("POST /tags", function () {
  it("should create a new tag", async function () {
    const newTag = {
      name: "newTag",
    };

    let response = await request(app)
      .post(`/tags`)
      .send({ ...newTag, _token: token });
    expect(response.statusCode).toEqual(201);
    expect(response.body.tag).toEqual({
      ...newTag,

      id: expect.any(String),
      total_posts: 0,
    });
    const tagId = response.body.tag.id;
    response = await request(app).get(`/tags/${tagId}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.tag).toEqual({
      ...newTag,

      id: tagId,
      total_posts: 0,
    });
    await request(app).delete(`/tags/${tagId}`).send({ _token: token });
  });
  it("should deny access if no token present", async function () {
    const newTag = { name: "newTag" };

    let response = await request(app).post(`/tags`).send(newTag);
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token present", async function () {
    const newTag = { name: "newTag" };

    let response = await request(app)
      .post(`/tags`)
      .send({ ...newTag, _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
});

describe("POST /posts/:postId/tags/:tagId", function () {
  it("should add appropriate tag to post and update both", async function () {
    let response = await request(app)
      .post(`/posts/${testPost.id}/tags/${testTag.id}/`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.message).toEqual(
      `Tag ${testTag.name} added to post ${testPost.id}`
    );
    response = await request(app).get(`/tags/${testTag.id}`);
    expect(response.body.tag.total_posts).toEqual(1);

    response = await request(app).get(`/posts/${testPost.id}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post.tags).toEqual([{ ...testTag, total_posts: 1 }]);
  });
  it("should should deny access if no token is present", async function () {
    let response = await request(app).post(
      `/posts/${testPost.id}/tags/${testTag.id}/`
    );
    expect(response.statusCode).toEqual(403);
  });
  it("should should deny access if malformed token is present", async function () {
    let response = await request(app)
      .post(`/posts/${testPost.id}/tags/${testTag.id}/`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access user is not post author", async function () {
    let response = await request(app)
      .post(`/posts/${testPostZ.id}/tags/${testTag.id}/`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(403);
  });
  it("should should return not found error for invalid postId", async function () {
    let response = await request(app)
      .post(`/posts/00000000-0000-0000-0000-000000000000/tags/${testTag.id}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
  it("should should return not found error for invalid tagId", async function () {
    let response = await request(app)
      .post(`/posts/${testPost.id}/tags/00000000-0000-0000-0000-000000000000`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
});

describe("DELETE /posts/:postId/tags/:tagId", function () {
  beforeEach(async function () {
    await testPost.addTag(testTag);
  });
  it("should remove appropriate tag to post and update both", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}/tags/${testTag.id}/`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
    expect(response.body.message).toEqual(
      `Tag ${testTag.name} removed from post ${testPost.id}`
    );
    response = await request(app).get(`/tags/${testTag.id}`);
    expect(response.body.tag.total_posts).toEqual(0);

    response = await request(app).get(`/posts/${testPost.id}`);
    expect(response.statusCode).toEqual(200);
    expect(response.body.post.tags).toEqual([]);
  });
  it("should should deny access if no token is present", async function () {
    let response = await request(app).delete(
      `/posts/${testPost.id}/tags/${testTag.id}/`
    );
    expect(response.statusCode).toEqual(403);
  });
  it("should should deny access if malformed token is present", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}/tags/${testTag.id}/`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should deny access user is not post author", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}/tags/${testTag.id}/`)
      .send({ _token: createToken(testUserZ) });
    expect(response.statusCode).toEqual(403);
  });
  it("should should return not found error for invalid postId", async function () {
    let response = await request(app)
      .delete(`/posts/00000000-0000-0000-0000-000000000000/tags/${testTag.id}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
  it("should should return not found error for invalid tagId", async function () {
    let response = await request(app)
      .delete(`/posts/${testPost.id}/tags/00000000-0000-0000-0000-000000000000`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
});

describe("DELETE /tags/:tagId", function () {
  it("should delete an existing tag", async function () {
    let response = await request(app)
      .delete(`/tags/${testTag.id}`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(200);
  });
  it("should deny access if no token present", async function () {
    let response = await request(app).delete(`/tags/${testTag.id}`);
    expect(response.statusCode).toEqual(403);
  });
  it("should deny access if malformed token present", async function () {
    let response = await request(app)
      .delete(`/tags/${testTag.id}`)
      .send({ _token: badToken });
    expect(response.statusCode).toEqual(401);
  });
  it("should return not found error if invalid tagId", async function () {
    response = await request(app)
      .delete(`/tags/00000000-0000-0000-0000-000000000000`)
      .send({ _token: token });
    expect(response.statusCode).toEqual(404);
  });
});

afterAll(async function () {
  await testUserZ.remove();
  db.end();
});
