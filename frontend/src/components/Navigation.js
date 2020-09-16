import React from "react";
import { NavLink } from "react-router-dom";
import "./Navigation.css";

const Navigation = ({ currentUser, logout }) => {
  const loggedInNav = () => {
    return (
      <ul className="navbar-nav ml-auto">
        <li className="nav-item">
          <NavLink className="Navigation-link" to="/profile">
            {currentUser.username}
          </NavLink>
        </li>
        <li className="nav-item">
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
        <li className="nav-item">
          <NavLink className="Navigation-link" to="/login">
            Login
          </NavLink>
        </li>
      </ul>
    );
  };

  return (
    <nav className="Navigation navbar-expand navbar navbar-dark bg-primary">
      <NavLink className="Navigation-link navbar-brand" to="/posts">
        Sounding Board
      </NavLink>
      {currentUser ? loggedInNav() : loggedOutNav()}
    </nav>
  );
};

export default Navigation;
