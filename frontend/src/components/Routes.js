import React from "react";
import { Switch, Route, Redirect } from "react-router-dom";
import Post from "./Post";
import Posts from "./Posts";
import Login from "./Login";
import Tag from "./Tag";
import Tags from "./Tags";
import UserProfile from "./UserProfile";
import NewPostForm from "./NewPostForm";
import PrivateRoute from "./PrivateRoute";

const Routes = () => {
  return (
    <Switch>
      <Route exact path="/posts">
        <Posts />
      </Route>
      <Route exact path="/posts/top">
        <Posts sort="top" />
      </Route>
      <Route exact path="/posts/rising">
        <Posts sort="rising" />
      </Route>
      <Route exact path="/login">
        <Login />
      </Route>
      <PrivateRoute exact path="/users/:username">
        <UserProfile />
      </PrivateRoute>
      <PrivateRoute exact path="/posts/new">
        <NewPostForm />
      </PrivateRoute>
      <Route exact path="/posts/:postId">
        <Post />
      </Route>
      <Route exact path="/tags/">
        <Tags />
      </Route>
      <Route exact path="/tags/:tagId">
        <Tag />
      </Route>
      <Redirect to="/posts" />
    </Switch>
  );
};

export default Routes;
