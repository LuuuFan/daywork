import * as APIUtil from '../util/api_util';


export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
// export const REQUEST_ALL_POKEMON = 'REQUEST_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receivePokemon = payload => ({
  type: RECEIVE_POKEMON,
  pokemon: payload.pokemon,
  items: payload.items
});

export const requestAllPokemon = () => (dispatch => {
  APIUtil.fetchAllPokemon()
    .then(
      pokemon => dispatch(receiveAllPokemon(pokemon))
    )
});

export const requestSinglePokemon = (pokemonId) => (dispatch => {
  APIUtil.fetchSinglePokemon(pokemonId)
    .then(
      payload => dispatch(receivePokemon(payload))
      // items => dispatch(receiveItems(items))
    )
});
