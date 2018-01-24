import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';


export const errorReducer = (state = [], action) => {
  Object.freeze(state);

  let newstate;
  // debugger
  switch (action.type) {

    case RECEIVE_ERRORS:
      return action.errors;

    case CLEAR_ERRORS:
      return newstate;

    default:
      return state;
  }
};
