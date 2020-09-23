import React from "react";

const UserCardFrame = ({ user, children }) => {
  return (
    <div className="UserCard card mb-3">
      <div className="row no-gutters">
        <div className="col-md-4">
          <img className="card-img" src={user.avatarUrl} alt={user.username} />
        </div>
        <div className="col-md-8">
          <div className="card-body">
            <h5 className="card-title">{user.username}</h5>
            {children}
          </div>
        </div>
      </div>
    </div>
  );
};

export default UserCardFrame;
