


===========================================



console.log(null == undefined); // Output: true
console.log(null === undefined); // Output: false


- `null == undefined`:
In this case, both `null` and `undefined` are considered loosely equal because they represent absence of value. 
 Therefore, `null == undefined` evaluates to `true`.
  
- `null === undefined`: The `===` operator checks for strict equality without type conversion.
 It compares both the value and the type of the operands.
 
  `null === undefined` evaluates to `false`.



 Since `null` and `undefined` are of different types (`null` is of type `"object"` and `undefined` is of type `"undefined"`),

  //=======================================


1. console.log(typeof undefined);`
   - This will output `undefined`. In JavaScript, `typeof undefined` returns `"undefined"` because `undefined` is a type representing an uninitialized or non-existent value.

2. `console.log(typeof null);`
   - This will output `"object"`. This is a historical quirk in JavaScript. `typeof null` returns `"object"` because `null` is considered a primitive value that represents the intentional absence of any object value.

3. `console.log(typeof NaN);
   - This will output `"number"`. `NaN` stands for "Not-a-Number" and is considered a special value in JavaScript of the number type. Therefore, `typeof NaN` returns `"number"`.

   console.log(typeof undefined); // Output: "undefined"
   console.log(typeof null);      // Output: "object"
   console.log(typeof NaN);       // Output: "number"
   
//=======================================
console.log(typeof NaN); // Outputs: "number"

typeof NaN returns "number" in JavaScript because NaN 
(Not a Number) is categorized as a numeric value within the languages type system


//=======================================


console.log(NaN === NaN); // Outputs: false
console.log(NaN == NaN); // Outputs: false


Both NaN === NaN and NaN == NaN evaluate to false in JavaScript
 because NaN is considered not equal to any value, including NaN itself.


 //=======================================


console.log(1 < 2 < 3); outputs true because 1 < 2 evaluates to true, and then true < 3 (which is 1 < 3) also evaluates to true.
console.log(3 > 2 > 1); outputs false because 3 > 2 evaluates to true, but then true > 1 (which is 1 > 1) evaluates to false

Chained Comparisons: When you chain comparison operators like 1 < 2 < 3, JavaScript evaluates them sequentially from left to right.
Type Coercion: JavaScript implicitly converts true and false to 1 and 0 respectively when compared with numeric values.


//=======================================


1. **String Concatenation with `+`:**
   
   console.log("5" + 3); // "53"
   
   - The `+` operator treats the operation as string concatenation because one operand is a string.

2. **Arithmetic Operations with `-`, `*`, `/`:**
   
   console.log("5" - 3); // 2
   console.log("5" * 3); // 15
   console.log("5" / 3); // 1.6666666666666667
   
   - The `-`, `*`, and `/` operators treat the operation as arithmetic, so they convert the string `"5"` to the number `5`.

### Summary:
- The `+` operator can perform both string concatenation and numeric addition. If one operand is a string, JavaScript concatenates.
- The `-`, `*`, and `/` operators only perform arithmetic operations and convert their operands to numbers if necessary.

//====================== Problem ================================

// Problem Statement 1
console.log(null == undefined); // Output: true
console.log(null === undefined); // Output: false

// Problem Statement 2
console.log(typeof undefined); // Output: "undefined"
console.log(typeof null); // Output: "object"
console.log(typeof NaN); // Output: "number"

// Problem Statement 3
console.log(NaN === NaN); // Output: false
console.log(NaN == NaN); // Output: false

// Problem Statement 4
console.log(1 < 2 < 3); // Output: true
console.log(3 > 2 > 1); // Output: false

// Problem Statement 5
console.log("5" + 3); // Output: "53"
console.log("5" - 3); // Output: 2
console.log("5" * 3); // Output: 15
console.log("5" / 3); // Output: 1.6666666666666667



//====================== Problem ================================


// Problem: Flatten a nested array


// Problem 1: Flatten a Nested Array

const arr1 = [1, 2, 3, 4, [5, 6, 7]];

function flattenArray(arr) {
    let result = [];
    function recursivArr(input) {
        for (let i = 0; i < input.length; i++) {
            if (Array.isArray(input[i])) {
                recursivArr(input[i]);
            } else {
                result.push(input[i]);
            }
        }
    }
    recursivArr(arr);
    return result;
}

const fltArr1 = flattenArray(arr1);
console.log('Flatten a Nested Array:', fltArr1); // Output: [1, 2, 3, 4, 5, 6, 7]

// Problem 2: Flatten a Deeply Nested Array

const input2 = [1, 2, [3, 4, [5, [6]]]];

function flatArr(arr) {
    let result = [];
    arr.forEach(element => {
        if (Array.isArray(element)) {
            result = result.concat(flatArr(element));
        } else {
            result.push(element);
        }
    });
    return result;
}

