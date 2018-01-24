export const RECEIVE_STEP = 'RECEIVE_STEP';
export const RECEIVE_STEPS = 'RECEIVE_STEPS';
export const REMOVE_STEP = 'REMOVE_STEP';
// export const UPDATE_STEP = 'UPDATE_STEP';




export const receiveStep = (step) => ({
  type: RECEIVE_STEP,
  step: step
});

export const receiveSteps = (steps) => ({
  type: RECEIVE_STEPS,
  steps: steps
});

export const removeStep = (step) => ({
  type: REMOVE_STEP,
  step: step
});
