import React from 'react';
import {connect} from 'react-redux';
import {selectAllPokemon} from '../../reducers/selectors';
import {requestAllPokemon} from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';
import {withRouter} from 'react-router-dom';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
});

const mapDispatchToProps = (dispatch) => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
})


export default withRouter(
  connect(
    mapStateToProps,
    mapDispatchToProps
  )(PokemonIndex)
);