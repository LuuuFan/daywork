Array.prototype.bubbleSort = function () {
  const result = this;
  let check = true;
  let k;
  let j = 0;

  while(check) {
    check = false;
    for (var i = 0; i < result.length-j; i++) {
      if (result[i] > result[i+1]) {
        k = result[i];
        result[i] = result[i+1];
        result[i+1] = k;
        check = true;
      }
    }
    j++;
  }
  return result;
};

// console.log([5,23,7,3,52,22,3,2,868,43,5,1].bubbleSort());


// let k;
  //
  // for (var i = 0; i < this.length; i++) {
  //   for (var j = 0; j < this.length - i; j++) {
  //     if (result[j] > result[j+1]) {
  //       k = result[j];
  //       result[j] = result[j+1];
  //       result[j+1] = k;
  //     }
  //   }
  // }

  String.prototype.substrings = function () {
    const result = [];
    let j = 0;
    for (var i = 0; i < this.length; i++) {
      if (this[i] === ' ') {
        result.push(this.slice(j, i));
        j = i + 1;
      }
    }
    return result;
  };

  console.log('The quick brown fox jumps over the lazy dog'.substrings());






















//
