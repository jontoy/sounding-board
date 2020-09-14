process.env.DATABASE_URL = "sounding-board-test";
process.env.BCRYPT_WORK_FACTOR = 1;

const db = require("../../../db");
const DetailedUser = require("../../../models/detailedUser");
const Tag = require("../../../models/tag");

let testUser;
let testPost;
let testTag;

beforeEach(async function () {
  testUser = await DetailedUser.create({
    username: "testusert1",
    password: "password",
  });
  testPost = await testUser.createPost({ title: "t1", body: "b1" });
  testTag = await Tag.create("lifestyle");
});
describe("tag getAll()", function () {
  it("should return tag data", async function () {
    const tags = await Tag.getAll({});
    expect(tags).toEqual(expect.arrayContaining([testTag]));
  });
});

describe("tag getOne()", function () {
  it("should return tag data", async function () {
    const tag = await Tag.getById(testTag.id);
    expect(tag).toEqual(testTag);
  });
});

describe("tag sync()", function () {
  it("allow updates to tag name", async function () {
    testTag.name = "social media";
    await testTag.sync();
    const tag = await Tag.getById(testTag.id);
    expect(tag).toEqual(testTag);
  });
});

afterEach(async function () {
  await testUser.remove();
  await testTag.remove();
});

afterAll(function () {
  db.end();
});
