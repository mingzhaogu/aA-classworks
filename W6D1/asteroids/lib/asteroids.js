const GameView = require('./game_view.js');



// const asteroid = new Asteroid(
//   { pos: [30, 30] }
// );

document.addEventListener('DOMContentLoaded', function(event) {
  const ctx = document.getElementById('game-canvas').getContext('2d');
  const view = new GameView(ctx);
  view.start();
});

// window.ctx = document.getElementById('game-canvas').getContext('2d');
