import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon, receiveOnePoke, requestOnePoke } from './actions/pokemon_action';
import { fetchAllPokemon, fetchOnePoke } from './util/api_util';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from "react-router-dom";

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.selectAllPokemon = selectAllPokemon;
  window.receiveOnePoke = receiveOnePoke;
  window.requestOnePoke = requestOnePoke;
  window.fetchOnePoke = fetchOnePoke; 

  ReactDOM.render(<Root store={store} />, rootEl);
});