import React from 'react';

const StepListItem = ({step, removeStep}) => {
  // debugger
  return (
    <li className='step_list_item'>
      <div>
        <h3>{step.title}</h3>
        <p>{step.description}</p>
      </div>
      <button onClick={ ()=> removeStep(step) } className="DeleteTodo">Delete</button>
    </li>
  );
};

export default StepListItem;
