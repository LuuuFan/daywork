
import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';

 const TodoList = ({todos, receiveTodo, updateTodo}) => (
  <div>
   <ul>
     {todos.map(todo =>
       <TodoListItem todo={todo} updateTodo={updateTodo} key={todo.id}/>
     )}
   </ul>
   <TodoForm receiveTodo={receiveTodo}/>
  </div>

 );

 export default TodoList;
