import React from "react";
import "./VoteArea.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowUp, faArrowDown } from "@fortawesome/free-solid-svg-icons";

const VoteArea = ({ id, liked, disliked, netVotes, upvote, downvote }) => {
  return (
    <section className="VoteArea card-body">
      <button
        className={`btn btn-outline-light text-${
          liked ? "success" : "dark"
        } btn-sm`}
        onClick={() => upvote(id)}
      >
        <FontAwesomeIcon icon={faArrowUp} />
      </button>
      <span className="badge badge-pill badge-light">{netVotes}</span>
      <button
        className={`btn btn-outline-light text-${
          disliked ? "danger" : "dark"
        } btn-sm`}
        onClick={() => downvote(id)}
      >
        <FontAwesomeIcon icon={faArrowDown} />
      </button>
    </section>
  );
};

export default VoteArea;
