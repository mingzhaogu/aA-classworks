import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'

// import * as APIUtils from './util/api_util'; //
import { receiveAllPokemon, fetchAllPokemon, requestAllPokemon } from './actions/pokemon_actions' //
import { selectAllPokemon } from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.getState = store.getState; //
  window.dispatch = store.dispatch; //
  window.fetchAllPokemon = fetchAllPokemon; //
  window.receiveAllPokemon = receiveAllPokemon; //
  window.requestAllPokemon = requestAllPokemon; //
  window.selectAllPokemon = selectAllPokemon; //
  ReactDOM.render(<h1>Pokedex</h1>, root);
})
