import React from 'react';

const StepListItem = ({step, removeStep}) => {
  // debugger
  return (
    <li className='step_list_item'>
      <div>
        <h3>{step.title}</h3>
        <p>{step.description}</p>
      </div>
      <div>
        <button onClick={()=> step.updateTodo(this.props.todo)} className={step.done ? 'Undo' : 'Done'}>{ step.done ? 'Undo' : 'Done' }</button>
        <button onClick={ ()=> removeStep(step) } className="DeleteTodo">Delete</button>
      </div>
    </li>
  );
};

export default StepListItem;
