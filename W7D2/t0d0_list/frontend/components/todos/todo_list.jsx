import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form2';

export default ({ todos, receiveTodo }) => {
  const todoItems = todos.map( todo => (
    <TodoListItem key={todo.id}
      todo={todo}
      receiveTodo={ receiveTodo } />
  ));



  return (
    <div className="todo_list">
      <h1>
        '2do or not 2do'
      </h1>
      <ul className="todo_list_items">
        {todoItems}
      </ul>
      <TodoForm receiveTodo={ receiveTodo }/>
    </div>
  );
};
