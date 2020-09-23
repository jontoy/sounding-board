import { useState } from "react";

const useToggleState = (defaultValue = false) => {
  const [state, setState] = useState(defaultValue);
  const toggleState = () => setState(!state);
  return [state, toggleState];
};

export default useToggleState;
