import React from 'react';
import TodoDetailViewContainer from '../todo_list/todo_detail_view_container';

const TodoListItem = (props) => {
  // debugger
  return (
    <li>
      <div className='todoHeader'>
      <h3>
        <a>
          {props.todo.title}
        </a>
      </h3>
      <button onClick={()=> props.updateTodo(props.todo)}>{ props.todo.done ? 'Undo' : 'Done' }</button>
      </div>
      <TodoDetailViewContainer todo={props.todo} />
    </li>
  );
};

export default TodoListItem;



// <button onClick={ ()=>props.removeTodo(props.todo) } className="DeleteTodo">Delete Todo</button>
//
