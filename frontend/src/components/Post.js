import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import SoundingBoardApi from "../soundingBoardApi";
import CommentsList from "./CommentsList";
import DetailedPostCard from "./DetailedPostCard";
import CommentForm from "./CommentForm";

const Post = () => {
  const { postId } = useParams();
  const [isLoading, setIsLoading] = useState(true);
  const [post, setPost] = useState({});

  useEffect(() => {
    async function getPost() {
      let targetPost = await SoundingBoardApi.getPost(postId);
      setPost(targetPost);
      setIsLoading(false);
    }
    getPost();
  }, [postId]);

  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }
  const { id, title, author, body, createdAt, netVotes, tags, comments } = post;
  return (
    <div className="Company">
      <DetailedPostCard
        id={id}
        title={title}
        author={author}
        body={body}
        createdAt={createdAt}
        netVotes={netVotes}
        tags={tags}
      />
      <div className="container">
        <CommentForm />
        <CommentsList comments={comments} />
      </div>
    </div>
  );
};

export default Post;
