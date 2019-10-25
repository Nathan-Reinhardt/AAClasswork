import * as TodoActions from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);

  switch (action.type) {
    case TodoActions.RECEIVE_TODOS:
      const todosObj = {};
      for (let i = 0; i < action.todos.length; i++) {
        todosObj[action.todos[i].id] = action.todos[i];
      }
      nextState = todosObj;
      return nextState;
    case TodoActions.RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;