import React from 'react';
import StepListContainer from '../step_list/step_list_container';


const TodoDetailView = ({todo, removeServerTodo}) => {
  // debugger
  return (
    <div className='todoDetailView'>
      <p>{todo.body}</p>
      <StepListContainer todoId={todo.id}/>
      <button onClick={ ()=> removeServerTodo(todo) } className="DeleteTodo">Delete Todo</button>
    </div>
  );
};


export default TodoDetailView;
