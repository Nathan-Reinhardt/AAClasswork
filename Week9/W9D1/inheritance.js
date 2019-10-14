// function Surrogate() { }

// Function.prototype.inherits = function(func) {
//   Surrogate.prototype = func.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// }

Function.prototype.inherits = function(func) {
  this.prototype = Object.create(func.prototype);
  this.prototype.constructor = this;
};



function MovingObject() { }

MovingObject.prototype.sayMessage = function (){
  console.log("I'm a moving object");
};

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

const s = new Ship();
s.sayMessage();

const a = new Asteroid();
a.sayMessage();

