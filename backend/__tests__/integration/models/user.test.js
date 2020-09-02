process.env.DATABASE_URL = "sounding-board-test";
process.env.BCRYPT_WORK_FACTOR = 1;

const db = require("../../../db");
const User = require("../../../models/user");
const Post = require("../../../models/post");

let testUser;
let testPost;

beforeEach(async function () {
  testUser = await User.create({
    username: "testuseru1",
    password: "password",
  });
  testPost = await testUser.createPost({
    title: "t1",
    body: "b1",
  });
});
describe("user getAll()", function () {
  it("should return user data", async function () {
    const users = await User.getAll({});
    expect(users[0].username).toEqual(testUser.username);
    expect(users[0].avatar_url).toEqual(testUser.avatar_url);
  });
});

describe("user getOne()", function () {
  it("should return user data", async function () {
    const user = await User.getById(testUser.username);
    expect(user).toEqual(testUser);
  });
});

describe("user upvote()", function () {
  it("should increment post net_votes and update user like/disliked ids", async function () {
    await testUser.downvote(testPost);
    expect(testPost.net_votes).toEqual(-1);
    expect(testUser.likedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
    await testUser.upvote(testPost);
    expect(testPost.net_votes).toEqual(1);
    expect(testUser.likedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
  });
  it("should not affect already liked posts", async function () {
    expect(testPost.net_votes).toEqual(1);
    expect(testUser.likedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
    await testUser.upvote(testPost);
    expect(testPost.net_votes).toEqual(1);
    expect(testUser.likedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
  });
});

describe("user downvote()", function () {
  it("should decrement post net_votes and update user like/disliked ids", async function () {
    expect(testPost.net_votes).toEqual(1);
    expect(testUser.likedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
    await testUser.downvote(testPost);
    expect(testPost.net_votes).toEqual(-1);
    expect(testUser.likedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
  });
  it("should not affect already disliked posts", async function () {
    await testUser.downvote(testPost);
    expect(testPost.net_votes).toEqual(-1);
    expect(testUser.likedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
    await testUser.downvote(testPost);
    expect(testPost.net_votes).toEqual(-1);
    expect(testUser.likedPostIds).not.toEqual(
      expect.arrayContaining([testPost.id])
    );
    expect(testUser.dislikedPostIds).toEqual(
      expect.arrayContaining([testPost.id])
    );
  });
});

describe("user sync()", function () {
  it("allow updates to user avatar_url and bio", async function () {
    testUser.avatar_url = "www.fakeurl.com";
    testUser.bio = "b2";
    await testUser.sync();
    const user = await User.getById(testUser.username);
    expect(user).toEqual(testUser);
  });
});

afterEach(async function () {
  await testPost.remove();
  await testUser.remove();
});

afterAll(function () {
  db.end();
});
