import * as TodoApi from '../util/todo_api_util';
import {receiveErrors} from './error_actions';

export const RECEIVE_TODO = 'RECEIVE_TODO';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const REMOVE_TODO = 'REMOVE_TODO';
export const UPDATE_TODO = 'UPDATE_TODO';


export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo: todo
});

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos: todos
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo: todo
});

export const removeServerTodo = (todo) => ((dispatch) => {
  TodoApi.removeTodo(todo)
    .then(
      serverTodo => dispatch(removeTodo(serverTodo)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    );
});

export const updateTodo = (todo) => ((dispatch) => {
  todo.done = !todo.done;
  TodoApi.updateTodo(todo)
    .then(
      serverTodo => dispatch(receiveTodo(serverTodo)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    );
});

export const createTodo = (todo) => ((dispatch) =>{
  TodoApi.createTodo(todo)
    .then(
      serverTodo => dispatch(receiveTodo(serverTodo)),
      errors => {
        // debugger
        return dispatch(receiveErrors(errors.responseJSON));
      }
    );
});

export const fetchTodos = () => (dispatch => {
  TodoApi.fetchTodos().then(serverTodos => {
    dispatch(receiveTodos(serverTodos));
  });
});
