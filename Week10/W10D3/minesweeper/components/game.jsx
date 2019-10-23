import React from "react";
import Board from "./board";
import * as Minesweeper from "../minesweeper";

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(9, 10)
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tileObject, bool) {



    tileObject.explore();
    this.setState({ board: this.state.board });
  }

  render() {
    return(
      <div className="game-container">
        <Board board={this.state.board} update={this.updateGame}/>
      </div>
    )
  }
}

export default Game;