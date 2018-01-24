import React from 'react';
import { connect } from 'react-redux';
import TodoList from "./todo_list";
import { todoSelector } from '../../reducers/selectors';
import { updateTodo, createTodo, fetchTodos } from '../../actions/todo_actions';


// class ToDoListContainer extends React.Component {
//
//   constructor(props){
//     super(props);
//     this.state = {};
//   }
//
//   render() {
//     return (
//     <div>
//       <TodoList todos='' />
//     </div>
//   );
//   }
// }

const mapStateToProps = (state) => {
  // console.log(state.errors);
  return {
    todos: todoSelector(state),
    errors: state.errors ? state.errors : ''
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    // receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    updateTodo: (todo) => dispatch(updateTodo(todo)),
    createTodo: (todo) => dispatch(createTodo(todo)),
    fetchTodos: () => dispatch(fetchTodos()),
    // removeTodo: (todo) => dispatch(removeTodo(todo)),

  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
