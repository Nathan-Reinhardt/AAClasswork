import {
  createUser,
  postLogin,
  logoutSession,
} from "../util/session_api_util";

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveSessionErrors = errors => (
  {
    type: RECEIVE_SESSION_ERRORS,
    errors
  }
);
const receiveCurrentUser = user => (
  {
    type: RECEIVE_CURRENT_USER,
    user
  }
);
const logoutCurrentUser = () => (
  {
    type: LOGOUT_CURRENT_USER
  }
);

export const login = formUser => dispatch => postLogin(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => logoutSession()
  .then(() => dispatch(logoutCurrentUser()));

export const signup = formUser => dispatch => createUser(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));