const op2 = flatArr(input2);
console.log('Flatten a Deeply Nested Array:', op2); // Output: [1, 2, 3, 4, 5, 6]

// Problem 3: Flatten Deeply Nested Arrays Using Reduce

let nestedArray3 = [1, [2, 3], [4, [5, 6]], 7, [8, [9, 10, [11, [13]]]]];

const flatArr3 = (inp) => {
    return inp.reduce((acc, item) => {
        if (Array.isArray(item)) {
            const subArr = flatArr3(item);
            acc = acc.concat(subArr);
        } else {
            acc.push(item);
        }
        return acc;
    }, []);
}

console.log('Flatten Deeply Nested Arrays Using Reduce:', flatArr3(nestedArray3)); // Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13]






//====================== Problem ================================


// Problem: Iterate and print object properties


const obj = {
  id: 10,
  name: "Emma Taylor",
  age: 27,
  city: "Atlanta",
  isStudent: true,
  courses: ["Music", "Dance"],
  address: {
    street: "987 Elm Lane",
    zipCode: "30301",
    add: {
      port: "987 Elm Lane 8888888",
      pin: "30301",
    },
  }
};

for (let key in obj) {
  if (key === "address") {
    for (let keyOfAddress in obj[key]) {
      if (keyOfAddress === "add") {
        for (let keyOfAdd in obj[key][keyOfAddress]) {
          console.log(keyOfAdd + ": " + obj[key][keyOfAddress][keyOfAdd]);
        }
      } else {
        console.log(keyOfAddress + ": " + obj[key][keyOfAddress]);
      }
    }
  } else {
    console.log(key + ": " + obj[key]);
  }
}

// Output:
// id: 10
// name: Emma Taylor
// age: 27
// city: Atlanta
// isStudent: true
// courses: Music,Dance
// street: 987 Elm Lane
// zipCode: 30301
// port: 987 Elm Lane 8888888
// pin: 30301




//====================== Problem ================================


// Problem: Asynchronous execution order


async function async1() {
  console.log("async1 start");
  await async2();
  console.log("async1 end");
}
 
async function async2() {
  console.log("async2");
}
console.log("script start");

setTimeout(function () {
  console.log("setTimeout");
}, 0);
 
async1();
 
new Promise(function (resolve) {
  console.log("promise1");
  resolve();
}).then(function () {
  console.log("promise2");
});
 
console.log("script end");

// Output:
// script start
// async1 start
// async2
// promise1
// script end
// promise2
// async1 end
// setTimeout




//====================== Problem ================================


// Problem: Remove duplicates from an array


const array = [1,1,2,3,3,5,7,9];

const remove = array.filter((value, index, arr) => {
    return arr.indexOf(value) === index;
});
console.log(remove);

// Output: [1, 2, 3, 5, 7, 9]



// Solution 1: Using Set
const array1 = [1, 1, 2, 3, 3, 5, 7, 9];
const removeDuplicates1 = [...new Set(array1)];
console.log(removeDuplicates1); // Output: [1, 2, 3, 5, 7, 9]

// Solution 2: Using filter and indexOf
const array2 = [1, 1, 2, 3, 3, 5, 7, 9];
const removeDuplicates2 = array2.filter((value, index, arr) => arr.indexOf(value) === index);
console.log(removeDuplicates2); // Output: [1, 2, 3, 5, 7, 9]

// Solution 3: Using reduce and includes
const array3 = [1, 1, 2, 3, 3, 5, 7, 9];
const removeDuplicates3 = array3.reduce((acc, value) => {
    if (!acc.includes(value)) {
        acc.push(value);
    }
    return acc;
}, []);
console.log(removeDuplicates3); // Output: [1, 2, 3, 5, 7, 9]

// Solution 4: Using a for loop and a temporary array
const array4 = [1, 1, 2, 3, 3, 5, 7, 9];
const removeDuplicates4 = [];
for (const value of array4) {
    if (!removeDuplicates4.includes(value)) {
        removeDuplicates4.push(value);
    }
}
console.log(removeDuplicates4); // Output: [1, 2, 3, 5, 7, 9]




//====================== Problem ================================


// Problem: Rank transformation based on unique values


let marks = [37,12,28,9,100,100,56,80,5,12];

const rankTransform = (arr) => {
    let sortUnique = Array.from(new Set(arr)).sort((a, b) => b - a);
    let rankMap = {};
    sortUnique.map((value, i) => {
        return rankMap[value] = i + 1;
    });
    let output = arr.map(value => rankMap[value]);
    return output;
}
console.log(rankTransform(marks));

// Output: [4, 6, 5, 7, 1, 1, 3, 2, 8, 6]




//====================== Problem ================================


// Problem: Destructuring nested object


const obj = { obj1: { obj2: { name: 'Rocket' } } };
const { obj1: { obj2: { name } } } = obj;
console.log(name);

// Output: Rocket




//====================== Problem ================================


// Problem: Variable hoisting with function


