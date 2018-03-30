import { values } from 'lodash';

export const selectAllPokemon = ({ entities }) => (
  values(entities.pokemon)
);

export const selectSinglePokemon = ({entities}, id) => (
  entities.pokemon[id]
);

export const selectPokemonItem = ({entities}, itemId) => (
  entities.items[itemId]
);

export const selectAllItems = ({ entities }) => (
  values(entities.items)
);
