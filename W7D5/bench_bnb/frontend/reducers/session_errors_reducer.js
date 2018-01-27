import {
   RECEIVE_CURRENT_USER,
   RECEIVE_ERRORS
 } from '../actions/session_actions';

const nullErrors = {session: []};
const sessionErrorsReducer = (state = nullErrors, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ERRORS:
      const newState = Object.assign({}, state);
      newState.session.concat(action.errors);
      return newState;
    case RECEIVE_CURRENT_USER:
      return nullErrors;
    default:
      return state;
  }
};
