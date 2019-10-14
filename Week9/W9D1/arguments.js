// function sum() {
//   let args = Array.from(arguments);
//   let sum = 0;
//   for (let i = 0; i < args.length; i++) {
//     sum += args[i];
//   }
//   return sum;
// };

function sum(...numbers) {
  let sum = 0;
  for (let i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  return sum;
};

const numbers = [1,2,3,4,5];
console.log(sum(1,2,3,4));
console.log(sum(1,2,3,4,5));





// using arguments keyword

// Function.prototype.myBind = function(){
//   let args = Array.from(arguments);
//   const context = args[0];
//   args1 = args.slice(1, args.length);
//   let that = this;

//   return function() {   //use this = that if not an arrow function
//     let args2 = Array.from(arguments);
//     let combined_args = args1.concat(args2);
//     that.apply(context, combined_args);
//   }
// }

// using ... operator

Function.prototype.myBind = function (...args) {
  const context = args[0];
  args1 = args.slice(1, args.length);
  let that = this;

  return function (...args2) {   //use this = that if not an arrow function
    let combined_args = args1.concat(args2);
    that.apply(context, combined_args);
  }
}

//--------------------------------------------------//
class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true



//------------------------------------------------------------------------------//

function curriedSum(numArgs) {
  const numbers = [];
  const _curriedSum = function (n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      return numbers.reduce((a, b) => a + b, 0);
    }
    else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

const csum = curriedSum(4);
console.log(csum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
  const args = []; // args = [4, 20, 6] (args.length === numArgs)
  let that = this;
  return function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      // what is `that`? 
      // that is sumThree 
      return that.apply(null, args);
      // ctx, [arguments]
    } else {
      return _curry;
    }
  };
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree.curry(3)(4)(20)(6)); // == 30