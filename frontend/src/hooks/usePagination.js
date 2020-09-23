import { useState } from "react";

const usePagination = (perPage = 20) => {
  const [items, setItems] = useState([]);
  const [page, setPage] = useState(1);
  const [resultsPerPage, setResultsPage] = useState(perPage);
  const goBack = () => {
    setPage((page) => Math.max(page - 1, 1));
  };
  const goForward = () => {
    setPage((page) =>
      Math.min(page + 1, Math.ceil(items.length / resultsPerPage))
    );
  };

  return [
    items,
    setItems,
    page,
    setPage,
    resultsPerPage,
    setResultsPage,
    goBack,
    goForward,
  ];
};

export default usePagination;
