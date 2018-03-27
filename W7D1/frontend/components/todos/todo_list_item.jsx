import React from 'react';

const TodoListItem = ({ todo }) => (
  <li key={todo.id}>{todo.title}</li>
);

export default TodoListItem;
