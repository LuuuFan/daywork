import React from 'react';
import { connect } from 'react-redux';
import TodoList from "./todo_list";
import { todoSelector } from '../../reducers/selectors';
import { receiveTodo, receiveTodos, removeTodo, updateTodo } from '../../actions/todo_actions';


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
  return {todos: todoSelector(state)};
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    removeTodo: (todo) => dispatch(removeTodo(todo)),
    updateTodo: (todo) => dispatch(updateTodo(todo)),
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
