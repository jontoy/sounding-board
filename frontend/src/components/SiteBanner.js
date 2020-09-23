import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import SoundingBoardApi from "../soundingBoardApi";
import bannerImage from "./sounding-board-banner-img.jpg";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faLightbulb,
  faUsers,
  faComments,
} from "@fortawesome/free-solid-svg-icons";
import "./SiteBanner.css";

const SiteBanner = () => {
  const [siteTotals, setSiteTotals] = useState({});
  useEffect(() => {
    async function getTotals() {
      let totals = await SoundingBoardApi.getTotals();
      setSiteTotals(totals);
    }
    getTotals();
  }, []);
  return (
    <div className="SiteBanner container-fluid mt-3">
      <h3>Sounding Board</h3>
      <p>
        <FontAwesomeIcon className="text-primary" icon={faUsers} /> Users:{" "}
        {siteTotals.users}
      </p>
      <p>
        <FontAwesomeIcon className="text-warning" icon={faLightbulb} /> Ideas
        Pitched: {siteTotals.posts}
      </p>
      <p>
        <FontAwesomeIcon className="text-success" icon={faComments} /> Feedback
        Offered: {siteTotals.comments}
      </p>
      <hr />
      <img className="img-fluid my-3" src={bannerImage} alt="Sounding Board" />
      <hr />
      <h4>Welcome to Sounding Board!</h4>
      <p>
        The place to pitch your latest business/app ideas. Leverage the insights
        of your fellow users to bring the strongest product to market. Please
        remember to keep your feedback professional.
      </p>
      <hr />
      <Link className="btn btn-block btn-info" to="/posts/new">
        Share a New Idea!
      </Link>
    </div>
  );
};
export default SiteBanner;
