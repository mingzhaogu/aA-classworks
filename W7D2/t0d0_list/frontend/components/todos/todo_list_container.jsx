import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import { receiveTodo, receiveTodos, fetchTodos } from '../../actions/todo_actions';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

// const mapDispatchToProps = (dispatch) => ({
//   receiveTodo: (todo) => dispatch(receiveTodo(todo))
// });

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo))
  };
};

 // dispatch({type: RECEIVE_TODO, todo: todo})

const TodoContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
//
// this.props:
// {
//   todos: someTodos,
//   receiveTodo: function(todo)...,
//   something: somethingElse
// }
//
// this.props.receive

export default TodoContainer;
