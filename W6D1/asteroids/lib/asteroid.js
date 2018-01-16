const Util = require('./utils.js');
const MovingObject = require ('./moving_object.js');

function Asteroid (optionsObject) {
  MovingObject.call(this, {
    pos: optionsObject['pos'],
    vel: Util.randomVec,
    color: Asteroid.COLOR,
    radius: Asteroid.RADIUS});
}

Asteroid.COLOR = 'purple';
Asteroid.RADIUS = 5;

Util.inherits(Asteroid, MovingObject);

// let ast = new Asteroid({pos: [1,2]});
// console.log(ast);

module.exports = Asteroid;
