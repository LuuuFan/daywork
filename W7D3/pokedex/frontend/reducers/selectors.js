export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon);
  // const result = [];
  // Object.keys(state.entities.pokemon).forEach(key => {
  //     result.push(state.entities.pokemon[key])
  //   }
  // );
  // return result;
};
