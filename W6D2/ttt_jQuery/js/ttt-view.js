const Board = require('./board.js');

class View {
  constructor(game, $el) {
    this.game = game;
    this.$ul = $el.find('ul');
    this.board = new Board();
    // this.mark = 'x';
  }

  bindEvents() {
    this.$ul.on('click', (e)=>{
      let pos = $(e.target).data('pos');
      this.game.playMove(pos);
      // debugger
      if (this.game.currentPlayer === 'o') {
        $(e.target).addClass('x');
      } else {
        $(e.target).addClass('o');
      }
      if (this.game.winner()) {
        this.$ul.addClass('gameover');
        let message = document.createElement('figcaption');
        message.innerHTML = 'You win, ' + `${this.game.winner()}`;
        this.$ul.append(message);
        this.$ul.off('click');
      } else if (this.game.isOver()){
        let message = document.createElement('figcaption');
        message.innerHTML = 'Game Over';
        this.$ul.append(message);
        this.$ul.off('click');
      }
    });
  }

  makeMove($square) {

  }

  setupBoard() {
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        let li = document.createElement('li');
        $(li).data('pos', [i, j]);
        this.$ul.append(li);
      }
    }
  }
}

module.exports = View;
