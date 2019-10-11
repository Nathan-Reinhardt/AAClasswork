const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCb) {
  if (numsLeft > 0) {
    reader.question('Give me a number: ', function(numStr) {
      const num = parseInt(numStr);
      sum += num;
      console.log(sum);
      addNumbers(sum, numsLeft-1, completionCb);
    });
  } 

  if (numsLeft === 0) {
    completionCb(sum);
    reader.close();
  }

}
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
