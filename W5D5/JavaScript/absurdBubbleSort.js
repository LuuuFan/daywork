const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const absurdBubbleSort = (arr, sortCompletitionCallback) => {
  const outerBubbleSortLoop = (madeAnySwaps) => {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletitionCallback(arr);
    }
  };
  outerBubbleSortLoop(true);
};

const askIfGreaterThan = (el1, el2, callback) => {
  reader.question(`Is ${el1} is greater then ${el2}?`, (res) => {
    if (res === 'y') {
      console.log('the answer is yes');
      // return true;
      callback(true);
      // reader.close();
    } else if (res === 'n') {
      // return false;
      callback(false);
    } else {
      console.log('Please select y or n');
      askIfGreaterThan(el1, el2, callback);
    }
  });
};

// const outerBubbleSortLoop = () => {
//   console.log('dumydumy');
// };

const innerBubbleSortLoop = (arr, i, madeAnySwaps = false, outerBubbleSortLoop) => {
  if (i < (arr.length - 1)) {
    // console.log("hi");
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        console.log('Inside askIfGreaterThan');
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        console.log(arr);
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  } else if ( i === (arr.length - 1) ) {
    outerBubbleSortLoop(madeAnySwaps);
  }
};

// innerBubbleSortLoop([3,2,1], 0, false, outerBubbleSortLoop);

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

// innerBubbleSortLoop([3,5,9,2,1,0,7,3], 0, false, outerBubbleSortLoop);
// askIfGreaterThan(1, 5, () => console.log('========'));




//
