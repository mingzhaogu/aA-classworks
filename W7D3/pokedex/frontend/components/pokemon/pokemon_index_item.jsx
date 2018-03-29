import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => {
  return (
    <li>
      <img src={pokemon.image_url}/>
      <br/>
      <Link to={`/pokemon/${pokemon.id}`}>
        <p className="pokemon-name">{pokemon.id}. {pokemon.name}</p>
      </Link>
    </li>
  )
}

export default PokemonIndexItem;
