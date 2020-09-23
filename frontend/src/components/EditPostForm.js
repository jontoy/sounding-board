import React, { useState } from "react";
import PostCardFrame from "./PostCardFrame";

const EditPostForm = ({ post, editPost, cancel }) => {
  const DEFAULT_STATE = {
    title: post.title,
    body: post.body,
  };
  const [formData, setFormData] = useState(DEFAULT_STATE);
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((data) => ({
      ...data,
      [name]: value,
    }));
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    await editPost(formData);
  };
  return (
    <PostCardFrame post={post}>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="title">Title</label>
          <input
            className="form-control"
            type="text"
            name="title"
            placeholder="Idea Name"
            value={formData.title}
            onChange={handleChange}
          />
        </div>
        <div className="form-group">
          <label htmlFor="body">Body</label>
          <textarea
            className="form-control"
            name="body"
            placeholder="Tell us about your idea!"
            value={formData.body}
            onChange={handleChange}
          />
        </div>

        <button className="btn btn-success">Update!</button>
      </form>
      <button className="btn btn-secondary" onClick={cancel}>
        Cancel
      </button>
    </PostCardFrame>
  );
};

export default EditPostForm;
