import React, { useState, useContext } from "react";
import SoundingBoardApi from "../soundingBoardApi";
import { useHistory } from "react-router-dom";
import UserContext from "../userContext";
import Alert from "./Alert";

const Login = () => {
  const { setToken } = useContext(UserContext);
  const history = useHistory();
  const [isNewUser, setIsNewUser] = useState(false);
  const BASE_STATE = {
    username: "",
    password: "",
    bio: "",
    errors: [],
  };
  const [formData, setFormData] = useState(BASE_STATE);
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((data) => ({
      ...data,
      errors: [],
      [name]: value,
    }));
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    let token;
    try {
      const { errors, ...data } = formData;
      if (isNewUser) {
        token = await SoundingBoardApi.register(data);
      } else {
        token = await SoundingBoardApi.login(data);
      }
      setToken(token);
      history.push("/");
    } catch (errors) {
      setFormData((data) => ({
        ...data,
        errors,
      }));
    }
  };
  return (
    <div className="Login container">
      <div className="card">
        <div className="card-header">
          <ul className="nav nav-tabs card-header-tabs ml-auto">
            <li className="nav-item">
              <button
                className={isNewUser ? "nav-link" : "nav-link active"}
                onClick={() => setIsNewUser(false)}
              >
                Login
              </button>
            </li>
            <li className="nav-item">
              <button
                className={isNewUser ? "nav-link active" : "nav-link"}
                onClick={() => setIsNewUser(true)}
              >
                Register
              </button>
            </li>
          </ul>
        </div>
        <div className="card-body">
          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <label htmlFor="username">Username</label>
              <input
                className="form-control"
                type="text"
                value={formData.username}
                id="username"
                name="username"
                placeholder="e.g. ideaguy47"
                onChange={handleChange}
              />
            </div>
            <div className="form-group">
              <label htmlFor="password">Password</label>
              <input
                className="form-control"
                type="password"
                value={formData.password}
                id="password"
                name="password"
                placeholder="e.g. password123"
                onChange={handleChange}
              />
            </div>
            {isNewUser && (
              <>
                <div className="form-group">
                  <label htmlFor="bio">Bio</label>
                  <input
                    className="form-control"
                    type="text"
                    value={formData.bio}
                    id="bio"
                    name="bio"
                    placeholder="e.g. A serial innovator with experience in healthcare"
                    onChange={handleChange}
                  />
                </div>
              </>
            )}
            <button className="btn btn-info">
              {isNewUser ? "Create Account" : "Log in"}
            </button>
          </form>
          {formData.errors.length > 0 ? <Alert msgs={formData.errors} /> : null}
        </div>
      </div>
    </div>
  );
};
export default Login;
