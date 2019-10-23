import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      date: new Date()
    };
  }

  tick() {
    this.setState({
      date: new Date()
    });
  }

  componentDidMount() {
    this.timeID = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.timeID);
  }

  render () {
    return (
      <div className="clock">
        <h1>The time is: {this.state.date.toLocaleTimeString()}.</h1>
      </div>
    );
  }
}

export default Clock;