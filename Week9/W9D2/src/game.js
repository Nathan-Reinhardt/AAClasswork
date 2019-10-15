const Asteroid = require("./asteroid.js");
const Bullet = require("./bullet.js");
const Ship = require("./ship.js");

function Game(DIM_X, DIM_Y, NUM_ASTEROIDS) {
  const gridX = DIM_X;
  const gridY = DIM_Y;
  const num_asteriods = NUM_ASTEROIDS;
}

const asteroid_arr = [];

Game.prototype.addAsteroids = function() {
  for (let i; i < num_asteriods; i++) {
    let curr_asteroid = new Asteroid([0,0], this);
    this.randomPosition(curr_asteroid);
    asteroid_arr.push(curr_asteroid);
  }
};

Game.prototype.randomPosition = function(asteroid) {
  asteroid.pos[0] = Math.floor((Math.random() * gridX) + 1);
  asteroid.pos[1] = Math.floor((Math.random() * gridY) + 1);
};

Game.prototype.draw = function(ctx) {

};

Game.prototype.moveObjects = function() {

};

Game.prototype.wrap = function(pos) {
  const grid_arr = [gridX, gridY];

  for (let i = 0; i < pos.length; i++) {
    curr_pos = pos[i];
    if (grid_arr[i] < curr_pos) {
      curr_pos = curr_pos - grid_arr[i];
    }
    else if (curr_pos < 0) {
      curr_pos = curr_pos + grid_arr[i];
    }
    pos[i] = curr_pos;
  }
  
  return pos;
};

module.exports = Game;