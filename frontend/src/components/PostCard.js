import React from "react";
import Moment from "react-moment";
import { Link } from "react-router-dom";
import PostCardFrame from "./PostCardFrame";
import "./PostCard.css";

const PostCard = ({
  post,
  liked = false,
  disliked = false,
  upvote,
  downvote,
}) => {
  const { id, title, author, createdAt } = post;
  return (
    <PostCardFrame
      post={post}
      liked={liked}
      disliked={disliked}
      upvote={upvote}
      downvote={downvote}
    >
      <section className="card-body">
        <Link to={`/posts/${id}`}>
          <h5 className="card-title">{title}</h5>
        </Link>
        <h6 className="card-subtitle mb-2 text-muted">
          Pitched <Moment fromNow>{new Date(createdAt)}</Moment> by{" "}
          <Link to={`/users/${author}`}>{author}</Link>
        </h6>
      </section>
    </PostCardFrame>
  );
};

export default PostCard;
