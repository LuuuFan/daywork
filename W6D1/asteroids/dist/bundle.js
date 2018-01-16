/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(1);


document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");
  const gv = new GameView(ctx);
  gv.start();
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(2);


function GameView (ctx) {
  this.game = new Game();
  this.ctx = ctx;
}


GameView.prototype.start = function (){
  setInterval(() => {
    this.game.moveObjects();
    this.game.draw();
  }, 20);
};

module.exports = GameView;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(4);
const MovingObject = __webpack_require__ (5);

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


/***/ }),
/* 4 */
/***/ (function(module, exports) {

const Util = {
  inherits: function(childClass, parentClass) {
    function Surrogate(){}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },
  // Return a randomly oriented vector with the given length.
  randomVec: function(length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale: function(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }

};



module.exports = Util;


/***/ }),
/* 5 */
/***/ (function(module, exports) {

function MovingObject(optionsObject) {
  this.color = optionsObject['color'];
  this.radius = optionsObject['radius'];
  this.pos = optionsObject['pos'];
  this.vel = optionsObject['vel'];
}

MovingObject.prototype.draw = function draw(ctx){
  // document.addEventListener("DOMContentLoaded", function(){
  //   const canvasEl = document.getElementById('canvas');
  //   canvasEl.width = 1000;
  //   canvasEl.height = 800;
  // });
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.fill();
};


MovingObject.prototype.move = function move(){};


MovingObject.prototype.isCollidedWith = function isCollidedWith(otherMovingObject){};

module.exports = MovingObject;









//
//
// const mo = new MovingObject(
//   { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
// );
//
// console.log(mo);


/***/ })
/******/ ]);