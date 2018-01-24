import React from 'react';
// import TodoList from './todos/todo_list';
import TodoListContainer from './todos/todo_list_container';
import TodoForm from './todo_list/todo_form';

const App = () => (
  <div>
    <h1>Our Super Awesome Todo List</h1>
    <TodoListContainer />
  </div>
);

export default App;
