import React from "react";
import VoteArea from "./VoteArea";

const PostCardFrame = ({
  post,
  liked = false,
  disliked = false,
  upvote,
  downvote,
  children,
}) => {
  return (
    <div className="PostCardFrame card p-2 mb-1">
      <div className="row no-gutters">
        <div className="col-1">
          <VoteArea
            id={post.id}
            liked={liked}
            disliked={disliked}
            netVotes={post.netVotes}
            upvote={upvote}
            downvote={downvote}
          />
        </div>
        <div className="col-11">{children}</div>
      </div>
    </div>
  );
};

export default PostCardFrame;
