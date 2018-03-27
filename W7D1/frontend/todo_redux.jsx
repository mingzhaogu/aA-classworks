import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { allTodos } from './reducers/selectors';
import TodoList from './components/todos/todo_list';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  window.todo_list = TodoList(store.getState());
  ReactDOM.render(<Root store={ store }/>, root);
});
