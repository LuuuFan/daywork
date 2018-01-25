import React from 'react';

class PokemonIndex extends React.Component{
  constructor(){
    super();
    this.state = {};
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    return (
      <div className='pokedex'>
        <ul>
          {this.props.pokemon.map((pokemon, idx) =>
            <li className ='pokemon-index-item' key={idx}>
              <a href={`#/pokemon/${pokemon.id}`}>
                <span>{pokemon.id}  </span>
                <img src={pokemon.image_url} />
                <span>{pokemon.name}</span>
              </a>
            </li>
            )
          }
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
