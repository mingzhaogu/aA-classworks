const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class TowersOfHanoi {
  g = new Game(reader, completionCallback);
}
