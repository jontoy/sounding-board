import React, { useState, useEffect, useContext } from "react";
import SoundingBoardApi from "../soundingBoardApi";
import Searchbox from "./Searchbox";
import PostList from "./PostList";
import SelectField from "./SelectField";
import Pagination from "./Pagination";
import UserContext from "../userContext";
import usePagination from "../hooks/usePagination";
import "./Posts.css";

const Posts = ({ sort }) => {
  const { currentUser, upvotePost, downvotePost } = useContext(UserContext);
  const [isLoading, setIsLoading] = useState(true);
  const [
    posts,
    setPosts,
    page,
    setPage,
    resultsPerPage,
    setResultsPerPage,
    goBack,
    goForward,
  ] = usePagination(20);
  const [searchTerm, setSearchTerm] = useState("");
  useEffect(() => {
    async function getPosts() {
      let allPosts = await SoundingBoardApi.getPosts({
        sort,
        title: searchTerm,
      });
      setPosts(allPosts);
      setIsLoading(false);
      setPage(1);
    }
    getPosts();
  }, [searchTerm, sort]);

  const upvote = async (postId) => {
    const updatedPost = await upvotePost(postId);
    if (updatedPost) {
      setPosts((posts) =>
        posts.map((oldPost) => (oldPost.id === postId ? updatedPost : oldPost))
      );
    }
  };
  const downvote = async (postId) => {
    const updatedPost = await downvotePost(postId);
    if (updatedPost) {
      setPosts((posts) =>
        posts.map((oldPost) => (oldPost.id === postId ? updatedPost : oldPost))
      );
    }
  };
  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }

  return (
    <div className="Posts container-fluid">
      <Searchbox filterResults={setSearchTerm} />
      <PostList
        posts={posts.slice(resultsPerPage * (page - 1), resultsPerPage * page)}
        likedPostIds={currentUser ? currentUser.likedPostIds : []}
        dislikePostIds={currentUser ? currentUser.dislikedPostIds : []}
        upvote={upvote}
        downvote={downvote}
      />
      <Pagination page={page} goBack={goBack} goForward={goForward} />
      <SelectField
        headDesc="Show me "
        tailDesc=" results per page"
        options={[10, 20, 50, 100]}
        value={resultsPerPage}
        action={setResultsPerPage}
        subaction={setPage}
      />
    </div>
  );
};

export default Posts;
