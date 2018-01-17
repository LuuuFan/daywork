class Game {
  constructor(){
    this.player1 = [];
    this.player2 = []; //[0,1,6,7,4,2]
    this.currentPlayer = this.player1;
    this.winArray = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ];
  }

  switchPlayer(){
    if (this.currentPlayer === this.player1) {
      this.currentPlayer = this.player2;
    } else {
      this.currentPlayer = this.player1;
    }
  }



  isWin(arr, target){
    for (var i = 0; i < arr.length - 2; i++) {
      for (var j = i + 1; j < arr.length - 1; j++) {
        for (var k = j + 1; k < arr.length; k++) {
          let test = [arr[i], arr[j], arr[k]];
          if (test === target) {
            return true;
          }
        }
      }
    }
    return false;
  }

  playMove (pos){
    // debugger
    this.currentPlayer.push(pos);
    // for (var i = 0; i < WIN.length; i++) {
    //
    // }
    this.switchPlayer();
  }
}

module.exports = Game;
