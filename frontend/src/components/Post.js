import React, { useEffect, useState, useContext } from "react";
import { useParams, useHistory } from "react-router-dom";
import SoundingBoardApi from "../soundingBoardApi";
import CommentsList from "./CommentsList";
import DetailedPostCard from "./DetailedPostCard";
import EditPostForm from "./EditPostForm";
import TagPostForm from "./TagPostForm";
import CommentForm from "./CommentForm";
import UserContext from "../userContext";
import useToggleState from "../hooks/useToggleState";

const Post = () => {
  const { currentUser, setCurrentUser, upvotePost, downvotePost } = useContext(
    UserContext
  );
  const { postId } = useParams();
  const history = useHistory();
  const [isLoading, setIsLoading] = useState(true);
  const [post, setPost] = useState({});
  const [isEditing, toggleIsEditing] = useToggleState();
  const [isTagging, toggleIsTagging] = useToggleState();
  const liked = currentUser
    ? currentUser.likedPostIds.includes(post.id)
    : false;
  const disliked = currentUser
    ? currentUser.dislikedPostIds.includes(post.id)
    : false;
  useEffect(() => {
    async function getPost() {
      let targetPost = await SoundingBoardApi.getPost(postId);
      setPost(targetPost);
      setIsLoading(false);
    }
    getPost();
  }, [postId]);
  const submitComment = async (text) => {
    const comment = await SoundingBoardApi.submitComment(postId, {
      postId,
      text,
      author: currentUser.username,
    });
    setPost((post) => ({ ...post, comments: [comment, ...post.comments] }));
  };
  const deleteComment = async (commentId) => {
    await SoundingBoardApi.deleteComment(postId, commentId);
    setPost((post) => ({
      ...post,
      comments: post.comments.filter((c) => c.commentId !== commentId),
    }));
  };
  const upvote = async (postId) => {
    const updatedPost = await upvotePost(postId);
    if (updatedPost) {
      setPost(updatedPost);
    }
  };
  const downvote = async (postId) => {
    const updatedPost = await downvotePost(postId);
    if (updatedPost) {
      setPost(updatedPost);
    }
  };

  const editPost = async (formData) => {
    const updatedPost = await SoundingBoardApi.updatePost(postId, formData);
    setPost(updatedPost);
    setCurrentUser((user) => ({
      ...user,
      authoredPosts: user.authoredPosts.map((p) =>
        p.id === postId ? updatedPost : p
      ),
    }));
    toggleIsEditing();
  };
  const deletePost = async () => {
    await SoundingBoardApi.deletePost(postId);
    setCurrentUser((user) => ({
      ...user,
      authoredPosts: user.authoredPosts.filter((p) => p.id !== postId),
    }));
    history.push("/posts");
  };

  const tagPosts = async (tagIds) => {
    let updatedPost;
    // add any new tags
    for (let tagId of tagIds) {
      if (!post.tags.find((tag) => tag.id === tagId)) {
        updatedPost = await SoundingBoardApi.addPostTag(tagId, postId);
      }
    }
    // remove any unwanted tags
    for (let tag of post.tags) {
      if (!tagIds.includes(tag.id)) {
        updatedPost = await SoundingBoardApi.removePostTag(tag.id, postId);
      }
    }
    if (updatedPost) {
      setPost(updatedPost);
    }
    toggleIsTagging();
  };

  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }

  let displayCard;
  if (isEditing) {
    displayCard = (
      <EditPostForm post={post} editPost={editPost} cancel={toggleIsEditing} />
    );
  } else if (isTagging) {
    displayCard = (
      <TagPostForm post={post} tagPosts={tagPosts} cancel={toggleIsTagging} />
    );
  } else {
    displayCard = (
      <DetailedPostCard
        post={post}
        liked={liked}
        disliked={disliked}
        upvote={upvote}
        downvote={downvote}
        isOwner={currentUser && currentUser.username === post.author}
        beginTagging={toggleIsTagging}
        beginEditing={toggleIsEditing}
        deletePost={deletePost}
      />
    );
  }

  return (
    <div className="Post">
      {displayCard}
      <div className="container-fluid">
        <CommentForm submitComment={submitComment} isActive={!!currentUser} />
        <CommentsList comments={post.comments} deleteComment={deleteComment} />
      </div>
    </div>
  );
};

export default Post;
