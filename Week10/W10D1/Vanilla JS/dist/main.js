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
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\nclass Clock {\n  constructor() {\n    const today = new Date();\n\n    this.hours = today.getHours();\n    this.minutes = today.getMinutes();\n    this.seconds = today.getSeconds();\n\n    this.printTime();\n    setInterval(this._tick.bind(this), 1000);\n  }\n\n  printTime() {\n    let sec = `${this.seconds}`;\n    if (this.seconds < 10) {\n      let sec = `0${this.seconds}`;\n    }\n    let min = `${ this.minutes }`;\n    if (this.minutes < 10) {\n      let min = `0${this.minutes}`;\n    }\n    return `${this.hours}:${min}:${sec}`;\n  }\n\n  _tick() {\n\n    const upper_limit = 59;\n    const hour_limit = 23;\n\n    if (this.seconds === upper_limit) {\n      this.seconds = 0;\n      this.minutes++;\n    }\n    else {\n      this.seconds++;\n    }\n    if (this.minutes > upper_limit) {\n      this.minutes = 0;\n      this.hours++;\n    }\n    if (this.hours > hour_limit) {\n      this.hours = 0;\n    }\n\n    Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(clock.printTime(), clockElement);\n  }\n}\n\nconst clock = new Clock();\n/* harmony default export */ __webpack_exports__[\"default\"] = (clock);\nconst clockElement = document.getElementById('clock');\n// htmlGenerator(clock.printTime(), clockElement);\nclock._tick();\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"default\", function() { return attachDogLinks; });\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator() {\n  const keys = Object.keys(dogs);\n  const dogs_arr = [];\n\n  for (let i = 0; i < keys.length; i++) {\n    let currentLi = document.createElement(\"li\");\n    currentLi.classList.add(\"dog-link\");\n    let currentA = document.createElement(\"a\");\n    currentA.innerHTML = `${keys[i]}`;\n    currentA.href = `${dogs[keys[i]]}`;\n    currentLi.appendChild(currentA);\n    dogs_arr.push(currentLi);\n  }\n  return dogs_arr;\n}\n\nfunction attachDogLinks() {\n  const dogLinks = dogLinkCreator();\n  const ul = document.getElementsByClassName(\"drop-down-dog-list\")[0];\n  for (let i = 0; i < dogLinks.length; i++) {\n    ul.appendChild(dogLinks[i]);\n  }\n}\nattachDogLinks();\n\nfunction handleEnter() {\n  document.getElementById(\"drop-id\")\n  .addEventListener(\"mouseenter\", function() {\n    Array.from(document.getElementsByClassName(\"dog-link\")).forEach(el => {\n      el.style.visibility = \"visible\";\n    });\n  });\n}\n\nhandleEnter();\n\nfunction handleLeave() {\n  document.getElementsByClassName(\"drop-down-dog-nav\")[0]\n  .addEventListener(\"mouseleave\", function () {\n    Array.from(document.getElementsByClassName(\"dog-link\")).forEach(el => {\n      el.style.visibility = \"hidden\";\n    });\n  });\n}\nhandleLeave();\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst todos = [];\nconst ul = document.getElementsByClassName(\"todos\");\nconst form = document.getElementsByClassName(\"add-todo-form\");\n\ndocument.getElementById(\"buttn\")\n.addEventListener(\"onclick\", function (e) {\n  e.preventDefault();\n  addTodo(todos);\n  debugger\n});\n\nfunction addTodo(todos) {\n  const entry = document.getElementsByName(\"add-todo\").value[0];\n\n  const toObj = {\n    text: entry,\n    done: false\n  };\n\n  todos.push(toObj);\n  document.getElementsByName(\"add-todo\").value[0] = \"\";\n\n  populateList(todos);\n}\n\nfunction populateList(todos) {\n  todos.forEach(el => {\n    let label = document.createElement(\"label\");\n    label.innerHTML = el.text;\n    let list = document.createElement(\"li\");\n    list.appendChild(label);\n    let ul = document.getElementsByClassName(\"todos\")[0];\n    ul.appendChild(list);\n  });\n}\n\npopulateList(todos);\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  let newP = document.createElement(\"p\");\n  newP.innerHTML = string;\n  if (htmlElement.children.length === 0) {\n    htmlElement.appendChild(newP);\n  } else {\n    htmlElement.removeChild(htmlElement.children[0]);\n    htmlElement.appendChild(newP);\n  }\n\n};\n\nhtmlGenerator('Welcome To the Pocket Project Marathon!', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });