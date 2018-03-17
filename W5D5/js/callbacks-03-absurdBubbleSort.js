const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}? "yes" or "no"? `, function(res) {
    if (res === "yes") {
      callback(true);
    } else if (res === "no") {
      callback(false);
    }
  });
}

function outerBubbleSortLoop(madeAnySwaps, arr) {
  if (madeAnySwaps) {
    innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
  } else {
    console.log(`Here you go buddy ${arr}`);
    reader.close();
  }
}


// askIfGreaterThan(5, 12, "234");

function innerBubbleSortLoop(arr, i, madeAnySwaps, cB) {
  if (i === (arr.length - 1)) {
    console.log(i);
    console.log(arr.length - 1);
    cB(madeAnySwaps, arr);
    return;
  }

  function swap(isGreaterThan) {
    if (isGreaterThan) {
      [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
      madeAnySwaps = true;
    }
    innerBubbleSortLoop(arr, i + 1, madeAnySwaps, cB);
  }

  askIfGreaterThan(arr[i], arr[i + 1], swap);
}

// askIfGreaterThan(5, 3, () => console.log('peace out'));
innerBubbleSortLoop([3, 1, 2], 0, false, outerBubbleSortLoop);
