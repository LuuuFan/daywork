import React from 'react';
import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';
import { removeServerTodo } from '../../actions/todo_actions';


const mapDispatchToProps = (dispatch) => {
  // debugger
  return {
    removeServerTodo: (todo) => dispatch(removeServerTodo(todo)),
  };
};


export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);
