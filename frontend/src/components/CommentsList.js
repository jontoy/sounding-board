import React from "react";
import CommentCard from "./CommentCard";

const CommentList = ({ comments = [] }) => {
  return (
    <>
      <h5>all {comments.length} comments</h5>
      <ul className="PostList list-unstyled">
        {comments.map(({ commentId, postId, author, text, createdAt }) => (
          <li key={commentId}>
            <CommentCard
              commentId={commentId}
              postId={postId}
              author={author}
              text={text}
              createdAt={createdAt}
            />
          </li>
        ))}
      </ul>
    </>
  );
};

export default CommentList;
