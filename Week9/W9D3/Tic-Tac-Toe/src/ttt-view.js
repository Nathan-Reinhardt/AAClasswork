let current_player = "x";
let li_array = [];

class View {

  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents(this, this.game);
  }

  bindEvents(context, game) {
    $('li').on('click', function(e) {
      context.makeMove(e.target, game);
    });
  }

  makeMove($square, game) {

    let $li = $($square);
    if (!$($li).hasClass("show-change")) {
      if (current_player === "x") {
        $li.text('x');
        current_player = "o";
      } else {
        $li.text('o');
        current_player = "x";
      }
      $li.addClass("show-change");
      let pos = null;
      console.log($("#id"));

      // for (let i = 0; i < li_array.length; i++) {
      //   if ($("#id") === i) {
      //     let index = i;
      //   }
      // }

      let hash = {
        0 : [0,0],
        1 : [0,1],
        2 : [0,2],
        3 : [1,0],
        4 : [1,1],
        5 : [1,2],
        6 : [2,0],
        7 : [2,1],
        8 : [2,2]
      };

    //   game.playMove(hash[index]);

    //   if (game.isOver()) {
    //     console.log("someone has won");
    //   }
    } 
    else {
      alert("This is an invalid move");
    }
  }

  setupBoard() {
    let $list = $("<ul>");
    this.$el.append($list);
    for (let i = 0; i < 9; i++) {
      let $li = $("<li>");
      $list.append($li);
      li_array.push($li);
    }
  }
}

module.exports = View;
