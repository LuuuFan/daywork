Array.prototype.uniq = function () {
  const result = [];
  for (var i = 0; i < this.length; i++) {
    if (!result.includes(this[i])) {
      result.push(this[i]);
    }
  }
  return result;
};


// console.log([1,1,1,1,1,1,2,3,0].uniq());


Array.prototype.twoSum = function () {
  const result = [];
  for (var i = 0; i < this.length - 1; i++) {
    for (var j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result;
};

// console.log([-5, 0, 1, 5, -1].twoSum());

Array.prototype.transpose = function () {
  const result = [];
  for (var i = 0; i < this[0].length; i++) {
    result.push([]);
    for (var j = 0; j < this.length; j++) {
      result[i].push(this[j][i]);
    }
  }
  return result;
};

// console.log([[1,3,5],[2,4,6]].transpose());
