import * as sessionAPIUtil from '../utils/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const login = (user) => {
  return ( (dispatch) => {
    return (
      sessionAPIUtil.login(user).then(
        (currentUser) => dispatch(receiveCurrentUser(currentUser)),
        (errors) => dispatch(receiveErrors(errors))
      )
    );
  });
};

export const signup = user => dispatch => sessionAPIUtil.signup(user)
  .then(
    currentUser => dispatch(receiveCurrentUser(currentUser)),
    errors => dispatch(receiveErrors(errors))
  );

export const logout = () => dispatch => sessionAPIUtil.logout()
  .then(
    ({}) => dispatch(receiveCurrentUser(null)),
    errors => dispatch(receiveErrors(errors))
  );
