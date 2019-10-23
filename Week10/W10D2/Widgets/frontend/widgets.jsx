import React from "react";
import ReactDOM from "react-dom";
import Root from "../frontend/root";

document.addEventListener("DOMContentLoaded", () => {
  const rootDiv = document.getElementById("root");
  ReactDOM.render(<Root />, rootDiv);
  // const death = document.getElementByClassName("clock")[0];
  // death.addEventListener("mouseenter", () => {
  //   this.innerHTML = "You Dead >=)";
  // });
});