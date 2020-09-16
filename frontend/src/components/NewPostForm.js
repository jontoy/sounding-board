import React, { useState, useContext } from "react";
import UserContext from "../userContext";
import SoundingBoardApi from "../soundingBoardApi";
import { useHistory } from "react-router-dom";

const NewPostForm = () => {
  const { currentUser, setCurrentUser } = useContext(UserContext);
  const history = useHistory();
  const [formData, setFormData] = useState({ title: "", body: "" });
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((data) => ({
      ...data,
      [name]: value,
    }));
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    const post = await SoundingBoardApi.submitPost({
      ...formData,
      author: currentUser.username,
    });
    setCurrentUser((user) => ({
      ...user,
      authoredPosts: [...user.authoredPosts, post],
      likedPostIds: [...user.likedPostIds, post.id],
    }));
    history.push("/posts");
  };
  const cancel = () => {
    history.push("/posts");
  };
  return (
    <div className="NewPostForm">
      <h2>Share Your Latest Idea!</h2>
      <form onSubmit={(e) => e.preventDefault()}>
        <label htmlFor="title">Title</label>
        <input
          type="text"
          name="title"
          placeholder="Idea Name"
          value={formData.title}
          onChange={handleChange}
        />
        <label htmlFor="body">Body</label>
        <textarea
          name="body"
          placeholder="Tell us about your idea!"
          value={formData.body}
          onChange={handleChange}
        />
        <button className="btn btn-success" onClick={handleSubmit}>
          Share!
        </button>
        <button className="btn btn-secondary" onClick={cancel}>
          Cancel
        </button>
      </form>
    </div>
  );
};

export default NewPostForm;
