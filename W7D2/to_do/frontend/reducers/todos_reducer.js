import { merge } from 'lodash';
import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO, UPDATE_TODO } from '../actions/todo_actions';


// reducers/todos_reducer.js
// const initialState = {
//   1: {
//     id: 1,
//     title: 'wash car',
//     body: 'with soap',
//     done: false
//   },
//   2: {
//     id: 2,
//     title: 'wash dog',
//     body: 'with shampoo',
//     done: true
//   },
// };

// const testTodos = [
//   { id: 101, title: 'feed night!', body: 'she likes fish!', done: false },
//   { id: 102, title: 'feed shasha!', body: 'she likes cake!!!', done: false },
//   { id: 103, title: 'buy normal catfood!', body: 'get it at petco', done: false }
// ];

const todosReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_TODO:
    // debugger
      const newState = {
        [action.todo.id]: action.todo
      };
      // newState[action.todo.id] = action.todo
      const merged = merge({}, state, newState);
      return merged;

    case RECEIVE_TODOS:
      const newTodos = {};
      action.todos.forEach(todo => {
        newTodos[todo.id] = todo;
      });
      return merge({}, state, newTodos);

    case REMOVE_TODO:
      // debugger
      const resTodos = merge({}, state);
      delete resTodos[action.todo.id];
      return resTodos;

    // case UPDATE_TODO:
    //   const updateTodos = merge({}, state);
    //   updateTodos[action.todo.id].done = !action.todo.done;
    //   return updateTodos;

    default:
      return state;
  }
};

export default todosReducer;
