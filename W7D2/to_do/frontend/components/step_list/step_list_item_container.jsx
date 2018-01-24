import React from 'react';
import StepListItem from './step_list_item';
import { connect } from 'react-redux';
import { removeStep, receiveStep } from '../../actions/step_actions';


const mapDispatchToProps = (dispatch) => {
  return {
    removeStep: (step) => dispatch(removeStep(step)),
    receiveStep: (step) => dispatch(receiveStep(step)),
  };
};


export default connect(null, mapDispatchToProps)(StepListItem);
