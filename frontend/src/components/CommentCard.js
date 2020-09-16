import React from "react";

const CommentCard = ({ commentId, postId, author, text, createdAt }) => {
  return (
    <div className="CommentCard card p-2 mb-1">
      <h5 className="card-title">{commentId}</h5>
      <p className="card-text">
        @ {author} ({createdAt}) - {text}
      </p>
    </div>
  );
};

export default CommentCard;
