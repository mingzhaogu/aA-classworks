// Array#myEach
const cb = function (num) {
  return num * 2;
};

const cb2 = function (num, num2) {
  return num + num2;
};

Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    console.log(callback(this[i]));
  }
};

// Array#myMap

Array.prototype.myMap = function (callback) {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    result.push(callback(this[i]));
  }
  return result;
};

// Array#myReduce

Array.prototype.myReduce = function (someFunction, acc) {
  let i = 0;

  if (acc === undefined) {
    i = 1;
    acc = this[0];
  }

  this.slice(i).myEach(function (el) { acc = someFunction(acc, el); });

  return acc;
};
