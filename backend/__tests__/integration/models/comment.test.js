process.env.DATABASE_URL = "sounding-board-test";
process.env.BCRYPT_WORK_FACTOR = 1;

const db = require("../../../db");
const DetailedUser = require("../../../models/detailedUser");
const Comment = require("../../../models/comment");

let testUser1;
let testUser2;
let testPost;
let testComment;

beforeAll(async function () {
  testUser1 = await DetailedUser.create({
    username: "testuserc1",
    password: "password",
  });
  testUser2 = await DetailedUser.create({
    username: "testuserc2",
    password: "password",
  });
  testPost = await testUser1.createPost({
    title: "t1",
    body: "b1",
  });
});

beforeEach(async function () {
  testComment = await Comment.create(testPost.id, "first", testUser2.username);
});
describe("comment getAll()", function () {
  it("should return comments data", async function () {
    const comments = await Comment.getAll({ postId: testPost.id });
    expect(comments).toEqual([testComment]);
  });
});

describe("comment getOne()", function () {
  it("should return comment data", async function () {
    const comment = await Comment.getById(testComment.commentId);
    expect(comment).toEqual(testComment);
  });
});

describe("comment sync()", function () {
  it("allow updates to comment text", async function () {
    testComment.text = "second";
    await testComment.sync();
    const comment = await Comment.getById(testComment.commentId);
    expect(comment).toEqual(testComment);
  });
});

afterEach(async function () {
  await testComment.remove();
});

afterAll(async function () {
  await testUser1.remove();
  await testUser2.remove();
  db.end();
});
