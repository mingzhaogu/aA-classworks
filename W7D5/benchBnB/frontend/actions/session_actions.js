import { postSession, postUser, deleteSession } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
});

export const login = (formUser) => dispatch => postSession(formUser).then(
  user => dispatch.receiveCurrentUser(user), errors => receiveErrors(errors)
);

export const logout = () => dispatch => deleteSession().then(
  () => dispatch.receiveCurrentUser(null), errors => receiveErrors(errors)
);

export const signup = (formUser) => dispatch => postUser(formUser).then(
  user => dispatch.receiveCurrentUser(user), errors => receiveErrors(errors)
);
