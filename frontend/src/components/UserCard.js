import React from "react";
import Moment from "react-moment";
import UserCardFrame from "./UserCardFrame";

const UserCard = ({ user, toggleIsEditing, isOwner }) => {
  return (
    <UserCardFrame user={user}>
      <p className="card-text">{user.bio}</p>
      <p className="card-text">
        <small className="text-muted">
          Member since <Moment fromNow>{new Date(user.memberSince)}</Moment>{" "}
        </small>
      </p>
      {isOwner && (
        <button className="btn btn-link" onClick={toggleIsEditing}>
          edit
        </button>
      )}
    </UserCardFrame>
  );
};

export default UserCard;
