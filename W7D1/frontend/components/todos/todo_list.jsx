import React from 'react';
import TodoListItem from './todo_list_item';

export default ({ todos }) => {
  const todoItems = Array.from(todos).map( todo => (
    <TodoListItem todo={todo} />
  ));

  return (
    <div className='todo_list'>
      <h1>asodfjasdfa;sdf
      </h1>
      <ul className='todo_list_items'>
        {todoItems}
      </ul>
    </div>
  );
};
