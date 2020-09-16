import React, { useState, useEffect, useContext } from "react";
import SoundingBoardApi from "../soundingBoardApi";
import Searchbox from "./Searchbox";
import PostList from "./PostList";
import UserContext from "../userContext";

const Posts = () => {
  const { currentUser, setCurrentUser } = useContext(UserContext);
  const [isLoading, setIsLoading] = useState(true);
  const [posts, setPosts] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  useEffect(() => {
    async function getPosts() {
      if (isLoading) {
        let allPosts = await SoundingBoardApi.getPosts({ title: searchTerm });
        setPosts(allPosts);
        setIsLoading(false);
      }
    }
    getPosts();
  }, [searchTerm, isLoading]);

  const upvote = async (postId) => {
    if (currentUser && !currentUser.likedPostIds.includes(postId)) {
      await SoundingBoardApi.upvotePost(postId);
      setCurrentUser((user) => ({
        ...user,
        likedPostIds: [...user.likedPostIds, postId],
        dislikedPostIds: user.dislikedPostIds.filter((id) => id !== postId),
      }));
      setIsLoading(true);
    }
  };
  const downvote = async (postId) => {
    if (currentUser && !currentUser.dislikedPostIds.includes(postId)) {
      await SoundingBoardApi.downvotePost(postId);
      setCurrentUser((user) => ({
        ...user,
        dislikedPostIds: [...user.dislikedPostIds, postId],
        likedPostIds: user.likedPostIds.filter((id) => id !== postId),
      }));
      setIsLoading(true);
    }
  };
  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }

  return (
    <div className="Posts container">
      SearchTerm = {searchTerm}
      <Searchbox filterResults={setSearchTerm} />
      <PostList
        posts={posts}
        likedPostIds={currentUser ? currentUser.likedPostIds : []}
        dislikePostIds={currentUser ? currentUser.dislikedPostIds : []}
        upvote={upvote}
        downvote={downvote}
      />
    </div>
  );
};

export default Posts;
