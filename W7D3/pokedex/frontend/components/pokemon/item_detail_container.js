import { connect } from 'react-redux';
import ItemDetail from './item_detail';
import { selectPokemonItem } from "../../reducers/selectors";

// import { requestSinglePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
  const id = ownProps.match.params.itemId;

  return ({
    item: selectPokemonItem(state, id)
  });
};

const mapDispatchToProps = (dispatch) => {
};

export default connect(
  mapStateToProps
)(ItemDetail);
