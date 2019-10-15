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
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
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
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./entry.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./asteroid.js":
/*!*********************!*\
  !*** ./asteroid.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./moving_object.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./game.js\");\n\nfunction Asteroid(pos, game, color = \"#713B2F\", radius = 5) {\n  this.pos = pos;\n  this.game = game;\n}\n\nconst Util = {\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./asteroid.js?");

/***/ }),

/***/ "./bullet.js":
/*!*******************!*\
  !*** ./bullet.js ***!
  \*******************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./moving_object.js\");\n\n\nmodule.exports = Bullet;\n\n//# sourceURL=webpack:///./bullet.js?");

/***/ }),

/***/ "./entry.js":
/*!******************!*\
  !*** ./entry.js ***!
  \******************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const GameView = __webpack_require__(/*! ./game_view.js */ \"./game_view.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./moving_object.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./game.js\");\n\nconst mo = new MovingObject({ \n  pos: [10, 10],\n  ves: [10, 10],\n  radius: 5,\n  color: \"#00FF00\"\n});\n\nconst game = new Game(500, 500, 10);\n\nconst view = new GameView(game, ctx);\n\nconst asteroid = new Asteriod({\n  pos: [30, 30]\n}, game);\n\nwindow.MovingObject = MovingObject;\nwindow.Asteriod = Asteriod;\nwindow.Game = Game;\nwindow.GameView = GameView;\n\n//# sourceURL=webpack:///./entry.js?");

/***/ }),

/***/ "./game.js":
/*!*****************!*\
  !*** ./game.js ***!
  \*****************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./asteroid.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./bullet.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./ship.js\");\n\nfunction Game(DIM_X, DIM_Y, NUM_ASTEROIDS) {\n  const gridX = DIM_X;\n  const gridY = DIM_Y;\n  const num_asteriods = NUM_ASTEROIDS;\n}\n\nconst asteroid_arr = [];\n\nGame.prototype.addAsteroids = function() {\n  for (let i; i < num_asteriods; i++) {\n    let curr_asteroid = new Asteroid([0,0], this);\n    this.randomPosition(curr_asteroid);\n    asteroid_arr.push(curr_asteroid);\n  }\n};\n\nGame.prototype.randomPosition = function(asteroid) {\n  asteroid.pos[0] = Math.floor((Math.random() * gridX) + 1);\n  asteroid.pos[1] = Math.floor((Math.random() * gridY) + 1);\n};\n\nGame.prototype.draw = function(ctx) {\n\n};\n\nGame.prototype.moveObjects = function() {\n\n};\n\nGame.prototype.wrap = function(pos) {\n  const grid_arr = [gridX, gridY];\n\n  for (let i = 0; i < pos.length; i++) {\n    curr_pos = pos[i];\n    if (grid_arr[i] < curr_pos) {\n      curr_pos = curr_pos - grid_arr[i];\n    }\n    else if (curr_pos < 0) {\n      curr_pos = curr_pos + grid_arr[i];\n    }\n    pos[i] = curr_pos;\n  }\n  \n  return pos;\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./game.js?");

/***/ }),

/***/ "./game_view.js":
/*!**********************!*\
  !*** ./game_view.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./game.js\");\n\nfunction GameView(game, ctx) {\n  this.game = game;\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n  setInterval(this.game.moveObjects(), 20);\n  this.game.draw(this.ctx);\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./game_view.js?");

/***/ }),

/***/ "./moving_object.js":
/*!**************************!*\
  !*** ./moving_object.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./game.js\");\n\nfunction MovingObeject(object) {\n  this.pos = object.pos;\n  this.vel = object.vel;\n  this.radius = object.radius;\n  this.color = object.color;\n}\n\nconst mo = new MovingObeject({\n  pos: [30, 30],\n  vel: [10, 10],\n  radius: 5,\n  color: \"#00FF00\"\n});\n\nMovingObeject.prototype.draw = function(ctx) {\n  \n};\n\nMovingObeject.prototype.move = function() {\n  this.pos[0] = this.pos[0] + this.vel[0];\n  this.pos[1] = this.pos[1] + this.vel[1];\n};\n\nmodule.exports = MovingObeject;\n\n//# sourceURL=webpack:///./moving_object.js?");

/***/ }),

/***/ "./ship.js":
/*!*****************!*\
  !*** ./ship.js ***!
  \*****************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./moving_object.js\");\n\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./ship.js?");

/***/ })

/******/ });