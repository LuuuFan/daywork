const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0){
    reader.question('Pick a number:', (res) => {
      let input = parseInt(res);
      sum += input;
      console.log(sum);
      addNumbers(sum, numsLeft - input, completionCallback);
    });
  }else if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();

  }else{
    completionCallback("Overflow");
    reader.close();

  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
