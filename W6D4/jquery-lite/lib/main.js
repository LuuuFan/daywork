const DOMNodeCollection = require('./dom_node_collection.js');

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
