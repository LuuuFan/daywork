import React from 'react';
import StepListItemContainer from './step_list_item_container';


class StepList extends React.Component {
  constructor (){
    super();
  }

  render (){
    const {steps, receiveStep, receiveSteps, removeStep, todoId } = this.props;
    // debugger
    return (
      <ul>
        {steps.map(step =>
          <StepListItemContainer step={step} key={step.id}/>
        )}
      </ul>
    );
  }
}

export default StepList;
