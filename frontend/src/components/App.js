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
  const upvotePost = async (postId) => {
    if (currentUser && !currentUser.likedPostIds.includes(postId)) {
      const res = await SoundingBoardApi.upvotePost(postId);
      setCurrentUser(res.user);
      return res.post;
    }
  };
  const downvotePost = async (postId) => {
    if (currentUser && !currentUser.dislikedPostIds.includes(postId)) {
      const res = await SoundingBoardApi.downvotePost(postId);
      setCurrentUser(res.user);
      return res.post;
    }
  };
  if (isLoading) {
    return <div>Loading your data</div>;
  }

  return (
    <UserContext.Provider
      value={{
        currentUser,
        setCurrentUser,
        upvotePost,
        downvotePost,
        setToken,
      }}
    >
      <div className="App bg-light">
        <Navigation currentUser={currentUser} logout={logout} />
        <div className="App-content row">
          <div className="col border-right">
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