var player = 'Virat';
function displayName() {
    if (player === 'Virat') {
        var player = 'VK';
        console.log(player); // VK
    }
    console.log(player); // Virat
}
console.log(displayName());

// Output:
// VK
// Virat




//====================== Problem ================================


// Problem: Asynchronous execution order


Promise.resolve(10).then(val => console.log('script3'));

console.log('script1');

setTimeout(() => {
    console.log('script2');
});

// Output:
// script1
// script3
// script2





//====================== Problem ================================


// Problem: Variable scope and type checking


function check() {
    let x = y = 0;
    x++;
    return x;
  }
  
  check();
  console.log(typeof x); // => undefined
  console.log(typeof y); // => number
  
  
  
  
  //====================== Problem ================================


  // Problem: `for` loop and `setTimeout` behavior
  var i; and let i
 
 
  for (i = 0; i < 3; i++) {
    const log = () => {
      console.log(i);
    }
    setTimeout(log, 100);
  }
  
  
  
  
  //====================== Problem ================================


  // Problem: Infinite loop due to `while` loop and `setTimeout`
  let x = true;
 
 
  setTimeout(() => {
    x = false;
  }, 2000);
  
  while (x) {
    console.log("hello");
  }
  
  
  
  
  //====================== Problem ================================


  // Problem: Sort fruits by the number of varieties
  const fruits = {
 
 
    apple: {
      'variety1': 120,
      'variety2': 340,
    },
    oranges: {
      'variety1': 450,
      'variety2': 600,
      'variety3': 20
    },
    banana: {
      'variety1': 19,
      'variety2': 80
    }
  };
  
  const sortFruitsByVariety = (fruitData) => {
    const fruitsVarietyCount = [];
    for (const fruit in fruitData) {
      const varietyCountValue = Object.keys(fruitData[fruit]).length;
      fruitsVarietyCount.push({
        fruit: fruit,
        varietyCountValue: varietyCountValue
      });
    }
    fruitsVarietyCount.sort((a, b) => {
      return b.varietyCountValue - a.varietyCountValue;
    });
    return fruitsVarietyCount.map(item => item.fruit);
  }
  
  console.log(sortFruitsByVariety(fruits));
  
  // Output: [ 'oranges', 'apple', 'banana' ]
  
  
  
  
  //====================== Problem ================================


  // Problem: Find uncommon elements between two arrays
  const array1 = [1, 2, 3, 4, 5, 6];
 
 
  const array2 = [4, 5, 6, 7, 8, 9];
  
  const unCommon = () => {
    const unCommon1 = array1.filter(val => !array2.includes(val));
    const unCommon2 = array2.filter(val => !array1.includes(val));
    return [...unCommon1, ...unCommon2];
  }
  
  console.log(unCommon());
  
  // Output: [1, 2, 3, 7, 8, 9]

  
  
  
  


//====================== Problem ================================


// Problem: React `useState` behavior and loop


const [count, setCount] = useState(1);
for (let i = 0; i < 10; i++) {
  setCount(count++);
}
console.log(count); // Output: 1 (Note: `setCount` is asynchronous and doesn't affect `count` immediately)




//====================== Problem ================================


// Problem: Asynchronous execution order


console.log(1); // Output: 1
setTimeout(() => {
  console.log(2); // Output: 2
}, -10);
new Promise((resolve, reject) => {
  resolve('4');
}).then((data) => console.log(data)); // Output: 4
console.log(3); // Output: 3

//Output
1
3
4
2



//====================== Problem ================================


// Problem: Remove duplicates, sort, and slice


const input2 = [3, 2, 4, 1, 2, 1, 4, 6];
const output = [...new Set(input2)] // Remove duplicates
                   .sort((a, b) => a - b) // Sort
                   .slice(0, 2); // Pick the first two items

console.log(output); // Output: [1, 2]




//====================== Problem ================================


// Problem: Variable hoisting and function behavior


console.log(a); // Output: undefined

function xyz() {
    a = 10;
    console.log(a); // Output: 10
    var a;
}

xyz();
var a = 20;






//====================== Problem ================================


// Problem: Asynchronous execution order with setTimeout and API call


function abc() {
    setTimeout(() => {
        console.log('k');
    }, 0); // 0 ms
    console.log('a');
    axios.get('/url').then(() => { 
        console.log('b');
    }); // Assume api taking 100 ms to respond
    setTimeout(() => {
        console.log('c');
    }, 0); // 0 ms
    console.log('d');
}
abc();

// Output:
// a
// d
// b
// k
// c




//====================== Problem ================================


// Problem: React `useState` behavior and loop


const [count, setCount] = useState(1);
for (let i = 0; i < 10; i++) {
    setCount(count++);
}
console.log(count); // Output: 1 (Note: `setCount` is asynchronous and doesn't affect `count` immediately)




//====================== Problem ================================


