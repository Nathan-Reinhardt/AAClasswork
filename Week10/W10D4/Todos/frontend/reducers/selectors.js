
export const allTodos = (state) => {
  const newArr = Object.keys(state.todos);
  return newArr.map((id) => {
    return state.todos[id];
  });
};