import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

class Root extends React.Component {
  render() {
    let headers = [
    {
      title: "one",
      content: "I am the first"
    },
    {
      title: "two",
      content: "Second pane here"
    },
    {
      title: "three",
      content: "Third pane here"
    }];
    return (
      <div>
        <Clock />
        <Tabs jason={headers} />
      </div>
    );
  }
}

export default Root;