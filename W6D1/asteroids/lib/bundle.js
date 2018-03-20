/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(1);



// const asteroid = new Asteroid(
//   { pos: [30, 30] }
// );

document.addEventListener('DOMContentLoaded', function(event) {
  const ctx = document.getElementById('game-canvas').getContext('2d');
  const view = new GameView(ctx);
  view.start();
});

// window.ctx = document.getElementById('game-canvas').getContext('2d');


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(2);

function GameView(ctx) {
  this.game = new Game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(()=>{
    this.game.draw(this.ctx);
    this.game.moveObjects();
  }, 20);
};

module.exports = GameView;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(4);
const MovingObject = __webpack_require__(5);

Util.inherits(Asteroid, MovingObject);

function Asteroid(options) {
  let colors = ['red', 'orange', 'yellow', 'green', 'blue'];
  options.color = colors[Math.floor(Math.random() * 5)];
  options.radius = 10;
  options.vel = Util.randomVec(10);
  MovingObject.call(this, options);
}

module.exports = Asteroid;


/***/ }),
/* 4 */
/***/ (function(module, exports) {

const Util =  {
  inherits(childClass, parentClass) {
  function Surrogate() {}
  Surrogate.prototype = parentClass.prototype;
  childClass.prototype = new Surrogate();
  childClass.constructor = childClass;
  },
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;


/***/ }),
/* 5 */
/***/ (function(module, exports) {

function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
  this.game.wrap(this.pos);
};

module.exports = MovingObject;


/***/ })
/******/ ]);