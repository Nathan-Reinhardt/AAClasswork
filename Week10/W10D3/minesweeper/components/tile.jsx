import React from "react";
//this.props.object: Tile {board: Board, pos: Array(2), bombed: false, explored: false, flagged: false}
class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      text: ""
    }
    this.tile = this.props.object;
    this.update = this.props.update;
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    let ti = e.currentTarget;

    if (e.altKey) {
      if (ti.className === "flagged") {
        ti.className = "tile";
        this.setState({ text: "" })
      } else if (ti.className === "tile") {
        ti.className = "flagged";
        this.setState({ text: "⚐" })
      }
    } 
    else if (ti.className !== "flagged") {
      if (this.tile.bombed) {
        ti.className = "bombed";
        this.setState({ text: "💣" })
      }
      else {
        ti.className = "revealed";
        this.setState({ text: `${this.tile.adjacentBombCount()}` })
      }
    }
    this.update(this.tile);
  }

  render() {
    return (
      <div className="tile" onClick={ this.handleClick }>{this.state.text}
      </div>
    )
  }
}

export default Tile;