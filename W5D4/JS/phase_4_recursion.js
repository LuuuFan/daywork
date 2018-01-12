// range(0, 6)
// =>
// [0, 1, 2, 3, 4, 5, 6]

// range(0,6) => [0],[0,1],[0,1,2]...

function range(start, end) {
  if (start === end) {
    return [start];
  }
  return [start].concat(range(start + 1, end));
}

// console.log(range(0, 6));
// console.log(range(0, 0));
// console.log(range(6, 0));

function sumRec(arr) {
  if (arr.length < 1) {
    return 0;
  }
  return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([]));
// console.log(sumRec([1]));
// console.log(sumRec([1,2,3,4,5]));

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp < 0) {
    return 1 / (base * exponent(base, Math.abs(exp)-1));
  }

  return base * exponent(base, exp -1);
}

// console.log(exponent(3,-5));

function fib(n) {
  if (n === 1) {
    return 0;
  } else if (n === 2) {
    return 1;
  }

  return fib(n-1) + fib(n-2);
}

// console.log(fib(6));

function deepDup(arr) {
  const result = [];
  arr.forEach(function(el){
    if (Array.isArray(el)) {
      result.push(deepDup(el));
    } else {
      result.push(el);
    }
  });
  return result;
}

// var a = [1,2,[1,2,[3]]];
// var b = deepDup(a);
// a.push(4);
//
// console.log(b);
// console.log(a);

function bsearch(arr, target) {
  if (arr.length <= 1 && arr[0] === target) {
    return 0;
  } else if (arr.length <= 1 && arr[0] !== target) {
    return -1;
  } else {
    let mid = Math.floor(arr.length / 2);
    if (target === arr[mid]) {
      return mid;
    } else if (target < arr[mid]){
      return bsearch(arr.slice(0, mid - 1), target)
    } else {
      if (bsearch(arr.slice(mid + 1, arr.length), target) === -1) {
        return -1;
      } else {
        return bsearch(arr.slice(mid + 1, arr.length), target) + mid + 1;
      }
    }
  }
}

// let a = bsearch([1,2,3,4,5,6,7,8], 0);
// let b = [1,2,3,4,5,6,7,8].indexOf(0);
// console.log(a);
// console.log(b);

function merge(arr1, arr2) {
  const result = [];
  // const a = arr1;
  // const b = arr2;
  while (arr1.length !== 0 || arr2.length !== 0) {
    if (arr1.length === 0) {
      result.push(arr2.shift());
    } else if (arr2.length === 0) {
      result.push(arr1.shift());
    } else if (arr1[0] > arr2[0]) {
      result.push(arr2.shift());
    } else {
      result.push(arr1.shift());
    }
  }
  return result;
}

function mergesort(arr) {
  if (arr.length <= 1) {
    return arr;
  } else {
    const mid_idx = Math.floor(arr.length / 2);
    const left = arr.slice(0, mid_idx);
    const right = arr.slice(mid_idx, arr.length);
    return merge(mergesort(left), mergesort(right));
  }
}


// a = mergesort([5,7,2,9,1,0,2,3,6,4,8,2,9]);
// b = mergesort([]);
// c = mergesort([1]);
// console.log(a);
// console.log(b);
// console.log(c);

// d = merge([1,3,5], [2,4,6]);
// console.log(d);


function subsets(arr) {
  if (arr.length === 0) {
    return [arr];
  } else {
    const last_el = arr.pop();
    const previous_subset = subsets(arr);
    // console.log(previous_subset);
    return previous_subset.concat(previous_subset.map(x => x.concat([last_el])));
  }
}
//
// a = subsets([]) // => [[]]
// b = subsets([1]) // => [[], [1]]
// c = subsets([1, 2]) // => [[], [1], [2], [1, 2]]
// d = subsets([1, 2, 3])
// //  => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
//
// console.log(a);
// console.log(b);
// console.log(c);
// console.log(d);













//
