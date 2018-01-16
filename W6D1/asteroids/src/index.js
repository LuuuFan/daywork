import _ from 'lodash';
const Asteroid = require ('./../lib/asteroid.js');
const Bullet = require ('./../lib/bullet.js');
const GameView = require ('./../lib/game_view.js');
const Game = require ('./../lib/game.js');

// const Utils = require ('./../lib/utils.js');


function component() {
  var element = document.createElement('div');

  // Lodash, currently included via a script, is required for this line to work
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());
