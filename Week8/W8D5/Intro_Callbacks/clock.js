class Clock {
  constructor() {
    const today = new Date();

    this.hours = today.getHours();
    this.minutes = today.getMinutes();
    this.seconds = today.getSeconds();

    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`The time is ${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
  
    const upper_limit = 59;
    const hour_limit = 23;

    if (this.seconds === upper_limit) {
      this.seconds = 0;
      this.minutes++;
    }
    else {
      this.seconds++;
    }
    if (this.minutes > upper_limit) {
      this.minutes = 0;
      this.hours++;
    }
    if (this.hours > hour_limit) {
      this.hours = 0;
    }

    this.printTime();
  }
}

const clock = new Clock();