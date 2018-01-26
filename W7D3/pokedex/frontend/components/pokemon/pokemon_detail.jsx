import React from 'react';
import {Link, Route} from 'react-router-dom';
import ItemDetailContainer from '../items/item_detail_container';

class PokemonDetail extends React.Component {
  constructor (){
    super();
    this.state = {};
  }

  componentWillReceiveProps(newProps){
    // if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
    if (!this.props.pokemon || this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  componentDidMount(){
    // console.log('***********************************');
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  render (){
    // debugger
    console.log(this.props);
    const {pokemon, items} = this.props;
    // debugger
    if (pokemon) {
      return (
        <div className='pokemon-detail'>
          <figure>
            <img src={pokemon.image_url} />
          </figure>
          <ul>
            <li><h2>{pokemon.name}</h2></li>
            <li>Type: {pokemon.poke_type}</li>
            <li>Attack: {pokemon.attack}</li>
            <li>Defense: {pokemon.defense}</li>
            <li>Moves: {pokemon.moves ? pokemon.moves.join(', ') : ''}</li>
          </ul>
          <div className='item-list-div'>
            <h3>Items</h3>
            <ul className='item-list'>
              {pokemon.item_ids ? pokemon.item_ids.map(id =>
                <Link key={id} to={`/pokemon/${pokemon.id}/item/${id}`}>
                  <li>
                    <img src={items[id.toString()].image_url} />
                  </li>
                </Link>
              ) : ''}
            </ul>
            <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
          </div>
        </div>
      );
    } else {
      return null;
    }
  }
}

// {console.log('=====pokemon detail=======', pokemon)}

// console.log(items);

// console.log(pokemon.item_ids);

export default PokemonDetail;
