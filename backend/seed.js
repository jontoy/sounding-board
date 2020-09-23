process.env.DATABASE_URL = "sounding-board";
process.env.BCRYPT_WORK_FACTOR = 1;

const db = require("./db");
const User = require("./models/user");
const DetailedPost = require("./models/detailedPost");
const Post = require("./models/post");
const Comment = require("./models/comment");
const Tag = require("./models/tag");
const faker = require("faker");

const vote = require("./dataAccess/vote");

let users = [];
let posts = [];
let comments = [];
let tags = [];

tags = await Tag.getAll({});

for (let i = 0; i < 250; i++) {
  users.push(
    await User.create({
      username: faker.internet.userName(),
      password: "password",
      bio: faker.lorem.sentence(),
    })
  );
}
for (let i = 0; i < 100; i++) {
  const idx = Math.floor(Math.random() * users.length);
  posts.push(
    await DetailedPost.create({
      title: faker.company.bs(),
      author: users[idx].username,
      body: faker.lorem.paragraphs(),
    })
  );
}
for (let i = 0; i < 400; i++) {
  const userIdx = Math.floor(Math.random() * users.length);
  const postIdx = Math.floor(Math.random() * posts.length);
  comments.push(
    await Comment.create(
      posts[postIdx].id,
      faker.lorem.sentences(),
      users[userIdx].username
    )
  );
}
for (let i = 0; i < 250; i++) {
  const tagIdx = Math.floor(Math.random() * tags.length);
  const postIdx = Math.floor(Math.random() * posts.length);
  await posts[postIdx].addTag(tags[tagIdx]);
}
for (let user of users) {
  for (let i = 0; i < (posts.length * 2) / 3; i++) {
    const postIdx = Math.floor(Math.random() * posts.length);
    try {
      await vote.create({
        postId: posts[postIdx].id,
        username: user.username,
        value: 1,
      });
    } catch (e) {}
  }
  for (let i = 0; i < posts.length / 3; i++) {
    const postIdx = Math.floor(Math.random() * posts.length);
    try {
      await vote.create({
        postId: posts[postIdx].id,
        username: user.username,
        value: -1,
      });
    } catch (e) {}
  }
}
