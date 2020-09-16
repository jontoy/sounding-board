import React, { useState } from "react";
import "./CommentForm.css";

const CommentForm = ({ submitComment, isActive }) => {
  const [text, setText] = useState("");
  const handleChange = (e) => {
    setText(e.target.value);
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    if (isActive) {
      await submitComment(text);
      setText("");
    }
  };
  return (
    <form className="CommentForm mb-2" onSubmit={handleSubmit}>
      {text}
      <fieldset disabled={!isActive}>
        <div className="form-group mb-0">
          <textarea
            rows={4}
            cols={1}
            className="CommentForm-input form-control"
            name="text"
            value={text}
            placeholder={
              isActive
                ? "Offer some feedback!"
                : "Log in to offer some feedback!"
            }
            onChange={handleChange}
          />
        </div>
        <button
          type="submit"
          className="btn btn-outline-success btn-block btn-sm"
        >
          Share!
        </button>
      </fieldset>
    </form>
  );
};

export default CommentForm;
