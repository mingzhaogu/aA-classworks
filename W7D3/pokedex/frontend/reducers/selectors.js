import { values } from 'lodash';

export const selectAllPokemon = ({ entities }) => (
  values(entities.pokemon)
);
