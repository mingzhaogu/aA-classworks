const Asteroid = require('./asteroid.js');

function Game() {
  this.DIM_X = 100;
  this.DIM_Y = 100;
  this.NUM_ASTEROIDS = 1000;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({ pos: this.randomPosition(), game: this }));
  }
};

Game.prototype.randomPosition = function () {
  const x = Math.floor(Math.random() * 1000);
  const y = Math.floor(Math.random() * 750);
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0,0,1000,750);
  this.asteroids.forEach(function(asteroid) {
    asteroid.draw(ctx);
  });
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach(function(asteroid) {
    asteroid.move();
  });
};

Game.prototype.wrap = function(pos) {
  if (pos[0] >= 1000) pos[0] = 0;
  if (pos[0] < 0) pos[0] = 1000;
  if (pos[1] >= 750) pos[1] = 0;
  if (pos[1] < 0) pos[1] = 750;
};

module.exports = Game;
