import {RECEIVE_POKEMON} from '../actions/pokemon_actions';
// import {RECEIVE_ITEMS} from '../actions/item_actions';
import { merge } from 'lodash';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_POKEMON:
      nextState = action.items;
      return merge({}, state, nextState);
    default:
      return state;
  };
};

export default itemsReducer;
