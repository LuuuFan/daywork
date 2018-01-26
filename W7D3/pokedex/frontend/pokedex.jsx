import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import { HashRouter, Route } from 'react-router-dom';
import {receiveAllPokemon, requestAllPokemon, requestSinglePokemon} from './actions/pokemon_actions'
// import {fetchAllPokemon} from './util/api_util';
// import {selectAllPokemon} from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', ()=>{
  // window.receiveAllPokemon = receiveAllPokemon;
  // window.requestAllPokemon = requestAllPokemon;
  // window.fetchAllPokemon = fetchAllPokemon;
  window.requestSinglePokemon = requestSinglePokemon;
  const store = configureStore();
  window.store = store;

  ReactDOM.render(<Root store={store} />, document.getElementById('root'));
});
