import { connect } from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import { selectSinglePokemon, selectAllItems } from "../../reducers/selectors";

const mapStateToProps = (state, ownProps) => ({
  pokemon: selectSinglePokemon(state, ownProps.match.params.pokemonId),
  items: selectAllItems(state)
});

const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
