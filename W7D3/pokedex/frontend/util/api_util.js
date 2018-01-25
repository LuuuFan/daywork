export const fetchAllPokemon = () => {
  return $.ajax({
    url: 'http://localhost:3000/api/pokemon',
    method: 'GET'
  });
};
