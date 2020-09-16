import React, { useState, useEffect } from "react";
import SoundingBoardApi from "../soundingBoardApi";
import Searchbox from "./Searchbox";
import PostList from "./PostList";

const Posts = () => {
  const [isLoading, setIsLoading] = useState(true);
  const [posts, setPosts] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  useEffect(() => {
    async function getPosts() {
      let allPosts = await SoundingBoardApi.getPosts({ title: searchTerm });
      setPosts(allPosts);
    }
    getPosts();
    setIsLoading(false);
  }, [searchTerm]);
  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }

  return (
    <div className="Posts container">
      SearchTerm = {searchTerm}
      <Searchbox filterResults={setSearchTerm} />
      <PostList posts={posts} />
    </div>
  );
};

export default Posts;
