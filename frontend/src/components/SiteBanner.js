import React from "react";
import { Link } from "react-router-dom";

const SiteBanner = () => {
  return (
    <div className="container-fluid bg-secondary">
      Side Banner
      <Link className="btn btn-block btn-info" to="/posts/new">
        Share a New Idea!
      </Link>
    </div>
  );
};
export default SiteBanner;
