import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';
import {REQUEST_ALL_POKEMON} from '../actions/pokemon_actions';


const pokemonReducer = (state={}, action) => {
  Object.freeze(state);
  let nextState;
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      nextState = action.pokemon;
      return nextState;
    default:
      return state;
  };

};

export default pokemonReducer;
