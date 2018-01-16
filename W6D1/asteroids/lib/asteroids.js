const GameView = require('./game_view.js');


document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");
  const gv = new GameView(ctx);
  gv.start();
});
