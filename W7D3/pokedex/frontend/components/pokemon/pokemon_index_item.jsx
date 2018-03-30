import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => {
  return (
    <Link to={`/pokemon/${pokemon.id}`}>
      <li className="pokemon-item">
        <span className="pokemon-id">
          {pokemon.id}
        </span>
        <img src={pokemon.image_url}/>
        <span className="pokemon-name">
          {pokemon.name}
        </span>
      </li>
    </Link>
  )
}

export default PokemonIndexItem;
