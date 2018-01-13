const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor(stack) {
    this.stack = stack;
  }

  run() {

  }

  promptMove() {
    console.log(this.stack);
    reader.question('Please input which tower you want to start and end', (res) => {
      // console.log(res);
      let [startTowerIdx, endTowerIdx] = res.split(',');
      console.log(`Move from ${startTowerIdx} to ${endTowerIdx}`);
    });
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    const startTower = this.stack[startTowerIdx];
    const endTower = this.stack[endTowerIdx];
    console.log('check valid?');
    if (startTower.length === 0) {
      return false;
    } else if(endTower[0] < startTower[0]) {
      return false;
    } else {
      return true;
    }
  }
}

const game = new Game([[1,2,3],[],[]]);
// game.promptMove();
// console.log(game.isValidMove(0, 1));
// console.log(game.isValidMove(1, 0));
