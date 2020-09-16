import React, { useEffect, useState } from "react";
import { decode } from "jsonwebtoken";
import Navigation from "./Navigation";
import SoundingBoardApi from "../soundingBoardApi";
import Routes from "./Routes";
import SiteBanner from "./SiteBanner";
import useLocalStorageState from "../hooks/useLocalStorageState";
import UserContext from "../userContext";
import "./App.css";

function App() {
  const [currentUser, setCurrentUser] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [token, setToken] = useLocalStorageState("token", "");
  useEffect(() => {
    const fetchUserDetails = async () => {
      try {
        let { username } = decode(token);
        const user = await SoundingBoardApi.getUser(username);
        setCurrentUser(user);
      } catch (err) {
        setCurrentUser(null);
      }
      setIsLoading(false);
    };
    setIsLoading(true);
    fetchUserDetails();
  }, [token]);
  const logout = () => {
    setCurrentUser(null);
    setToken("");
  };
  if (isLoading) {
    return <div>Loading your data</div>;
  }

  return (
    <UserContext.Provider
      value={{
        currentUser,
        setCurrentUser,
        setToken,
      }}
    >
      <div className="App bg-light">
        <Navigation currentUser={currentUser} logout={logout} />
        <div className="App-content row">
          <div className="col">
            <Routes />
          </div>
          <div className="col-3">
            <SiteBanner />
          </div>
        </div>
      </div>
    </UserContext.Provider>
  );
}

export default App;