// Problem: Variable hoisting and function behavior


console.log(a); // Output: undefined

function xyz() {
    a = 10;
    console.log(a); // Output: 10
    var a;
}

xyz();
var a = 20;

// Output:
// undefined
// 10




//====================== Problem ================================


// Problem: Variable declaration and scoping


console.log(a); // Output: ReferenceError: Cannot access 'a' before initialization
var a = 10;
console.log(a); // Output: 10
let a = 10;




//====================== Problem ================================


// Problem: Asynchronous execution order


console.log(1); // Output: 1
setTimeout(() => {
    console.log(2); // Output: 2
}, -10);
new Promise((resolve, reject) => {
  resolve('4');
}).then((data) => console.log(data)); // Output: 4
console.log(3); // Output: 3

// Output:
// 1
// 3
// 4
// 2




//====================== Problem ================================


// Problem: Array processing - Remove duplicates, sort, and slice


const input = [3, 2, 4, 1, 2, 1, 4, 6];
const output = [...new Set(input)] // Remove duplicates
                   .sort((a, b) => a - b) // Sort
                   .slice(0, 2); // Pick the first two items

console.log(output); // Output: [1, 2]




//====================== Problem ================================


// Problem: Prototype method and instance method


var Person = function(firstName) {
    this.firstName = firstName;
}

var person = new Person('Madhu');

Person.sayHello = function() {
    alert('Hello ' + this.firstName);
}

person.sayHello(); // Output: undefined, because `sayHello` is defined on the constructor, not the instance




//====================== Problem ================================


// Problem: Counting occurrences in an array


const inputArray = ['A', 'B', 'C', 'D', 'A', 'C', 'A', 'B', 'D', 'A', 'B'];
const countOccurrences = arr => arr.reduce((acc, curr) => {
    acc[curr] = (acc[curr] || 0) + 1;
    return acc;
}, {});

console.log(countOccurrences(inputArray)); // Output: { A: 4, B: 3, C: 2, D: 2 }






//====================== Problem ================================


// Problem: Calculate median of two sorted arrays and sort the combined array


function medianAndSort(num1, num2) {
    let mergedArray = num1.concat(num2).sort((a, b) => a - b);
    let len = mergedArray.length;
    if (len % 2 === 1) {
        return mergedArray[Math.floor(len / 2)];
    } else {
        return (mergedArray[len / 2 - 1] + mergedArray[len / 2]) / 2;
    }
}

let num1 = [1, 3];
let num2 = [2];
let num3 = [1, 2];
let num4 = [3, 4];
let num5 = [1, 3, 8];
let num6 = [7, 9, 10, 11];
let num7 = [];
let num8 = [1];

console.log("eg-4", medianAndSort(num7, num8)); // Output: 1
console.log("eg-1", medianAndSort(num1, num2)); // Output: 2
console.log("eg-2", medianAndSort(num3, num4)); // Output: 2.5
console.log("eg-3", medianAndSort(num5, num6)); // Output: 8






//====================== Problem ================================


// Problem: Find the service with the highest average payment


function highestAverageService(jsonString) {
    const payments = JSON.parse(jsonString);
    const averages = {};
  
    payments.forEach(([service, amount]) => {
      averages[service] = (averages[service] || { total: 0, count: 0 });
      averages[service].total += amount;
      averages[service].count++;
    });
  
    return Object.keys(averages).reduce((a, b) => 
      averages[a].total / averages[a].count > averages[b].total / averages[b].count ? a : b
    );
  }
  
  const jsonString = '[["Swiggy", 123], ["Swiggy", 227], ["Zomato", 103], ["Zomato", 171], ["Dunzo", 131], ["Zomato", 122], ["Swiggy", 181]]';
  console.log(highestAverageService(jsonString)); // Output: Swiggy
  
  
  
  
  //====================== Problem ================================


  // Problem: Get the second most frequently occurring element, including the frequency count
  function mostRepeatedAndFreq(arr) {
 
 
    const counts = arr.reduce((acc, num) => {
      acc[num] = (acc[num] || 0) + 1;
      return acc;
    }, {});
  
    const sortedEntries = Object.entries(counts)
      .sort((a, b) => b[1] - a[1]);
  
    const secondMost = sortedEntries[1] || [null, 0];
    return [parseInt(secondMost[0]), secondMost[1]];
  }
  
  const sortedArray = [1, 2, 4, 4, 6, 6, 4, 5, 6, 6, 7, 7, 9, 7, 10];
  console.log(mostRepeatedAndFreq(sortedArray)); // Output: [4, 3]
  
  
  
  
  //====================== Problem ================================


  // Problem: Count consecutive letters
  function consecutiveLetterCount(input) {
 
 
    if (input.length === 0) return '';
  
      let result = '';
      let count = 1;
  
      for (let i = 1; i <= input.length; i++) {
          if (input[i] === input[i - 1]) {
              count++;
          } else {
              result += input[i - 1] + count;
              count = 1;
          }
      }
  
      return result;
  }
  
  const input = "aaavvccfr";
  const output = consecutiveLetterCount(input);
  console.log(output); // Output: "a3v2c2f1r1"
  
  
  
  
  //====================== Problem ================================


  // Problem: Calculate median of two sorted arrays and sort the combined array
  function medianAndSort(num1, num2) {
 
 
    let mergedArray = num1.concat(num2).sort((a, b) => a - b);
      let len = mergedArray.length;
      if (len % 2 === 1) {
          return mergedArray[Math.floor(len / 2)];
      } else {
          return (mergedArray[len / 2 - 1] + mergedArray[len / 2]) / 2;
      }
  }
  
  let num1 = [1, 3];
  let num2 = [2];
  let num3 = [1, 2];
  let num4 = [3, 4];
  let num5 = [1, 3, 8];
  let num6 = [7, 9, 10, 11];
  let num7 = [];
  let num8 = [1];
  
  console.log("eg-4", medianAndSort(num7, num8)); // Output: 1
  console.log("eg-1", medianAndSort(num1, num2)); // Output: 2
  console.log("eg-2", medianAndSort(num3, num4)); // Output: 2.5
  console.log("eg-3", medianAndSort(num5, num6)); // Output: 8
  
  
  
  
  //====================== Problem ================================


  // Problem: Comparison of boolean and string/number
  let a = true;
 
 
  let b = "true";
  
  console.log(a == b);  // Output: true
  console.log(a === b); // Output: false
  
  a = true;
  b = 1;
  
  console.log(a == b);  // Output: true
  console.log(a === b); // Output: false
  


  
  
  
  //====================== Problem ================================


  // Problem: Create a Person class with a method to say hello
