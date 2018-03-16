
const myRange = function(start, end) {
  if (start === end) {
    return [start];
  }

  let result = [start].concat(myRange(start + 1, end));

  return result;
};

const sumRec = function(arr) {
  if (arr.length === 1) {
    return arr[0];
  }

  let result = arr[0] + sumRec(arr.slice(1));

  return result;
};

const exponent1 = function(base, exp) {
  if (exp === 0) {
    return 1;
  }

  let result = base * exponent1(base, exp - 1);

  return result;
};

const exponent2 = function(base, exp) {
  if (exp === 0) {
    return 1;
  }

  if (exp === 1) {
    return base;
  }

  let result = "";

  if (exp % 2 === 0) {
    result = (exponent2(base, exp / 2) * exponent2(base, exp / 2));
  } else {
    result = base * (exponent2(base, (exp - 1) / 2) * exponent2(base, (exp - 1) / 2));
  }

  return result;
};
