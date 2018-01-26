import { merge } from 'lodash';

const uiReducer = (state={}, action) => {
  Object.freeze(state);
  let nextState;
  switch (action.type) {
    // case expression:
    //
    //   break;
    default:
      return state;
  };
};

export default uiReducer;
