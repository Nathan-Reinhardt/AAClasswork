import React from "react";

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = props.jason[0];
  }

  setContent(text) {
    console.log("boom");
    this.setState({content: text});
  }

  render() {
    return (
      <div className="tab">
        <h3>Your Tabs</h3>
        <nav>
          <button onClick = {() => this.setContent(this.props.jason[0].content) } >{this.props.jason[0].title}</button>

          <button onClick = {() => this.setContent(this.props.jason[1].content)} >{this.props.jason[1].title}</button>

          <button onClick = {() => this.setContent(this.props.jason[2].content)} >{this.props.jason[2].title}</button>
        </nav>
        <ul>
          <li>{this.state.content}</li>
        </ul>
      </div>
    );
  }
}

export default Tabs;