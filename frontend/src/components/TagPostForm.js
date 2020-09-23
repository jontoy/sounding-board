import React, { useState, useEffect } from "react";
import PostCardFrame from "./PostCardFrame";
import SoundingBoardApi from "../soundingBoardApi";
import Select from "react-select";

const TagPostForm = ({ post, tagPosts, cancel }) => {
  const [tags, setTags] = useState([]);
  const [allTags, setAllTags] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  useEffect(() => {
    async function getTags() {
      if (isLoading) {
        let allTagsData = await SoundingBoardApi.getTags();
        setAllTags(allTagsData);
        setIsLoading(false);
      }
    }
    getTags();
  }, [isLoading]);

  const handleChange = (e) => {
    setTags(e);
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    await tagPosts(tags.map((tag) => tag.value));
  };

  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }
  return (
    <PostCardFrame post={post}>
      <h5 className="card-title">Tags - {post.title}</h5>
      <form onSubmit={handleSubmit}>
        <Select
          defaultValue={post.tags.map(({ id, name }) => ({
            value: id,
            label: name,
          }))}
          isMulti
          name="tags"
          options={allTags.map(({ id, name }) => ({ value: id, label: name }))}
          className="basic-multi-select"
          classNamePrefix="select"
          onChange={handleChange}
        />

        <button className="btn btn-sm btn-info">Update tags!</button>
      </form>
      <button className="btn btn-sm btn-link" onClick={cancel}>
        Cancel
      </button>
    </PostCardFrame>
  );
};

export default TagPostForm;
