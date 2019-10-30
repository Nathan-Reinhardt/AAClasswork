export const selectAllPokemon = (state) => Object.values(state.entities.pokemon);

export const selectAllItems = (state, id) => 
Object.values(state.entities.pokemon.id.items)
;