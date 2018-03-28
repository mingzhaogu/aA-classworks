import React from 'react';

class PokemonIndex extends React.Component {

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props
    return (
      <div>
        <ul className="pokemon-list">
          { pokemon.map((poke) => (
            <li key={poke.id}>
              <img src={poke.image_url}/>
              <br/>
              <p className="pokemon-name">{poke.id}. {poke.name}</p>
            </li>
          ))}
        </ul>
      </div>
    )
  }
}

export default PokemonIndex;