var Person = function (firstName, lastName, age) {
 
 
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
  
    this.sayHello = function () {
      console.log("Hello, " + this.firstName + " " + this.lastName);
    };
  };
  
  // Creating a new Person instance
  var person = new Person("John", "Doe", 50);
  
  // Calling the sayHello method
  person.sayHello(); // Output: Hello, John Doe
  
  
  
  
  //====================== Problem ================================


  // Problem: Test variable hoisting and scope
  function Test() {
 
 
    console.log(x); // Output: undefined
      var x = 10;
      console.log(x); // Output: 10
      
      console.log(y); // Output: undefined
      if (true) {
          var y = 20;
          console.log(y); // Output: 20
      }
      console.log(y); // Output: 20
  
      let z = 30;
      console.log(z); // Output: 30
  
      if (true) {
          let a = 40;
          console.log(a); // Output: 40
      }
      console.log(a); // Output: ReferenceError: a is not defined
  }
  
  Test();
  
  
  
  
  //====================== Problem ================================


  // Problem: Promise with timeout
  function promiseWithTimeout(timeoutMs, promise) {
 
 
    // Create a promise that will reject after the timeout period
      const timeoutPromise = new Promise((_, reject) => {
          setTimeout(() => reject(new Error('Promise timed out')), timeoutMs);
      });
  
      // Return a race between the provided promise and the timeout promise
      return Promise.race([promise, timeoutPromise]);
  }
  
  // Helper function to simulate an async operation with a delay
  const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));
  
  // Example usage
  const timeoutMs = 5000; // Timeout duration in milliseconds
  const asyncOperation = delay(3000).then(() => 'Operation complete');
  
  // Use the promiseWithTimeout function to handle timeout
  promiseWithTimeout(timeoutMs, asyncOperation)
      .then(result => {
          console.log('Result:', result); // Output: Result: Operation complete
      })
      .catch(error => {
          console.error('Error:', error.message);
      });
  
  
  
  
      //====================== Problem ================================


      // Problem: Length of the last word in a string
  function lengthOfLastWord(s) {
     
    
    // Trim any extra spaces from the start and end of the string
      s = s.trim();
      
      // Split the string into an array of words
      const words = s.split(' ');
      
      // Get the last word from the array
      const lastWord = words[words.length - 1];
      
      // Return the length of the last word
      return lastWord.length;
  }
  
  // Example usage
  console.log(lengthOfLastWord("Hello World")); // Output: 5
  
  
  
  
  //====================== Problem ================================


  
  
  
  //====================== Problem ================================
  
  // Problem: Two s
  um problem
 
 
  function twoSum(nums, target) {
      const map = new Map();
      let result = [];
      
      nums.forEach((num, i) => {
          const complement = target - num;
          
          if (map.has(complement)) {
              result = [map.get(complement), i];
          }
          
          map.set(num, i);
      });
      
      return result;
  }
  
  // Example usage
  console.log(twoSum([2, 7, 11, 15], 9)); // Output: [0, 1]



  //=================================================================================
// Problem: Check the output order and timing of asynchronous functions and promise resolution

