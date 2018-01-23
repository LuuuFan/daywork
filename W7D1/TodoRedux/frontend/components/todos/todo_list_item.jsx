import React from 'react';


const TodoListItem = (props) => {
  // debugger
  return (
    <li>
      <a>
        {props.todo.title}
      </a>
      <button>{ props.todo.done ? 'Undo' : 'Done' }</button>
      <button onClick={ props.removeTodo } className="DeleteTodo">Delete Todo</button>
    </li>
  );
};

export default TodoListItem;
