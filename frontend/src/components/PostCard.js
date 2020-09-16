import React from "react";
import Moment from "react-moment";
import { Link } from "react-router-dom";
import VoteArea from "./VoteArea";
import "./PostCard.css";

const PostCard = ({
  post,
  liked = false,
  disliked = false,
  upvote,
  downvote,
}) => {
  const { id, title, author, createdAt, netVotes } = post;
  return (
    <div className="PostCard card p-2 mb-1">
      <div className="row no-gutters">
        <div className="col-1">
          <VoteArea
            id={id}
            liked={liked}
            disliked={disliked}
            netVotes={netVotes}
            upvote={upvote}
            downvote={downvote}
          />
        </div>
        <div className="col-11">
          <section className="card-body">
            <Link to={`/posts/${id}`}>
              <h5 className="card-title">{title}</h5>
            </Link>
            <h6 className="card-subtitle mb-2 text-muted">
              Pitched <Moment fromNow>{new Date(createdAt)}</Moment> by{" "}
              <Link to={`/users/${author}`}>{author}</Link>
            </h6>
          </section>
        </div>
      </div>
    </div>
  );
};

export default PostCard;
