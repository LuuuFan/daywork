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


function bsearch(arr, target, idx = Math.floor(arr.length / 2)) {

  let mid = Math.floor(arr.length / 2);


  switch (target) {
    case target < arr[mid]:
      bsearch(arr.slice(0, mid-1), target);
    break;
    case target === arr[mid]:
      return mid;
    case target > arr[mid]:
      bsearch(arr.slice(mid+1, arr.length-1), target, idx);
    break;
    default:
      return -1;
  }

}

console.log(bsearch([1,2,3,4,5,6,7,8],2));


















//
