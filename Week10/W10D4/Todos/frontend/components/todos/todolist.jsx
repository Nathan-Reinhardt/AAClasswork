import React from "react";
import { TodoListItem } from "../todo_list/todo_list_item";
import TodoForm from "../todo_list/todo_form";
export const TodoList = (props) => {

  let lis = props.todos.map((todo) => {
    return (
      <TodoListItem key={todo.id} todo={todo} />
    )
  });
  
  return (
    <div>
      <ul>
        {lis}
      </ul>
      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  )
};