import React from "react";
import Moment from "react-moment";
import { Link } from "react-router-dom";
import VoteArea from "./VoteArea";
import "./DetailedPostCard.css";

const DetailedPostCard = ({ post, liked, disliked, upvote, downvote }) => {
  const { id, title, author, body, createdAt, netVotes, tags } = post;
  return (
    <div className="DetailedPostCard card p-2 mb-1">
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
            <h5 className="card-title">{title}</h5>
            <h6 className="card-subtitle mb-2 text-muted">
              Pitched <Moment fromNow>{new Date(createdAt)}</Moment> by{" "}
              <Link to={`/users/${author}`}>{author}</Link>
            </h6>
            <div className="DetailedPostCard-post">
              <p className="DetailedPostCard-body">{body}</p>
              <ul className="DetailedPostCard-tags">
                {tags.map((tag) => (
                  <li key={tag.id}>{tag.name}</li>
                ))}
              </ul>
            </div>
          </section>
        </div>
      </div>
    </div>
  );
};

export default DetailedPostCard;
