//oldstyle
Function.prototype.inherits = function(SuperClass) {
  const Surrogate = function() {};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.contructor = this;
};

//ES5
Function.prototype.inherits2 = function(SuperClass) {
  this.prototype = Object.create(SuperClass.prototype);
  this.prototype.contructor = this;
};

//ES6
// class MovingObject {
//
// }
//
// class Ship extends MovingObject{
//
// }

//test *************************
function MovingObject () {}

MovingObject.prototype.meow = function(){
  console.log('meow meow meow');
};

function Ship () {}
Ship.inherits2(MovingObject);

function Asteroid () {}
Asteroid.inherits2(MovingObject);

let titanic = new Ship();
let felix = new Asteroid();

titanic.meow();
felix.meow();
