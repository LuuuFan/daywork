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

const View = __webpack_require__(1)// require appropriate file
const Game = __webpack_require__(2)// require appropriate file

$( () => {
  // Your code here
  let game = new Game();
  let view = new View(game, $('.ttt'));
  view.setupBoard();
  view.bindEvents();
});


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);