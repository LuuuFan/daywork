export const fetchAllPokemon = () => {
  return $.ajax({
    url: 'http://localhost:3000/api/pokemon',
    method: 'GET'
  });
};


export const fetchSinglePokemon = (pokemonId) => {
  return $.ajax({
    url: `http://localhost:3000/api/pokemon/${pokemonId}`
  });
};
