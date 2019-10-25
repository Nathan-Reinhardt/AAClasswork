import React from "react";
import { uniqueId } from "../../util/util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: uniqueId(),
      title: "",
      body: "",
      done: false
    };
  }

  render() {
    return (
      <form>
        <label>Title
          <input type="text" value={this.state.title}/>
        </label>
        <label>Body
          <input type="text" value={this.state.body}/>
        </label>
        <input type="submit" value="submit"/>
      </form>
    )
  }
}

export default TodoForm;