export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const CLEAR_ERRORS = 'CLEAR_ERRORS';

export const receiveErrors = (errors) => {
  // debugger

  return {
    type: RECEIVE_ERRORS,
    errors: errors
  };
};

export const clearErrors = (errors) => ({
  type: CLEAR_ERRORS,
  errors: errors
});
