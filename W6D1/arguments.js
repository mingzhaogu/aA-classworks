const sum = function() {
  let total = 0;
  Array.from(arguments).forEach((num) => {
    total += num;
  });
  return total;
};
// console.log(sum(1,2,3,4,5,6,76,8,8));

const restSum = function(...numbers) {
  let total = 0;
  numbers.forEach((num) => {
    total += num;
  });
  return total;
};

// console.log(restSum(1,2,3,4,5,6,76,8,8));


Function.prototype.myBind = function(context, ...stuff) {
  return (...moreStuff) => {
    return this.apply(context, stuff.concat(moreStuff));
  };
};


// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// console.log(markov.says("meow", "Ned"));
// console.log(markov.says.myBind(breakfast, "meow", "Kush")());
// console.log(markov.says.myBind(breakfast)("meow", "a tree"));
// console.log(markov.says.myBind(breakfast, "meow")("Markov"));
//
// const notMarkovSays = markov.says.myBind(breakfast);
// console.log(notMarkovSays("meow", "me"));


const curriedSum = function(numArgs) {
  let numbers = [];

  const _curriedSum = function(arg) {
    numbers.push(arg);

    if (numbers.length === numArgs) {
      let total = 0;
      numbers.forEach((num) => {
        total += num;
      });
      return total;
    } else {
      return _curriedSum;
    }
  };

  return _curriedSum;
};

// console.log(asdf = curriedSum(4));
// console.log(asdf(5)(30)(20)(1));

Function.prototype.curry = function(numArgs) {
  let args = [];

  const _steph = (...moreArgs) => {
    args.concat(moreArgs);

    if (args.length >= numArgs) {
      return this(...args);
    } else {
      return _steph;
    }
  };
  return _steph;
};


Function.prototype.curry = function(numArgs) {
  let args = [];

  const _steph = (arg) => {
    args.push(arg);

    if (args.length >= numArgs) {
      // return this(...args);
      return this.apply(null, args);
    } else {
      return _steph;
    }
  };
  return _steph;

};
