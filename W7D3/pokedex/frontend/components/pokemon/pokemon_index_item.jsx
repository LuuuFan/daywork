import React from 'react';
import { Link, NavLink } from 'react-router-dom';
import PokemonDetail from './pokemon_detail';

const PokemonIndexItem = ({pokemon}) => (
  <div>
    <Link to={`/pokemon/${pokemon.id}`}>
      <li className ='pokemon-index-item' key={pokemon.id}>
          <span>{pokemon.id}  </span>
          <img src={pokemon.image_url} />
          <span>{pokemon.name}</span>
      </li>
    </Link>
  </div>
);

export default PokemonIndexItem;


// <a href={`#/pokemon/${pokemon.id}`}>
// </a>