async function async1() {
    console.log("async1 start");
    await async2();
    console.log("async1 end");
}

async function async2() {
    console.log("async2");
}

console.log("script start");

setTimeout(function () {
    console.log("setTimeout");
}, 0);

async1();

new Promise(function (resolve) {
    console.log("promise1");
    resolve();
}).then(function () {
    console.log("promise2");
});

console.log("script end");

// Output:
// script start
// async1 start
// async2
// promise1
// script end
// promise2
// async1 end
// setTimeout
//=================================================================================

// Problem: Compare null and undefined using equality operator
console.log(null == undefined);
// Output: true

//=================================================================================

// Problem: Subtract strings with unary plus operator
console.log('5' - - '3');
// Output: 8

//=================================================================================

// Problem: Test variable redeclaration within a block scope
var a = 10;
{
    var a = -10;
}
console.log(a);
// Output: -10

//=================================================================================

// Problem: Count zeros in a numeric string
const str = "32003023234400340";
const countOfZero = [...str].reduce((count, char) => count + (char === '0'), 0);
console.log(countOfZero);
// Output: 9

//=================================================================================

// Problem: Delay execution using async/await with a sleep function
console.log('start');

function sleep(ms) {
    return new Promise(res => setTimeout(res, ms));
}

async function delayTime() {
    console.log("wait for 5 second");
    await sleep(5000);
    console.log("stop");
}

delayTime();

// Output:
// start
// wait for 5 second
// (after 5 seconds)
// stop
//=================================================================================

// Problem: Closure example for incrementing a count
function outerFunction() {
    var count = 0;
    function increment() {
        count++;
        console.log(count);
    }
    return increment;
}
const counter1 = outerFunction();
counter1();
// Output: 1

//=================================================================================

// Problem: Remove duplicates and sort elements of an array
let a = 'a,b,c,c';
let arr = a.split(",");
let uniq = [...new Set(arr)];
console.log(uniq);
// Output: ['a', 'b', 'c']

//=================================================================================

// Problem: Test variable hoisting with implicit global declaration
function check() {
    let x = y = 0;
    x++;
    return x;
}

check();
console.log(typeof x); // => undefined
console.log(typeof y); // => number

// Output:
// undefined
// number
//=================================================================================

// Problem: Log index values after a for loop with setTimeout
var i;
for (i = 0; i < 3; i++) {
    const log = () => {
        console.log(i);
    }
    setTimeout(log, 100);
}
// Output:
// 3
// 3
// 3

//=================================================================================

// Problem: Infinite loop due to condition change within setTimeout
let x = true;
setTimeout(() => {
    x = false;
}, 2000);
while (x) {
    console.log("hello");
}
// Output: infinite loop printing "hello"

//=================================================================================


//=================================================================================

// Problem: UseState behavior and console log of state after mutation
const [count, setCount] = useState(1);
for (let i = 0; i < 10; i++) {
    setCount(count++);
}
console.log(count);
// Output: 1

//=================================================================================

// Problem: Log order of synchronous and asynchronous operations
console.log(1);
setTimeout(() => {
    console.log(2);
}, -10);
new Promise((resolve, reject) => {
    resolve('4');
}).then((data) => console.log(data));
console.log(3);
// Output: 1
// 3
// 4
// 2

//=================================================================================

// Problem: Remove duplicates, sort and pick first two elements
const input = [3, 2, 4, 1, 2, 1, 4, 6];
const output = [...new Set(input)] // Remove duplicates
                   .sort((a, b) => a - b) // Sort
                   .slice(0, 2); // Pick the first two items

console.log(output); // Output: [1, 2]

//=================================================================================

// Problem: Log variable values with hoisting and reassignments
console.log(a);

function xyz() {
    a = 10;
    console.log(a);
    var a;
}

xyz();
var a = 20;
// Output: undefined
// 10


//=================================================================================

// Problem 1: Find uncommon values between two arrays
const array1 = [1, 2, 3, 4, 5, 6];
const array2 = [4, 5, 6, 7, 8, 9];

const findUncVal = (array1, array2) => {
  const uncommon1 = array1.filter(value => !array2.includes(value));
  const uncommon2 = array2.filter(value => !array1.includes(value));
  return [...uncommon1, ...uncommon2];
};

console.log(findUncVal(array1, array2)); 
// Output: [1, 2, 3, 7, 8, 9]

// Alternative method to find uncommon values
const findUncVal2 = (array1, array2) => {
  const unCommon = [];
  
  const contains = (array, value) => {
    for (let i = 0; i < array.length; i++) {
      if (array[i] == value) {
        return true;
      }
    }
    return false;
  };

  for (let i = 0; i < array1.length; i++) {
    if (!contains(array2, array1[i])) {
      unCommon.push(array1[i]);
    }
  }

  for (let i = 0; i < array2.length; i++) {
    if (!contains(array1, array2[i])) {
      unCommon.push(array2[i]);
    }
  }

  return unCommon;
};

