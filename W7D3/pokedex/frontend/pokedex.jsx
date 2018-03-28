import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'

import * as APIUtils from './util/api_util'; //
import { receiveAllPokemon } from './actions/pokemon_actions' //

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  // window.getState = store.getState; //
  // window.dispatch = store.dispatch; //
  // window.fetchAllPokemon = APIUtils.fetchAllPokemon; //
  // window.receiveAllPokemon = receiveAllPokemon; //
  ReactDOM.render(<h1>Pokedex</h1>, root);
})
