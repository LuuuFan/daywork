export const RECEIVE_TODO = 'RECEIVE_TODO';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';


export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo: todo
});

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos: todos
});
