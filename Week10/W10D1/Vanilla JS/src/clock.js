import { htmlGenerator } from "./warmup";

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
    let sec = `${this.seconds}`;
    if (this.seconds < 10) {
      let sec = `0${this.seconds}`;
    }
    let min = `${ this.minutes }`;
    if (this.minutes < 10) {
      let min = `0${this.minutes}`;
    }
    return `${this.hours}:${min}:${sec}`;
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

    htmlGenerator(clock.printTime(), clockElement);
  }
}

const clock = new Clock();
export default clock;
const clockElement = document.getElementById('clock');
// htmlGenerator(clock.printTime(), clockElement);
clock._tick();