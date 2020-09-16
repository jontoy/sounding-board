import React from "react";
import PostCard from "./PostCard";

const PostList = ({
  posts,
  likedPostIds = [],
  dislikePostIds = [],
  upvote,
  downvote,
}) => {
  return (
    <ul className="PostList list-unstyled">
      {posts.map((post) => (
        <li key={post.id}>
          <PostCard
            post={post}
            liked={likedPostIds.includes(post.id)}
            disliked={dislikePostIds.includes(post.id)}
            upvote={upvote}
            downvote={downvote}
          />
        </li>
      ))}
    </ul>
  );
};

export default PostList;
