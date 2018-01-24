
export const fetchTodos = () => {
  return $.ajax({
    url: '/api/todos',
    method: 'GET',
    // datatype: 'json',
  });
};


export const createTodo = (todo) => {
  return $.ajax({
    url: '/api/todos',
    method: 'POST',
    data: { todo: todo},
    datatype: 'json',
  });
};

export const updateTodo = (todo) => {
  return $.ajax({
    url: `/api/todos/${todo.id}`,
    method: 'PATCH',
    data: {todo: todo},
    datatype: 'json',
  });
};

export const removeTodo = (todo) =>{
return $.ajax({
    url: `/api/todos/${todo.id}`,
    method: 'DELETE',
    data: {todo: todo},
    datatype: 'json',
  });
};
