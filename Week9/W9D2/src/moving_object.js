const Game = require("./game.js");

function MovingObeject(object) {
  this.pos = object.pos;
  this.vel = object.vel;
  this.radius = object.radius;
  this.color = object.color;
}

const mo = new MovingObeject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});

MovingObeject.prototype.draw = function(ctx) {
  
};

MovingObeject.prototype.move = function() {
  this.pos[0] = this.pos[0] + this.vel[0];
  this.pos[1] = this.pos[1] + this.vel[1];
};

module.exports = MovingObeject;