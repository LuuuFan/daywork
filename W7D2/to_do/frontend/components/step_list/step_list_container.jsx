import React from 'react';
import { connect } from 'react-redux';
import StepList from './step_list';
import { stepsByTodoId } from '../../reducers/selectors';
import { receiveStep, receiveSteps } from '../../actions/step_actions';

const mapStateToProps = (state, todoId) => {
  return {
    steps: stepsByTodoId(state, todoId),
    errors: state.errors ? state.errors : ''
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveStep: (step) => dispatch(receiveStep(step)),
    receiveSteps: (steps) => dispatch(receiveSteps(steps)),
    // removeStep: (step) => dispatch(removeStep(step)),
  };
};


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);
