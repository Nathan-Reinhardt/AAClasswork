Array.prototype.myEach = function (callback){
  for (idx = 0; idx < this.length; idx++) {
    this[idx] = callback(this[idx]);
  }
}

function square(el) {
  return el * el;
}

Array.prototype.myMap = function (backcall){
  let result = [];
  
  this.myEach(el => {
    result.push(backcall(el));
  })

  return result;
}