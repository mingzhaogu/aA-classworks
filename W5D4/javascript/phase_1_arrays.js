// ARRAY#UNIQ
Array.prototype.uniq = function () {
  let result = [];

  this.forEach(function(el) {
    if (result.includes(el)) {
      return;
    }
    result.push(el);
  });

  console.log(result);
};

// ARRAY#TWOSUM
Array.prototype.twoSum = function () {
  let result = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + i; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }

  console.log(result);
};

// ARRAY#TRANSPOSE

Array.prototype.transpose = function () {
  let result = new Array;

  for (let i = 0; i < this[0].length; i++) {
    result.push([]);
  }

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[0].length; j++) {
      result[j].push(this[i][j]);
    }
  }

  console.log(result);
};