console.log(findUncVal2(array1, array2)); 
// Output: [1, 2, 3, 7, 8, 9]

//=================================================================================

// Problem 2: Empty an array
console.log(" Q.1 HoW to empty an array in JavaScript");

var arrayList = ["a", "b", "c", "d", "e", "f"];

// Method 1
arrayList = [];
console.log(arrayList); 
// Output: []

// Method 2
var arrayList = ["a", "b", "c", "d", "e", "f"];
arrayList.length = 0;
console.log(arrayList); 
// Output: []

// Method 3
var arrayList = ["a", "b", "c", "d", "e", "f"];
arrayList.splice(0, arrayList.length);
console.log(arrayList); 
// Output: []

//=================================================================================

// Problem 3: Duplicate elements in an array
console.log("Q2 duplicate");

var duplicate = [1, 2, 3, 4, 5];
const duplicate2 = duplicate.concat(duplicate);
console.log(duplicate2); 
// Output: [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]

//=================================================================================

// Problem 4: Nested functions
console.log("Q3 nested function");

const mul = (x) => {
  return function (y) {
    return function (z) {
      return x * y * z;
    };
  };
};

console.log(mul(2)(3)(4)); 
// Output: 24

console.log(mul(4)(3)(4)); 
// Output: 48

//=================================================================================

// Problem 5: Remove duplicates from an array
console.log("4 Remove duplicates from an array");

var chars = ["A", "B", "A", "C", "B"];
var uniqueChars = [...new Set(chars)];
console.log(uniqueChars); 
// Output: ['A', 'B', 'C']

// Alternative methods
var array = ["A", "B", "A", "C", "B"];

// Method 1
var uniqueArray = array.filter((val, i) => {
  return array.indexOf(val) == i;
});
console.log(uniqueArray); 
// Output: ['A', 'B', 'C']

// Method 2
var uniqueArray = [];
array.forEach((val) => {
  if (!uniqueArray.includes(val)) {
    uniqueArray.push(val);
  }
});
console.log(uniqueArray); 
// Output: ['A', 'B', 'C']

//=================================================================================

// Problem 6: Reverse a string
var reverse = "reverse String";

// Example of reversing a string (not explicitly shown in the given code)
// const reversedString = reverse.split('').reverse().join('');
// console.log(reversedString); 

//=================================================================================

// Problem 7: Join array elements into a string
console.log("simple JavaScript program to join all elements of the following array into a string.");

var myColor = ["Red", "Green", "White", "Black"];
console.log(myColor.toString()); 
// Output: Red,Green,White,Black

console.log(myColor.join("  ")); 
// Output: Red  Green  White  Black

console.log(myColor.join("+")); 
// Output: Red+Green+White+Black

//=================================================================================

// Problem 8: Pre and Post increment
console.log("=======Pre first it will increment and then assign value to variable =============");

var a = 10;
var b = ++a;
console.log(a); 
// Output: 11

console.log(b); 
// Output: 11

console.log("=======Post it will not increment, same value is applied to variable =============");

var a = 10;
var b = a++;
console.log(a); 
// Output: 11

console.log(b); 
// Output: 10

console.log("Pre and post decrement");

var x = 10;
var y = --x;
console.log(x); 
// Output: 9

console.log(y); 
// Output: 9

var x = 10;
var y = x--;
console.log(x); 
// Output: 9

console.log(y); 
// Output: 10

//=================================================================================

// Problem 9: Find maximum element in an array
console.log("Q.1 Find the maximum element in an array");

const array = [5, 2, 8, 10, 3];

let max = array[0];

const maxFun = () => {
  for (let i = 0; i < array.length; i++) {
    if (max < array[i]) {
      max = array[i];
    }
  }
  return max;
};

console.log(maxFun()); 
// Output: 10

//=================================================================================

// Problem 10: Convert array to object
const arrayToObject = (arr) => {
  const obj = {};
  arr.forEach((item, index) => {
    obj[index] = item;
  });
  return obj;
};

const myArray = ['a', 'b', 'c'];
const myObject = arrayToObject(myArray);
console.log(myObject); 
// Output: { 0: 'a', 1: 'b', 2: 'c' }

//=================================================================================

// Problem 11: Shopping cart with closures
function createShoppingCart() {
  let items = []; // Private variable to store items in the cart
  
  function addItem(item) {
    items.push(item);
    console.log(item.name + " added to cart.");
  }
  
  function removeItem(item) {
    let index = items.findIndex(i => i.id === item.id);
    if (index !== -1) {
      items.splice(index, 1);
      console.log(item.name + " removed from cart.");
    } else {
      console.log("Item not found in cart.");
    }
  }
  
  function getCartItems() {
    return items.slice(); // Return a copy of items array
  }
  
  return {
    addItem,
    removeItem,
    getCartItems
  };
}

