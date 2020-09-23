import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import SoundingBoardApi from "../soundingBoardApi";
import "./Tags.css";

const Tags = () => {
  const [isLoading, setIsLoading] = useState(true);
  const [tags, setTags] = useState([]);
  useEffect(() => {
    async function getTagInfo() {
      let allTags = await SoundingBoardApi.getTags({ sort: "popularity" });
      setTags(allTags);
      setIsLoading(false);
    }
    getTagInfo();
  }, []);

  if (isLoading) {
    return <p>Loading &hellip;</p>;
  }
  return (
    <div className="Tags">
      <div className="TagsCard card m-3">
        <div className="card-body">
          <h3 className="card-title">Tags</h3>
          <p className="Tags-list card-body">
            {tags.map((tag) => (
              <Link
                key={tag.id}
                className="badge badge-light text-info"
                to={`/tags/${tag.id}`}
              >
                #{tag.name} ({tag.totalPosts})
              </Link>
            ))}
          </p>
        </div>
      </div>
    </div>
  );
};

export default Tags;
