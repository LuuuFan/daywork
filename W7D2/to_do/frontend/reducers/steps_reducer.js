import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from '../actions/step_actions';
import { merge } from 'lodash';


const initialState = {
  1: { // this is the step with id = 1
    id: 1,
    title: 'step 1',
    description: 'walk to store',
    done: false,
    todo_id: 1
  },
  2: { // this is the step with id = 2
    id: 2,
    title: 'step 2',
    description: 'buy soap',
    done: false,
    todo_id: 1
  }
};

export const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_STEPS:
      newState = {};
      for (const step of action.steps) {
        newState[step.id] = step;
      }
      return newState;

    case RECEIVE_STEP:
      newState = merge({}, state);
      newState[action.step.id] = action.step;
      return newState;

    case REMOVE_STEP:
      newState = merge({}, state);
        delete newState[action.step.id];
        return newState;

    default:
      return state;
  }

};
