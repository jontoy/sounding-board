import React, { useEffect, useState, useContext } from "react";
import { useParams } from "react-router-dom";
import SoundingBoardApi from "../soundingBoardApi";
import CommentsList from "./CommentsList";
import DetailedPostCard from "./DetailedPostCard";
import CommentForm from "./CommentForm";
import UserContext from "../userContext";

const Post = () => {
  const { currentUser, setCurrentUser } = useContext(UserContext);
  const { postId } = useParams();
  const [isLoading, setIsLoading] = useState(true);
  const [post, setPost] = useState({});
  const liked = currentUser
    ? currentUser.likedPostIds.includes(post.id)
    : false;
  const disliked = currentUser
    ? currentUser.dislikedPostIds.includes(post.id)
    : false;
  useEffect(() => {
    async function getPost() {
      if (isLoading) {
        let targetPost = await SoundingBoardApi.getPost(postId);
        setPost(targetPost);
        setIsLoading(false);
      }
    }
    getPost();
  }, [postId, isLoading]);
  const submitComment = async (text) => {
    const comment = await SoundingBoardApi.submitComment(postId, {
      postId,
      text,
      author: currentUser.username,
    });
    setPost((post) => ({ ...post, comments: [comment, ...post.comments] }));
  };

  const upvote = async (postId) => {
    if (currentUser && !liked) {
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
    if (currentUser && !disliked) {
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
    <div className="Post">
      <DetailedPostCard
        post={post}
        liked={liked}
        disliked={disliked}
        upvote={upvote}
        downvote={downvote}
      />
      <div className="container">
        <CommentForm submitComment={submitComment} isActive={!!currentUser} />
        <CommentsList comments={post.comments} />
      </div>
    </div>
  );
};

export default Post;
