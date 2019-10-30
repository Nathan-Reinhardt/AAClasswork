import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKE } from '../actions/pokemon_action';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch(action.type){
    case (RECEIVE_ALL_POKEMON):
      return action.pokemon;
    case (RECEIVE_ONE_POKE):
      nextState[action.poke.id] = action.poke;
      return nextState;
    default:
      return state; 
  }
};

export default pokemonReducer;