const shoppingCart = createShoppingCart();

shoppingCart.addItem({ id: 1, name: "Product 1", price: 10 });
shoppingCart.addItem({ id: 2, name: "Product 2", price: 20 });

const cartItems = shoppingCart.getCartItems();
console.log("Items in the cart:", cartItems); 
// Output: Items in the cart: [ { id: 1, name: 'Product 1', price: 10 }, { id: 2, name: 'Product 2', price: 20 } ]

shoppingCart.removeItem({ id: 1, name: "Product 1", price: 10 });

const updatedCartItems = shoppingCart.getCartItems();
console.log("Updated items in the cart:", updatedCartItems); 
// Output: Updated items in the cart: [ { id: 2, name: 'Product 2', price: 20 } ]

//=================================================================================

// Problem 12: Convert array of arrays to array of objects
let array = [
  ['1', 40],
  ['2', 60],
  ['3', 50],
  ['5', 20]
];

let arrayOfObjects = array.map(subArray => {
  return { id: subArray[0], value: subArray[1] };
});

console.log(arrayOfObjects);
// Output: [ { id: '1', value: 40 }, { id: '2', value: 60 }, { id: '3', value: 50 }, { id: '5', value: 20 } ]

//=================================================================================

// Problem 13: Sort array of arrays by second element
let array = [
  ['4', 3],
  ['1', 13],
  ['5', 1],
  ['6', 4],
  ['2', 1],
  ['7', 3],
  ['7', 32],
  ['9', 11],
  ['10', 1]
];



const sortOfArray = array.sort((a, b) => a[1] - b[1]);

console.log(sortOfArray);
// Output: [ [ '5', 1 ], [ '2', 1 ], [ '10', 1 ], [ '4', 3 ], [ '7', 3 ], [ '6', 4 ], [ '9', 11 ], [ '1', 13 ], [ '7', 32 ] ]

//=================================================================================

// Problem 14: Sort array of numbers in ascending and descending order
let array = [5, 3, 8, 1, 2];

// Ascending order
array.sort((a, b) => a - b);
console.log(array); 
// Output: [1, 2, 3, 5, 8]

// Descending order
array.sort((a, b) => b - a);
console.log(array); 
// Output: [8, 5, 3, 2, 1]

//=================================================================================

// Problem 15: Sort array of strings in ascending and descending alphabetical order
let stringArray = ["banana", "apple", "cherry", "date"];

// Ascending order (alphabetical)
stringArray.sort((a, b) => a.localeCompare(b));
console.log(stringArray); 
// Output: ["apple", "banana", "cherry", "date"]

// Descending order (reverse alphabetical)
stringArray.sort((a, b) => b.localeCompare(a));
console.log(stringArray); 
// Output: ["date", "cherry", "banana", "apple"]

//=================================================================================

// Problem 16: Sort array of strings based on second part
let stringArray3 = ["banana aw", "apple mz", "cherry op", "date bc"];

stringArray3.sort((a, b) => {
  const aSecondPart = a.split(' ')[1];
  const bSecondPart = b.split(' ')[1];
  return aSecondPart.localeCompare(bSecondPart);
});

console.log(stringArray3); 
// Output: ["banana aw", "date bc", "apple mz", "cherry op"]


  //=================================================================================

  anagrams example in javascript with and without using sort

  function Compare(str1, str2) {
    if (str1.length !== str2.length) {
        return false;
    }

    const frequencyCounter = {};

    for (let char of str1.toLowerCase()) {
        frequencyCounter[char] = (frequencyCounter[char] || 0) + 1;
    }

    for (let char of str2.toLowerCase()) {
        if (!frequencyCounter[char]) {
            return false;
        }
        frequencyCounter[char] -= 1;
    }

    for (let count in frequencyCounter) {
        if (frequencyCounter[count] !== 0) {
            return false;
        }
    }

    return true;
}
//------------------------------------------------------------------------
function Compare(str1, str2){
     if (str1.length !== str2.length) {
        return false
     }
  
    return str1.toLowerCase().split("").sort().join("") === str2.toLowerCase().split("").sort().join("")
}

console.log(Compare("Listen", "Silent")) //true
console.log(Compare("Mary", "arms")) //false

//=================================================================================
flatten the resulting array of arrays. //
How can make flattenf array for single array to fllatend

function splitArray(arr, chunkSize) {
    const result = [];
    for (let i = 0; i < arr.length; i += chunkSize) {
        result.push(arr.slice(i, i + chunkSize));
    }
    return result;
}


const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
const chunkSize = 3;

const arr_new = splitArray(arr, chunkSize);
console.log(arr_new);

//=================================================================================
flat array
const flat2 =[[1,2,3,],[1,2,3,4,5]]
const output=[1,2,3,4,5] 

const result1=Array.from(new Set(flat2.flat()))
console.log(result1)