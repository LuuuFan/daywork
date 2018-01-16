const Asteroid = require('./asteroid.js');

function Game(){

}

Game.DIM_X = Math.floor(Math.random() * 1000);
Game.DIM_Y = Math.floor(Math.random() * 1000);
Game.NUM_ASTEROIDS = 12;

Game.prototype.addAsteroids = function() {
  let asteroids = [];
  for (var i = 0; i < Game.NUM_ASTEROIDS; i++) {
    asteroids.push(new Asteroid({pos:[Game.DIM_X, Game.DIM_Y]}));
  }
  this.asteroids = asteroids;
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, 1000, 1000);
  this.asteroids.forEach(ast => ast.draw);
};

Game.prototype.moveObjects = function(){
  this.asteroids.forEach(ast => ast.move);
};


module.exports = Game;
