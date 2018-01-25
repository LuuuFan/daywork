import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
// import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
// import {fetchAllPokemon} from './util/api_util';
// import {selectAllPokemon} from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', ()=>{
  // window.receiveAllPokemon = receiveAllPokemon;
  // window.requestAllPokemon = requestAllPokemon;
  // window.fetchAllPokemon = fetchAllPokemon;
  // window.selectAllPokemon = selectAllPokemon;
  const store = configureStore();
  window.store = store;

  ReactDOM.render(<Root store={store} />, document.getElementById('root'));
});
