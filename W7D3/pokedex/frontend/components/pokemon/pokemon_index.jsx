import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';

class PokemonIndex extends React.Component{
  constructor(){
    super();
    this.state = {};
  }

  componentDidMount(){
    console.log('=============pokemon index============');
    this.props.requestAllPokemon();
  }

  render(){
    // debugger
    return (
      <div className='pokedex'>
        <ul className='index'>
          {this.props.pokemon.map((pokemon) =>
            <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
            )
          }
        </ul>
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
      </div>
    );
  }
}


export default PokemonIndex;
// <Route path="/pokemon/:id" component={PokemonDetail} />
