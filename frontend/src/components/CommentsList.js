import React, { useContext } from "react";
import CommentCard from "./CommentCard";
import UserContext from "../userContext";

const CommentList = ({ comments = [], deleteComment }) => {
  const { currentUser } = useContext(UserContext);

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
              isOwner={currentUser && currentUser.username === author}
              deleteComment={deleteComment}
            />
          </li>
        ))}
      </ul>
    </>
  );
};

export default CommentList;
