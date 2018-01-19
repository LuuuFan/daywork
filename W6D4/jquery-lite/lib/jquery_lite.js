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

const DOMNodeCollection = __webpack_require__(1);

window.$l = function newFunction(arg) {
  if (arg instanceof HTMLElement) {
    const result = [];
    result.push(arg);
    return new DOMNodeCollection(result);
  } else {
    const nodeList = document.querySelectorAll(arg);
    const nodeListArray = Array.from(nodeList);
    return new DOMNodeCollection(nodeListArray);
  }
};

// const domNodeCollection = new DOMNodeCollection(window.$l());


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(array) {
    this.array = array;
  }

  html(string) {
    if (string) {
      this.array.forEach( el => {
        // console.log(`elemnt is ${el}`);
        el.innerHTML = string;
      });
      return null;
    } else {
      return this.array[0].innerHTML;
    }
  }

  empty() {
    this.array.forEach( el => {
      el.innerHTML = '';
    });
  }

  append(el) {
    this.array.forEach( node => {
      node.appendChild(el);
      // node.innerHTML += el.outerHTML;
    });
  }

  addClass() {
    const args = Array.from(arguments);
    args.forEach( el => {
      this.array.forEach(node => {
        if (node.className) {
          node.className += ' ' + el;
        } else {
          node.className = el;
        }
      });
    });
  }

  removeClass() {
    this.array.forEach( node => {
      node.className = '';
    });
  }

  children(){
    let result = [];
    this.array.forEach(node => {
      result = result.concat(Array.from(node.children));
    });
    // debugger
    return new DOMNodeCollection(result);
  }

  parent() {
    let result = [];
    this.array.forEach(node => {
      result = result.concat(node.parentNode);
    });
    return new DOMNodeCollection(result);
  }

  find(arg) {
    let result = [];
    this.array.forEach( node => {
      window.$l(arg).array.forEach( el => {
        if (this.children().array.includes(el)) {
          result.push(el);
        }
      });
    });
    return new DOMNodeCollection(result);
  }

  remove() {
    this.array.forEach(node => {
      node.outerHTML = '';
    });
    this.array = [];
  }
}




















module.exports = DOMNodeCollection;


/***/ })
/******/ ]);