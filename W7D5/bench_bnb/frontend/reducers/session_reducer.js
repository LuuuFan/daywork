import  { RECEIVE_CURRENT_USER } from '../actions/session_actions';

const _nullUser = { currentUser: null };
const sessionReducer = (state = _nullUser, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const newState = Object.assign({}, state, {currentUser: action.currentUser} );
      return newState;
    default:
      return state;
  }
};

export default sessionReducer;
