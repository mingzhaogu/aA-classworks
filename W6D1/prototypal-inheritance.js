Function.prototype.inherits = function(parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};
//refactor
Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject() {
  this.color = 'blue';

}

MovingObject.prototype.andy = function() {
  console.log("Andy is cool");
};

function Ship () {}
Ship.inherits(MovingObject);
const mayflower = new Ship;
mayflower.andy();
// MovingObject.andy()
