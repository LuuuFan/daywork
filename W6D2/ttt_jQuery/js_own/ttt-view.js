class View {
  constructor(game, $el) {
    this.game = game;
    this.$ul = $el.find('ul');
  }

  bindEvents() {
    this.$ul.on('click', (e)=>{
      let pos = $(e.target).data('pos');
      debugger
      this.game.playMove(pos[0]);
    });
  }

  makeMove($square) {}

  setupBoard() {
    // debugger
    for (var i = 0; i < 9; i++) {
      let li = document.createElement('li');
      $(li).data('pos', [i]);
      this.$ul.append(li);
    }
  }
}

module.exports = View;
