import React from "react";
import ReactDOM from "react-dom";
import { 
  receiveCurrentUser,
  receiveSessionErrors,
  logoutCurrentUser,
  login,
  logout,
  signup
} from "./actions/session_actions";
import {
  createUser,
  postLogin,
  logoutSession
} from "./util/session_api_util";
import configureStore from "./store/store";
import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.receiveCurrentUser = receiveCurrentUser;
  window.receiveSessionErrors = receiveSessionErrors;
  window.logoutCurrentUser = logoutCurrentUser;
  window.login = login;
  window.logout = logout;
  window.signup = signup;
  window.createUser = createUser;
  window.postLogin = postLogin;
  window.logoutSession = logoutSession;

  ReactDOM.render(<Root store={store} />, root);
});