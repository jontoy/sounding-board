import React, { useState } from "react";
import UserCardFrame from "./UserCardFrame";

const EditUserForm = ({ user, editUser, cancel }) => {
  const [formData, setFormData] = useState({
    avatarUrl: user.avatarUrl,
    bio: user.bio,
  });
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((data) => ({
      ...data,
      [name]: value,
    }));
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    await editUser(formData);
  };
  return (
    <UserCardFrame user={user}>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="avatarUrl">Profile Image URL</label>
          <input
            type="text"
            className="form-control"
            name="avatarUrl"
            placeholder="http://www.myimagelocation.com"
            autoComplete="photo"
            value={formData.avatarURL}
            onChange={handleChange}
          />
        </div>
        <div className="form-group">
          <label htmlFor="Bio">Bio</label>
          <textarea
            className="form-control"
            name="bio"
            placeholder="Tell us about yourself!"
            value={formData.bio}
            onChange={handleChange}
          />
        </div>

        <button type="submit" className="btn btn-success">
          Update!
        </button>
      </form>
      <button className="btn btn-secondary" onClick={cancel}>
        Cancel
      </button>
    </UserCardFrame>
  );
};

export default EditUserForm;
