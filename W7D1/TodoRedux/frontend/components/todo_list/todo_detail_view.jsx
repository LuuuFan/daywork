import React from 'react';

const TodoDetailView = (props) => {
  // debugger
  return (
    <div className='todoDetailView'>
      <p>{props.todo.body}</p>

      <button onClick={ ()=> props.removeTodo(props.todo) } className="DeleteTodo">Delete Todo</button>
    </div>
  );
}


export default TodoDetailView;
