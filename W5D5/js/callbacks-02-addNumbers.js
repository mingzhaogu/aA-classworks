const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  }

  if (numsLeft > 0) {
    reader.question('Wasyodigit? ', (res) => {
      sum += parseInt(res);
      numsLeft--;
      console.log(`Your sum is: ${sum}. Numbers left is ${numsLeft}.`);
      addNumbers(sum, numsLeft, completionCallback);
    });
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
