import React from 'react';


const TodoListItem = (props) => (
  <li>
    <a>
      {props.todo.title}
    </a>
    <button>{ props.todo.done ? 'Undo' : 'Done' }</button>
  </li>
);

export default TodoListItem;
