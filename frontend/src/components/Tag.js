import React, { useState, useEffect, useContext } from "react";
import UserContext from "../userContext";
import PostList from "./PostList";
import { Link, useParams } from "react-router-dom";
import SoundingBoardApi from "../soundingBoardApi";

const Tag = () => {
  const { currentUser, upvotePost, downvotePost } = useContext(UserContext);

  const { tagId } = useParams();
  const [isLoading, setIsLoading] = useState(true);
  const [tag, setTag] = useState({});
  const [posts, setPosts] = useState([]);
  useEffect(() => {
    async function getTagInfo() {
      let targetTag = await SoundingBoardApi.getTag(tagId);
      let targetPosts = await SoundingBoardApi.getPosts({ tagId });
      setTag(targetTag);
      setPosts(targetPosts);
      setIsLoading(false);
    }
    getTagInfo();
  }, [tagId]);
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
    <div>
      <div className="UserCard card mb-3">
        <div className="card-body">
          <h3 className="card-title">#{tag.name}</h3>
          <Link className="btn btn-sm btn-link text-muted" to="/tags">
            view all tags
          </Link>
        </div>
      </div>
      <h4 className="ml-3">Tagged Ideas ({tag.totalPosts})</h4>
      <PostList
        posts={posts}
        likedPostIds={currentUser && currentUser.likedPostIds}
        dislikePostIds={currentUser && currentUser.dislikedPostIds}
        upvote={upvote}
        downvote={downvote}
      />
    </div>
  );
};

export default Tag;
