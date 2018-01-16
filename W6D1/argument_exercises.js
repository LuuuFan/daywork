// function sum(...args) {
//   // console.log(arguments);
//   // let args = Array.from(arguments);
//   return args.reduce((acc, el) => acc + el);
// }
//
// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

// Function.prototype.myBind = function(ctx,...bindArgs) {
//   return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
// };
//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");

//****CURRIEDSUM

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!

Function.prototype.curry = function(num) {
  const args = [];
  // const parFunc = this;
  const _curry = function(arg) {
    args.push(arg);
    if (args.length === num) {
      return this(...args);
    } else {
      return _curry.bind(this);
    }
  };
  return _curry.bind(this);
};


let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30
// console.log(sumThree.curry(3)(4)(20)(6));

function curriedSum(numArgs) {
  const numbers = [];
  const _curriedSum = (arg) => {
    numbers.push(arg);
    if (numbers.length === numArgs) {
      return numbers.reduce((acc, el) => acc + el);
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56;
