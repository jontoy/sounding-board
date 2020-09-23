import React from "react";

const SelectField = ({
  headDesc = "",
  tailDesc = "",
  options = [],
  value,
  action,
  subaction,
}) => {
  const handleChange = (e) => {
    action(e.target.value);
    subaction(1);
  };
  return (
    <div className="SelectField">
      {headDesc}
      <select value={value} onChange={handleChange}>
        {options.map((opt) => (
          <option key={opt} value={opt}>
            {opt}
          </option>
        ))}
      </select>
      {tailDesc}
    </div>
  );
};

export default SelectField;
