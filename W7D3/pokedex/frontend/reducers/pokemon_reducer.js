import {RECEIVE_ALL_POKEMON, RECEIVE_POKEMON} from '../actions/pokemon_actions';
// import {REQUEST_ALL_POKEMON} from '../actions/pokemon_actions';
import { merge } from 'lodash';

const pokemonReducer = (state={}, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {

    case RECEIVE_ALL_POKEMON:
      nextState = action.pokemon;
      return nextState;

    case RECEIVE_POKEMON:
      nextState[action.pokemon.id] = action.pokemon;
      return merge({}, state, nextState);

    default:
      return state;
  };
};

export default pokemonReducer;
