Array.prototype.uniq = function (){
  let result = [];
  let array = this;
  // this.forEach(inclusion);
  // function inclusion(el) {
  //   if (!result.includes(el)) {
  //     result.push(el);
  //   }
  // }

  this.forEach(el => {
    if (!result.includes(el)) {
      result.push(el);
    }
  })

  return result;
}

Array.prototype.twoSum = function (){
  let result = [];
  let array = this;

  for (let i = 0; i < array.length; i++) {
    for (let j = i + 1; j < array.length; j++) {
      if (array[i] + array[j] === 0) {
        result.push([i, j]);
      }
    }
  }

  return result;
}

Array.prototype.transpose = function (){
  let result = [];

  for (let i = 0; i < this.length; i++) {
    result.push([]);
  }

  for (let i = 0; i < this.length; i += 1) {
    for (let j = 0; j < this.length; j++) {
      result[j].push(this[i][j]);
    }
  }

  // if you wanted to itterate backwards

  // for (let i = this.length - 1; i < 0; i--) {
  //   ...
  // }

  return result;
}
