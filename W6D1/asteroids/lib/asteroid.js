const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

Util.inherits(Asteroid, MovingObject);

function Asteroid(options) {
  let colors = ['red', 'orange', 'yellow', 'green', 'blue'];
  options.color = colors[Math.floor(Math.random() * 5)];
  options.radius = 10;
  options.vel = Util.randomVec(10);
  MovingObject.call(this, options);
}

module.exports = Asteroid;
