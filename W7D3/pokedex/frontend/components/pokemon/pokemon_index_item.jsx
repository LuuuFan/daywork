import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({pokemon}) => (
  <li className ='pokemon-index-item' key={pokemon.id}>
    <Link to={`/pokemon/${pokemon.id}`}>
      <span>{pokemon.id}  </span>
      <img src={pokemon.image_url} />
      <span>{pokemon.name}</span>
    </Link>
  </li>
);

export default PokemonIndexItem;


// <a href={`#/pokemon/${pokemon.id}`}>
// </a>
