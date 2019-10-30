import { RECEIVE_ONE_POKE } from '../actions/pokemon_action';

const itemReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch(action.type){
    case(RECEIVE_ONE_POKE):
    debugger
      return action.poke.items;
    default:
      return state; 
  }
};

export default itemReducer;