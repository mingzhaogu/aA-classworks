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

const functions = [];
document.addEventListener('DOMContentLoaded', () => {
  functions.forEach( (funk) => funk());
});

window.$l = function(thing) {
  if (thing instanceof Function) {
    if (document.readyState === 'complete') {
      thing();
    } else {
      functions.push(thing);
    }
  } else {
    let nodeList;
    if (thing instanceof HTMLElement) {
      nodeList = [thing];
    } else {
      nodeList = Array.from(document.querySelectorAll(thing));
    }
    return new DOMNodeCollection(nodeList);
  }
};

window.$l.extend = function(...args) {
  return Object.assign(...args);
};

window.$l.extended = function(base, ...args) {
  args.forEach( (arg) => {
    Object.keys(arg).forEach((key) => {
      base[key] = arg[key];
    });
  });

  return base;
};


window.$l.ajax = function (options = {}) {
  const defaultAjaxOptions = {
    success: () => {},
    error: (err) => console.log(err),
    url: "",
    method: 'GET',
    data: {},
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8'
  };

  options = window.$l.extend(defaultAjaxOptions, options);

  const xhr = new XMLHttpRequest;
  xhr.open(options.method, options.url);
  xhr.onload = () => {
    if (Math.floor(xhr.status / 100) === 2) {
      options.success(xhr.response);
    } else {
      options.error(xhr.response);
    }
  };
  // xhr.addEventListener('load', function() {
  //   options.success(this.response);
  // }.bind(xhr));
  // xhr.addEventListener('error', function() {
  //   options.error(this.response);
  // }.bind(xhr));
  xhr.setRequestHeader('Content-Type', options.contentType);
  xhr.send(options.data);
};

// window.$l(() => alert('DOM CONTENT HAS BEEEN LOADEEEEED'));
// window.$l(() => alert('I HAS ARRIVED'));
// console.log(functions);
// setTimeout(() => {
//   window.$l(() => alert('fashionably late'));
//   console.log(functions);
// }, 2000);


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(elements) {
    this.elements = elements;
  }

  html(contents) {
    if (contents === undefined) {
      return this.elements[0].innerHTML;
    } else {
      this.elements.forEach((el) => {
        el.innerHTML = contents;
      });
    }

    return this;
  }

  empty() {
    this.html("");
  }

  append(child) {
    let contents;
    if (typeof child === "string") {
      contents = child;
    } else if (child instanceof HTMLElement) {
      contents = child.outerHTML;
    } else if (child instanceof DOMNodeCollection) {
      contents = child.html();
    }

    return this.html(contents);
  }

  attr(name, value) {
    if (value === undefined) {
      return this.elements[0].getAttribute(name);
    } else {
      this.elements.forEach((el) => el.setAttribute(name, value));
      return this;
    }
  }

  addClass(name) {
    const names = name.split(' ');
    this.elements.forEach((el) => {
      el.classList.add(...names);
    });
    return this;
  }

  removeClass(name) {
    const names = name.split(' ');
    this.elements.forEach((el) => {
      el.classList.remove(...names);
    });
    return this;
  }

  children() {
    const collection = [];
    this.elements.forEach((el) => {
      const childs = Array.from(el.children);
      collection = collection.concat(childs);
    });

    return new DOMNodeCollection(collection);
  }

  parent() {
    const collection = [];
    this.elements.forEach((el) => {
      if (el.parentNode) {
        collection.push(el.parentNode);
      }
    });

    return new DOMNodeCollection(collection);
  }

  find(selector) {
    const collection = new Set([]);
    this.elements.forEach((el) => {
      const selected = el.querySelectorAll(selector);
      selected.forEach((selection) => {
        collection.add(selection);
      });
    });
    return new DOMNodeCollection(Array.from(collection));
  }

  remove() {
    this.elements.forEach((el) => {
      el.remove();
    });
    return this;
  }

  on(trigger, action) {
    this.elements.forEach((el) => {
      el.addEventListener(trigger, action);
      el.events = el.events || {};
      el.events[trigger] = el.events[trigger] || [];
      el.events[trigger].push(action);
    });

    return this;
  }

  off(trigger, action) {
    this.elements.forEach((el) => {
      const actions = action ? [action] : el.events[trigger];
      actions.forEach((act) => {
        el.removeEventListener(trigger, act);
      });

      el.events[trigger] = el.events[trigger].filter((act) => {
        return !actions.includes(act);
      });
    });

    return this;
  }
}

module.exports = DOMNodeCollection;


















//


/***/ })
/******/ ]);