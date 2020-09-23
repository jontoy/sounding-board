import axios from "axios";
const DATABASE_URL = process.env.REACT_APP_BASE_URL || "http://localhost:3001";

class SoundingBoardApi {
  static async request(endpoint, paramsOrData = {}, verb = "get") {
    paramsOrData._token = JSON.parse(localStorage.getItem("token"));
    console.debug("API Call:", endpoint, paramsOrData, verb);

    try {
      return (
        await axios({
          method: verb,
          url: `${DATABASE_URL}/${endpoint}`,
          [verb === "get" ? "params" : "data"]: paramsOrData,
        })
      ).data;
      // axios sends query string data via the "params" key,
      // and request body data via the "data" key,
      // so the key we need depends on the HTTP verb
    } catch (err) {
      console.error("API Error:", err.response);
      let message = err.response.data.message;
      throw Array.isArray(message) ? message : [message];
    }
  }
  static async register(data) {
    let res = await this.request(`register`, data, "post");
    return res.token;
  }
  static async login(data) {
    let res = await this.request(`login`, data, "post");
    return res.token;
  }
  static async getTotals() {
    let res = await this.request("stats");
    return res;
  }
  static async getUsers(params = {}) {
    let res = await this.request(`users`, params);
    return res.users;
  }
  static async getUser(username) {
    let res = await this.request(`users/${username}`);
    return res.user;
  }
  static async updateUser(username, data) {
    let res = await this.request(`users/${username}`, data, "put");
    return res.user;
  }
  static async getPost(id) {
    let res = await this.request(`posts/${id}`);
    return res.post;
  }
  static async getPosts(params = {}) {
    let res = await this.request("posts", params);
    return res.posts;
  }
  static async submitPost(data) {
    let res = await this.request("posts", data, "post");
    return res.post;
  }
  static async updatePost(postId, data) {
    let res = await this.request(`posts/${postId}`, data, "put");
    return res.post;
  }
  static async deletePost(postId) {
    let res = await this.request(`posts/${postId}`, {}, "delete");
    return res.message;
  }
  static async submitComment(postId, data) {
    let res = await this.request(`posts/${postId}/comments`, data, "post");
    return res.comment;
  }
  static async deleteComment(postId, commentId) {
    let res = await this.request(
      `posts/${postId}/comments/${commentId}`,
      {},
      "delete"
    );
    return res.comment;
  }
  static async getTag(id) {
    let res = await this.request(`tags/${id}`);
    return res.tag;
  }
  static async getTags(params = {}) {
    let res = await this.request("tags", params);
    return res.tags;
  }

  static async addPostTag(tagId, postId) {
    let res = await this.request(`posts/${postId}/tags/${tagId}`, {}, "post");
    return res.post;
  }
  static async removePostTag(tagId, postId) {
    let res = await this.request(`posts/${postId}/tags/${tagId}`, {}, "delete");
    return res.post;
  }
  static async upvotePost(id) {
    let res = await this.request(`posts/${id}/upvote`, {}, "post");
    return res;
  }
  static async downvotePost(id) {
    let res = await this.request(`posts/${id}/downvote`, {}, "post");
    return res;
  }
}

export default SoundingBoardApi;
