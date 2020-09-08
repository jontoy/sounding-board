process.env.DATABASE_URL = "sounding-board-test";
process.env.BCRYPT_WORK_FACTOR = 1;

const db = require("../../../db");
const User = require("../../../models/user");
const Post = require("../../../models/post");
const Tag = require("../../../models/tag");

let testUser;
let testPost;

beforeEach(async function () {
  testUser = await User.create({
    username: "testuser1",
    password: "password",
  });
  testPost = await testUser.createPost({
    title: "t1",
    body: "b1",
  });
});
describe("post getAll()", function () {
  it("should return post data", async function () {
    const posts = await Post.getAll({});
    expect(posts).toEqual(expect.arrayContaining([testPost]));
  });
});

describe("post getOne()", function () {
  it("should return post data", async function () {
    const post = await Post.getById(testPost.id);
    expect(post).toEqual(testPost);
  });
});

describe("post addTag()", function () {
  let testTag;
  beforeEach(async function () {
    testTag = await Tag.create("fitness");
  });
  it("should add tag to post", async function () {
    expect(testPost.tags.length).toEqual(0);
    expect(testTag.total_posts).toEqual(0);
    await testPost.addTag(testTag);
    expect(testPost.tags.length).toEqual(1);
    expect(testTag.total_posts).toEqual(1);
    expect(testPost.tags).toEqual([testTag]);
  });
  it("should do nothing if post already has tag", async function () {
    await testPost.addTag(testTag);
    await testPost.addTag(testTag);
    expect(testPost.tags.length).toEqual(1);
    expect(testTag.total_posts).toEqual(1);
    expect(testPost.tags).toEqual([testTag]);
  });
  afterEach(async function () {
    await testTag.remove();
  });
});

describe("post removeTag()", function () {
  let testTag;
  beforeEach(async function () {
    testTag = await Tag.create("fitness");
  });
  it("should do nothing if post doesn't have tag", async function () {
    await testPost.removeTag(testTag);
    expect(testPost.tags.length).toEqual(0);
    expect(testTag.total_posts).toEqual(0);
  });
  it("should remove existing tag from post", async function () {
    await testPost.addTag(testTag);
    expect(testPost.tags.length).toEqual(1);
    expect(testTag.total_posts).toEqual(1);
    expect(testPost.tags).toEqual([testTag]);
    await testPost.removeTag(testTag);
    expect(testPost.tags.length).toEqual(0);
    expect(testTag.total_posts).toEqual(0);
  });
  afterEach(async function () {
    await testTag.remove();
  });
});

describe("post sync()", function () {
  it("allow updates to post title and body", async function () {
    testPost.title = "t2";
    testPost.body = "b2";
    await testPost.sync();
    const post = await Post.getById(testPost.id);
    expect(post).toEqual(testPost);
  });
  it("fetches the most up to date vote tally", async function () {
    await testUser.downvote(testPost);
    await testPost.sync();
    expect(testPost.net_votes).toEqual(-1);
    const post = await Post.getById(testPost.id);
    expect(post).toEqual(testPost);
  });
});

afterEach(async function () {
  await testPost.remove();
  await testUser.remove();
});

afterAll(function () {
  db.end();
});
