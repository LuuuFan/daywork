import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
// import {todoSelector} from './reducers/selectors';
// import { RECEIVE_TODO, RECEIVE_TODOS, receiveTodo, receiveTodos } from './actions/todo_actions';

// import store from './store/store';
// import rootReducer from './reducers/rootReducer';

// window.store = configureStore();

// window.receiveTodo = receiveTodo;
// window.receiveTodos = receiveTodos;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  // window.todoSelect = todoSelector;
  window.store = store;
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});
