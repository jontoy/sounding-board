import React, { useState } from "react";

const CommentForm = ({ handleSubmit }) => {
  const [text, setText] = useState("");
  const handleChange = (e) => {
    setText(e.target.value);
  };
  return (
    <form className="CommentForm" onSubmit={handleSubmit}>
      Text = {text}
      <textarea
        name="text"
        value={text}
        placeholder="Offer some feedback!"
        onChange={handleChange}
      />
      <button className="btn btn-outline-success">Share!</button>
    </form>
  );
};

export default CommentForm;
