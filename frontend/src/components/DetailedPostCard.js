import React from "react";
import Moment from "react-moment";
import { Link } from "react-router-dom";

const DetailedPostCard = ({
  id,
  title,
  author,
  body,
  createdAt,
  netVotes,
  tags,
}) => {
  return (
    <div className="CompanyCard card p-2 mb-1">
      <div className="row no-gutters">
        <div className="col-1">
          <section className="votes-area card-body">{netVotes}</section>
        </div>
        <div className="col-11">
          <section className="card-body">
            <h5 className="card-title">{title}</h5>
            <h6 className="card-subtitle mb-2 text-muted">
              Pitched <Moment fromNow>{new Date(createdAt)}</Moment> by{" "}
              <Link to={`/users/${author}`}>{author}</Link>
            </h6>
            <div className="Post-body">
              <p>{body}</p>
              <ul className="Post-tags">
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
