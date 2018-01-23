

export const todoSelector = ({todos}) => {
  return Object.keys(todos).map(id => todos[id]);
};

// export default todoSelector;
