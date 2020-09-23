import React from "react";
import Moment from "react-moment";
import { Link } from "react-router-dom";
import "./CommentCard.css";

const CommentCard = ({
  commentId,
  postId,
  author,
  text,
  createdAt,
  deleteComment,
  isOwner = false,
}) => {
  return (
    <div className="CommentCard card w-75 p-2 mb-1">
      <h5 className="card-title">
        <Link to={`/users/${author}`}>{author}</Link>{" "}
        <span className="h6 text-muted">
          <Moment fromNow>{new Date(createdAt)}</Moment>
        </span>
      </h5>
      <p className="CommentCard-text card-text">{text}</p>
      {isOwner && (
        <>
          <button
            className="btn btn-link text-muted"
            onClick={() => deleteComment(commentId)}
          >
            delete
          </button>{" "}
        </>
      )}
    </div>
  );
};

export default CommentCard;
