import React from "react";
import Tile from "./tile";

class Board extends React.Component {
  constructor(props) {
    super(props);
    this.grid = this.props.board.grid;
  }

  render() {
    return (
      <div className="board-container">
        {this.grid.map((row, i) => {
          return (
            <div className="row-container" 
            key={i}>
              {row.map((tile, j) => {
                return (
                  <div key={j}>
                    <Tile object={tile} update={this.props.update}/>
                  </div>
                )
              })}
            </div>
          )
        })}
      </div>
    )
  }
}

export default Board;