import React, { useContext } from "react";
import UserContext from "../userContext";
import { Redirect, Route } from "react-router-dom";

const PrivateRoute = ({ exact, path, children }) => {
  const { currentUser } = useContext(UserContext);
  if (!currentUser) {
    return <Redirect to="/login"></Redirect>;
  }
  return (
    <Route exact={exact} path={path}>
      {children}
    </Route>
  );
};
export default PrivateRoute;
