import React from 'react';


const TodoListItem = (props) => {
  // debugger
  return (
    <li>
      <a>
        {props.todo.title}
      </a>
      <button onClick={()=> props.updateTodo(props.todo)}>{ props.todo.done ? 'Undo' : 'Done' }</button>
      <button onClick={ ()=>props.removeTodo(props.todo) } className="DeleteTodo">Delete Todo</button>
    </li>
  );
};

export default TodoListItem;
