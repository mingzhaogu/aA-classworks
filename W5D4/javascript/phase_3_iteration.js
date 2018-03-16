// //  ARRAY#BUBBLESORT
// Array.prototype.bubbleSort = function () {
//   let flag = true;
//
//   for (let i = 1; flag === true; i++) {
//     flag = false;
//
//     switch (this[i - 1] > this[i]) {
//       case true:
//         let x = this[i - 1];
//         this[i - 1] = this[i];
//         this[i] = x;
//         flag = true;
//     }
//   }
//
//   return this;
// };

Array.prototype.bubbleSort = function () {

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      switch (this[i] > this[j]){
        case true:
          let x = this[i];
          this[i] = this[j];
          this[j] = x;
      }
    }
  }

  return this;
};

// STRING#SUBSTRINGS
String.prototype.substrings = function () {
  let result = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j <= this.length; j++) {
      if (j <= i) {
        continue;
      } else {
        result.push(this.slice(i, j));
      }
    }
  }

  return result;
};
