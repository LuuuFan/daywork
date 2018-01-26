import React from 'react';
import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import {withRouter} from 'react-router-dom';
import {requestSinglePokemon} from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
  // console.log(ownProps);
  return ({
    pokemon: Object.values(state.entities.pokemon)[ownProps.match.params.pokemonId-1],
    items: state.entities.items
  });
};


const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (pokemonId) => dispatch(requestSinglePokemon(pokemonId))
});

export default withRouter(
  connect(
    mapStateToProps,
    mapDispatchToProps
  )(PokemonDetail)
);
