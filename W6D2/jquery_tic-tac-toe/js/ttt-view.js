class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $li = $('li');

    $li.hover(event => {
      $(event.currentTarget).addClass("hovered");
    }, event => {
      $(event.currentTarget).removeClass("hovered");
    });

    $li.on("click", event => {
      this.makeMove($(event.currentTarget));
    });
  }

  makeMove($square) {
    this.game.playMove($square.data("data-pos"));
    $square.addClass("clicked");

    if (this.game.currentPlayer === 'x') {
      $square.html('<p>🇺🇸</p>');
    } else {
      $square.append('<p>🇷🇺</p>');
    }

    if (this.game.isOver()) {
      const winner = this.game.winner();
      if (winner) {
        if (winner === 'x') {
          $(".ttt").append(`<h2>Russia has won!</h2>`);
        } else {
          $(".ttt").append(`<h2>The United States of America has won!</h2>`);
        }
      } else {
        $(".ttt").append(`<h2>It's a draw!</h2>`);
      }
    }
  }

  setupBoard() {
    this.el.append("<ul></ul>");

    for (let i = 0; i < 9; i++) {
      const tile = $('<li></li>');

      const row = Math.floor(i / 3);
      const col = (i % 3);

      tile.data("data-pos", [row, col]);
      $("ul").append(tile);
    }
  }
}

module.exports = View;
