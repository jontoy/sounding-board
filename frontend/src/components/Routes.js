import React from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import Post from "./Post";
import Posts from "./Posts";
import Login from "./Login";
import Profile from "./Profile";
import NewPostForm from "./NewPostForm";
import PrivateRoute from "./PrivateRoute";

const Routes = () => {
  return (
    <Switch>
      <Route exact path="/posts">
        <Posts />
      </Route>
      <Route exact path="/login">
        <Login />
      </Route>
      <PrivateRoute exact path="/profile">
        <Profile />
      </PrivateRoute>
      <Route exact path="/posts/new">
        <NewPostForm />
      </Route>
      <Route exact path="/posts/:postId">
        <Post />
      </Route>
      <Redirect to="/posts" />
    </Switch>
  );
};

export default Routes;
