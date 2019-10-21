
const todos = [];
const ul = document.getElementsByClassName("todos");
const form = document.getElementsByClassName("add-todo-form");

document.getElementById("buttn")
.addEventListener("onclick", function (e) {
  e.preventDefault();
  addTodo(todos);
  debugger
});

function addTodo(todos) {
  const entry = document.getElementsByName("add-todo").value[0];

  const toObj = {
    text: entry,
    done: false
  };

  todos.push(toObj);
  document.getElementsByName("add-todo").value[0] = "";

  populateList(todos);
}

function populateList(todos) {
  todos.forEach(el => {
    let label = document.createElement("label");
    label.innerHTML = el.text;
    let list = document.createElement("li");
    list.appendChild(label);
    let ul = document.getElementsByClassName("todos")[0];
    ul.appendChild(list);
  });
}

populateList(todos);