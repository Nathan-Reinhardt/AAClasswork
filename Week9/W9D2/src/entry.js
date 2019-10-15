const GameView = require("./game_view.js");
const MovingObject = require("./moving_object.js");
const Game = require("./game.js");

const mo = new MovingObject({ 
  pos: [10, 10],
  ves: [10, 10],
  radius: 5,
  color: "#00FF00"
});

const game = new Game(500, 500, 10);

const view = new GameView(game, ctx);

const asteroid = new Asteriod({
  pos: [30, 30]
}, game);

window.MovingObject = MovingObject;
window.Asteriod = Asteriod;
window.Game = Game;
window.GameView = GameView;