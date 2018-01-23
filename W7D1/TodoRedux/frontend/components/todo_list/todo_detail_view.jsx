import React from 'react';

const TodoDetailView = ({todo, removeTodo}) => {
  // debugger
  return (
    <div className='todoDetailView'>
      <p>{todo.body}</p>

      <button onClick={ ()=> removeTodo(todo) } className="DeleteTodo">Delete Todo</button>
    </div>
  );
}


export default TodoDetailView;
