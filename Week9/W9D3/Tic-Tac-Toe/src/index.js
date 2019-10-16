const View = require("./ttt-view.js");
const Game = require("./game.js");

  $(() => {
    const $container = $('.ttt');
    const real_game = new Game();
    new View(real_game, $container);
  });
