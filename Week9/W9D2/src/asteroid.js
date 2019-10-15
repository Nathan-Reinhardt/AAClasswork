const MovingObject = require("./moving_object.js");
const Game = require("./game.js");

function Asteroid(pos, game, color = "#713B2F", radius = 5) {
  this.pos = pos;
  this.game = game;
}

const Util = {
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Asteroid;