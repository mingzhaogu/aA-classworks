

class Game {
  constructor() {
    this.towers = [[3, 2, 1], [], []];
  }

  promptMove(reader, cb) {
    this.print();
    reader.question("Where do you want to move from? ", function(startTowerIdx) {
      reader.question("Where do you want to move to? ", function(endTowerIdx) {
        const start = parseInt(startTowerIdx);
        const end = parseInt(endTowerIdx);
        cb(start, end);
      });
    });
  }

  isValidMove(start, end) {
    if (![0, 1, 2].includes(start) || ![0, 1, 2].includes(end)) {
      return false;
    }

    if (this.towers[start].length === 0) {
      return false;
    }

    if (this.towers[end][this.towers.length - 1] < this.towers[start][this.towers.length - 1]) {
      return false;
    }

    return true;
  }

  move(start, end) {
    if (this.isValidMove(start, end)) {
      this.towers[end].push(this.towers[start].pop);
      return true;
    } else {
      return false;
    }
  }

  print() {
    JSON.stringify(this.towers);
  }

  isWon() {
    if (this.tower[1].length === 3 || this.tower[2].length === 3) {
      return true;
    } else {
      return false;
    }
  }

  run(completionCallback) {
    do {
      this.promptMove(this.move);
    } while (!this.isWon());

    completionCallback();
  }
}

const winston = new Game;
// winston.isValidMove(winston.isValidMove);
