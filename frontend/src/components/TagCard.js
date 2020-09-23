import React from "react";

const TagCard = ({ tag }) => {
  return (
    <div className="UserCard card mb-3">
      <div className="card-body">
        <h3 className="card-title">#{tag.name}</h3>
        <p className="card-text">Total tagged ideas: {tag.totalPosts}</p>
      </div>
    </div>
  );
};

export default TagCard;
