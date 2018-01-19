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
