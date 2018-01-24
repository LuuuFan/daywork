

export const todoSelector = ({todos}) => {
  return Object.keys(todos).map(id => todos[id]);
};



export const stepsByTodoId = (state, todoId) => {
  // debugger
  const result = []
  Object.keys(state.steps).forEach(idx => {
    if(state.steps[idx].todo_id === todoId.todoId){
      result.push(state.steps[idx]);
    }
  });
  // debugger
  return result;

};

// export default todoSelector;
