import React from "react";
import Moment from "react-moment";
import { Link } from "react-router-dom";
import "./DetailedPostCard.css";
import PostCardFrame from "./PostCardFrame";

const DetailedPostCard = ({
  post,
  liked,
  disliked,
  upvote,
  downvote,
  isOwner,
  beginEditing,
  beginTagging,
  deletePost,
}) => {
  const { title, author, body, createdAt, tags } = post;
  return (
    <PostCardFrame
      post={post}
      liked={liked}
      disliked={disliked}
      upvote={upvote}
      downvote={downvote}
    >
      <section className="card-body">
        <h5 className="card-title">{title}</h5>
        <h6 className="card-subtitle mb-2 text-muted">
          Pitched <Moment fromNow>{new Date(createdAt)}</Moment> by{" "}
          <Link to={`/users/${author}`}>{author}</Link>
        </h6>
        <div className="DetailedPostCard-post">
          <p className="DetailedPostCard-body">{body}</p>
          {tags.map((tag) => (
            <Link
              key={tag.id}
              to={`/tags/${tag.id}`}
              className="badge badge-light text-info"
            >
              #{tag.name}
            </Link>
          ))}
          {isOwner && (
            <div>
              <button
                className="btn btn-link text-muted"
                onClick={beginEditing}
              >
                edit
              </button>
              <button
                className="btn btn-link text-muted"
                onClick={beginTagging}
              >
                edit tags
              </button>
              <button className="btn btn-link text-muted" onClick={deletePost}>
                delete
              </button>
            </div>
          )}
        </div>
      </section>
    </PostCardFrame>
  );
};

export default DetailedPostCard;
