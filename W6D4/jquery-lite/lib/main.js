const DOMNodeCollection = require('./dom_node_collection.js');

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
