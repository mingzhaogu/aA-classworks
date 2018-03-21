const HanoiGame = require('./game.js');
const HanoiView = require('./hanoi-view.js');

$( () => {
  console.log("Hi Mom!");
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});
