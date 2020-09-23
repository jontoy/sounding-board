import React, { useState, useEffect, useContext } from "react";
import UserContext from "../userContext";
import PostList from "./PostList";
import UserCard from "./UserCard";
import EditUserForm from "./EditUserForm";
import { useParams } from "react-router-dom";
import SoundingBoardApi from "../soundingBoardApi";
import useToggleState from "../hooks/useToggleState";

const UserProfile = () => {
  const { currentUser, setCurrentUser, upvotePost, downvotePost } = useContext(
    UserContext
  );

  const { username } = useParams();
  const [isLoading, setIsLoading] = useState(true);
  const [isEditing, toggleIsEditing] = useToggleState();
  const [user, setUser] = useState({});
  useEffect(() => {
    async function getUser() {
      let targetUser = await SoundingBoardApi.getUser(username);
      setUser(targetUser);
      setIsLoading(false);
    }
    getUser();
  }, [username]);
  const upvote = async (postId) => {
    const updatedPost = await upvotePost(postId);
    if (updatedPost) {
      setUser((user) => ({
        ...user,
        authoredPosts: user.authoredPosts.map((oldPost) =>
          oldPost.id === postId ? updatedPost : oldPost
        ),
      }));
    }
  };
  const downvote = async (postId) => {
    const updatedPost = await downvotePost(postId);
    if (updatedPost) {
      setUser((user) => ({
        ...user,
        authoredPosts: user.authoredPosts.map((oldPost) =>
          oldPost.id === postId ? updatedPost : oldPost
        ),
      }));
    }
  };
  const editUser = async (formData) => {
    const updatedUser = await SoundingBoardApi.updateUser(
      currentUser.username,
      formData
    );
    setUser(updatedUser);
    setCurrentUser(updatedUser);
    toggleIsEditing();
  };

  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }
  return (
    <div>
      {isEditing ? (
        <EditUserForm
          user={user}
          editUser={editUser}
          cancel={toggleIsEditing}
        />
      ) : (
        <UserCard
          user={user}
          toggleIsEditing={toggleIsEditing}
          isOwner={currentUser && currentUser.username === user.username}
        />
      )}
      <h4>Pitched Ideas</h4>
      <PostList
        posts={user.authoredPosts}
        likedPostIds={currentUser.likedPostIds}
        dislikePostIds={currentUser.dislikedPostIds}
        upvote={upvote}
        downvote={downvote}
      />
    </div>
  );
};

export default UserProfile;
