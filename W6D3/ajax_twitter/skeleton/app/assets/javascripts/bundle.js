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

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(2);

$(() => {
  // debugger
  // alert('bundle is working,jQuery');
  const followToggle = new FollowToggle($('.follow-toggle'));
  const searchUsers = new UsersSearch($('.users-search'));
});


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class FollowToggle{
  constructor (el){
    this.$el = $(el);
    this.userId = this.$el.data("userid");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  }


  render (){
    // debugger
    if (this.followState === false) {
      this.$el.text('follow');
    } else {
      this.$el.text('unfollow');
    }
  }

  // toggleFollowState(){
  //   if (this.followState === false) {
  //     this.followState = true;
  //   } else {
  //     this.fllowSate = false;
  //   }
  // }

   handleClick () {
    this.$el.on("click", (event) => {
      event.preventDefault();
      this.$el.prop("disable", true);
      this.$el.text('processing...');
      let method = this.followState ? 'DELETE' : 'POST';
      $.ajax({
        url: `/users/${this.userId}/follow`,
        type: method,
        dataType: 'json',
        // debugger
        success: ()=>{
          // debugger
          this.followState = !this.followState;
          this.render();
          this.$el.prop("disable", false);
        },
        error: ()=>{

        },
      });

    });
  }

}


module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);

class UsersSearch {

  constructor (el) {
    this.$el = $(el);
    // debugger
    this.input = this.$el.find('input');
    this.ul = this.$el.find('ul');
    this.handleInput();
  }

  searchUsers (queryVal) {
    this.ul.empty();
    $.ajax({
      url: '/users/search',
      type: 'GET',
      dataType: 'json',
      data: { query: queryVal},
      success: (data) => {
        // debugger
        data.forEach(el => {
          // const $li = $('<li></li>')
          console.log(el);
          // debugger
          // const li = document.createElement('li');
          // $(li).text(`${el.username}`);
          const $li = $("<li>");
          const $a = $('<a>', {text: `${el.username}`, href: `/users/${el.id}`});
          // const $button = $("<button>", {"class": 'follow-toggle'});
          const button = document.createElement('button');
          $(button).addClass('follow-toggle');
          $(button).data('userid', `${el.id}`);
          $(button).data('initial-follow-state', el.followed);
          let btn = new FollowToggle(button);
          btn.render();
          $li.append($a);
          $li.append(button);
          this.ul.append($li);
        });
        // debugger
      },
      error: () => {

      }
    });
  }

  handleInput () {
    this.$el.on('input', (event) => {
      let input = this.input.val();
      // debugger
      this.searchUsers(input);
    });
  }

  renderResults () {

  }


}


module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map