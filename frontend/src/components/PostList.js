import React from "react";
import { Link } from "react-router-dom";
import PostCard from "./PostCard";

const PostList = ({ posts }) => {
  return (
    <ul className="PostList list-unstyled">
      {posts.map(({ id, title, author, createdAt, netVotes }) => (
        <li key={id}>
          <PostCard
            id={id}
            title={title}
            author={author}
            createdAt={createdAt}
            netVotes={netVotes}
          />
        </li>
      ))}
    </ul>
  );
};

export default PostList;
