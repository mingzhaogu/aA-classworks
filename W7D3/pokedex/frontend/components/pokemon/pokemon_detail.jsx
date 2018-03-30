import React from 'react';
import { Route } from 'react-router-dom';
import ItemDetailContainer from "./item_detail_container";
import { Link } from 'react-router-dom';

class PokemonDetail extends React.Component {

  componentWillReceiveProps(newProps) {
    // debugger
    const id = this.props.match.params.pokemonId;
    const newId = newProps.match.params.pokemonId;
    if (id != newId) {
      this.props.requestSinglePokemon(newId);
    }
  }

  componentDidMount(props) {
    const id = this.props.match.params.pokemonId;
    this.props.requestSinglePokemon(id);
  }

  render() {
    const { items, pokemon } = this.props
    if (pokemon === undefined) return null;

    const pokemonItems = items.map((item) => (
      <Link key={item.id} to={`/pokemon/${pokemon.id}/items/${item.id}`}>
        <img src={item.image_url}/>
      </Link>
    ))

    const moves = pokemon.moves ? pokemon.moves.join(", ") : pokemon.moves;

    return (
      <section className="pokemon-detail">
        <section className={`pokemon-type ${pokemon.poke_type}`}>
          <img src={pokemon.image_url}/>
        </section>
        <ul className="pokemon-detail-list">
          <li className="name">{pokemon.name}</li>
          <li className="type">Type: {pokemon.poke_type}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li>Moves: {moves}</li>
        </ul>

        <section className="pokemon-detail-items">
          <p className="name">Items</p>
          <ul className="pokemon-detail-items-picture">
            {pokemonItems}
          </ul>

          <Route path="/pokemon/:pokemonId/items/:itemId"
            component={ItemDetailContainer} />
        </section>
      </section>
    )
  }

}

export default PokemonDetail;
