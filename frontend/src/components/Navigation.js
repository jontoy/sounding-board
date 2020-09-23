import React from "react";
import { NavLink } from "react-router-dom";
import "./Navigation.css";

const Navigation = ({ currentUser, logout }) => {
  const loggedInNav = () => {
    return (
      <ul className="navbar-nav ml-auto">
        <li key="profile" className="nav-item">
          <NavLink
            className="Navigation-link"
            to={`/users/${currentUser.username}`}
          >
            {currentUser.username}
          </NavLink>
        </li>
        <li key="logout" className="nav-item">
          <NavLink className="Navigation-link" to="/posts" onClick={logout}>
            Logout
          </NavLink>
        </li>
      </ul>
    );
  };
  const loggedOutNav = () => {
    return (
      <ul className="navbar-nav ml-auto">
        <li key="login" className="nav-item">
          <NavLink className="Navigation-link" to="/login">
            Login
          </NavLink>
        </li>
      </ul>
    );
  };

  return (
    <nav className="Navigation navbar-expand navbar navbar-dark bg-primary">
      <NavLink
        id="Navigation-brand"
        className="Navigation-link navbar-brand"
        to="/posts"
      >
        Sounding Board
      </NavLink>
      <NavLink className="Navigation-link" to={`/posts/`}>
        Latest
      </NavLink>
      <NavLink className="Navigation-link" to={`/posts/top`}>
        Top
      </NavLink>
      <NavLink className="Navigation-link" to={`/posts/rising`}>
        Rising
      </NavLink>
      <NavLink className="Navigation-link" to={`/tags/`}>
        Tags
      </NavLink>
      {currentUser ? loggedInNav() : loggedOutNav()}
    </nav>
  );
};

export default Navigation;
