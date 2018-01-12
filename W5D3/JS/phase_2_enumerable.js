Array.prototype.myEach = function(callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

// function secretSanta(el) {
//   console.log(el);
// }
// [1,2,3,4,5].myEach(el => console.log(secretSanta));

// [1,2,3,4,5].myEach(el => console.log(el));

// [1,2,3,4,5].myEach(function(el) {console.log(el);} );

// [1,2,3,4,5].myEach(function secretSanta(el) {console.log(el);} );


Array.prototype.myMap = function (callback) {
  const result = [];
  for (var i = 0; i < this.length; i++) {
    result.push(callback(this[i]));
  }
  return result;
};


// console.log([1,2,3,4,5].myMap(el => el * 32));

// Array.prototype.myReduce = function (callback, initialValue) {
//   let result = 0;
//   var i;
//   if(initialValue === undefined) {
//     result = this[0];
//     for (i = 1; i < this.length; i++) {
//       result = callback(result, this[i]);
//     }
//   } else {
//     result = initialValue;
//
//     for (i = 0; i < this.length; i++) {
//       result = callback(result, this[i]);
//     }
//   }
//   return result;
// };

Array.prototype.myReduce = function (callback, initialValue) {
  let result = 0;
  var i;
  for (i = 0; i < this.length; i++) {
    if (i === 0) {
      if (initialValue === undefined) {
        result = this[0];
        continue;
      } else {
        result = initialValue;
      }
    }
    result = callback(result, this[i]);
  }
  return result;
};

//
// function ninja(acc, el) {
//   return acc + el;
// }
// console.log([1, 2, 3, 4].myReduce(ninja));


// console.log([1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }, 25));
















// comment
