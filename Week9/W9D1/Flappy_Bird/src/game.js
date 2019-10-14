import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  animate() {
    Level.drawBackground(this.ctx);
  }

  restart() {
    this.level = new Level(this.dimensions);
    this.animate();
  };
}

class Bird {
  constructor(width, height) {
    this.velocity = 0;
    this.width = width;
    this.height = height;
    this.x = 160;
    this.y = 320;
  }

  drawBird(ctx) {
    ctx.fillStyle = 'yellow';
    void ctx.fillRect(this.x, this.y, this.width, this.height);
  }

  animate() {
    this.drawBird(ctx);
  }
}

