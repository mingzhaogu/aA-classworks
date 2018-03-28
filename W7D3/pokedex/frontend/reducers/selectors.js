import { values } from 'lodash';

export const selectAllPokemon = (state) => Object.values(state.entities.pokemon);
