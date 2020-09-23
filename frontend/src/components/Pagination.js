import React from "react";
import "./Pagination.css";

const Pagination = ({ page, goBack, goForward }) => {
  return (
    <nav className="Pagination" aria-label="Pagination">
      <ul className="pagination">
        <li className="page-item">
          <button className="page-link" onClick={goBack}>
            Previous
          </button>
        </li>
        <li className="page-item">
          <button className="page-link">{page}</button>
        </li>
        <li className="page-item">
          <button className="page-link" onClick={goForward}>
            Next
          </button>
        </li>
      </ul>
    </nav>
  );
};

export default Pagination;
