class HanoiView {
  constructor (game, $el){
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.render();
    // this.$ul =
  }

  setupTowers(){
    for (var i = 0; i < 3; i++) {
      let ul = document.createElement('ul');
      this.$el.append(ul);
    }
  }

  render(){
    for (var i = 0; i < this.game.towers[0].length; i++) {
      let disc = this.game.towers[0][i];
      let li = document.createElement('li');
      if (disc === 3) {
        $(li).addClass('disc-3');
      } else if (disc === 2){
        $(li).addClass('disc-2');
      } else if (disc === 1){
        $(li).addClass('disc-1');
      }
      this.$el.find('ul')[0].prepend(li);
    }
  }
}


module.exports = HanoiView;
