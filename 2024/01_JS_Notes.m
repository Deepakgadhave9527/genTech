

//===========================this =========================


Q2. What is this?

In JavaScript, the `this` keyword refers to the current execution context.
Its value depends on how a function is called and where it is called.
The behavior of `this` can vary in different situations:

<!-- -The JavaScript this keyword refers to the object it belongs to. -->
-Alone, this refers to the  window object.
-In a normal function, this refers to the  window object.
-In a method, this refers to the owner object.

-In a function, in strict mode, this is undefined.
-In an event, this refers to the element that received the event.
-Methods like call(), and apply() can refer this to any object.


It has different values depending on where it is used:




1. Global context:
In the global scope, `this` refers to the global object, which is `window` in web browsers and `global` in Node.js.

console.log(this === window); // true in a browser environment


2. Function context: Inside a function, the value of `this` depends on how the function is called. If the function is called as a method of an object, `this` refers to that object.

const obj = {
name: 'example',
greet: function() {
console.log('Hello, ' + this.name);
}
};

obj.greet(); // Output: Hello, example


3. Constructor context: When a function is used as a constructor with the `new` keyword, `this` refers to the newly created instance.

function Person(name) {
this.name = name;
}

const person1 = new Person('John');
console.log(person1.name); // Output: John


4. Explicit binding: You can explicitly set the value of `this` using `call()`, `apply()`, or `bind()` methods.

function greet() {
console.log('Hello, ' + this.name);
}

const obj1 = { name: 'Alice' };
const obj2 = { name: 'Bob' };

greet.call(obj1); // Output: Hello, Alice
greet.apply(obj2); // Output: Hello, Bob

const greetBob = greet.bind(obj2);
greetBob(); // Output: Hello, Bob

<button id="myButton">Click Me</button>
<script>
  document.getElementById('myButton').addEventListener('click', function() {
    console.log(this); // Refers to the button element
  });

  document.getElementById('myButton').addEventListener('click', () => {
    console.log(this); // Refers to the global object or undefined (depending on the environment), not the button element
  });
</script>

Understanding the context in which `this` is used is crucial for writing effective JavaScript code.

//===========================Bubbling and Capturing =========================


A) Bubbling

-The bubbling principle is simple.
-When an event happens on an element, it first runs the handlers on it,
then on its parent, then all the way up on other ancestors.

-With bubbling, the event is first captured and handled by the innermost element and
then propagated to outer elements.


B] capturing

- capturing principle is simple.
-when an event happen on element ,it first run the parent element of then lastly run handler


-With capturing, the event is first captured by the outermost element and
propagated to the inner elements.

-Capturing is also called "trickling", which helps remember the propagation order:

stopPropagation prevents further propagation of the current event in the capturing and bubbling phases.

preventDefault prevents the default action the browser makes on that event.



========================== typeof ==================================

Q1: What is typeof operator?

JavaScript provides a typeof operator that can examine a value and tell you what type it is:
var a;
typeof a; // "undefined"


console.log(typeof undefined); // Output: "undefined"
console.log(typeof null);      // Output: "object"
console.log(typeof NaN);       // Output: "number"

let a;

a = "hello world";
console.log(typeof a); // "string"

a = 42;
console.log(typeof a); // "number"

a = true;
console.log(typeof a); // "boolean"

a = null;
console.log(typeof a); // "object" -- weird, bug

a = undefined;
console.log(typeof a); // "undefined"

a = { b: "c" };
console.log(typeof a); // "object"

a = [1, 2, 3];
console.log(typeof a); // "object"
console.log(Array.isArray(a)); // true

<!-- The typeof operator for arrays returns "object" because arrays are a special type of object in JavaScript.
 If you want to specifically check if a variable is an array, you can use  -->

function greet(name) {
    return "Hello, " + name + "!";
}
console.log(typeof greet); // "function"

const greetExpression = function(name) {
    return "Hello, " + name + "!";
};
console.log(typeof greetExpression); // "function"

const greetArrow = (name) => {
    return "Hello, " + name + "!";
};
console.log(typeof greetArrow); // "function"



========================== Prototype ==================================
Prototype:-
- Every object in JavaScript has a prototype,
 which is another object that provides shared properties and methods.
-Prototypes are the mechanism by which JavaScript objects iinherit properties and method from one another.

-Javascript is a Prototype based language.




Types of Prototypes in JavaScript
Object Prototype
Function Prototype
Prototype Chain




There are two main ways to set the prototype of an object:

1. By using `__proto__`
   - The `__proto__` property can be used to directly set the prototype of an object.
   let animal = { eats: true };
   let rabbit = { jumps: true };
   rabbit.__proto__ = animal; // Setting the prototype
   console.log(rabbit.eats); // Output: true
   

2. By using `Object.setPrototypeOf()`
   - The `Object.setPrototypeOf(obj, prototype)` method sets the prototype of `obj` to `prototype`.
   let animal = { eats: true };
   let rabbit = { jumps: true };
   Object.setPrototypeOf(rabbit, animal); // Setting the prototype
   console.log(rabbit.eats); // Output: true
   




### Types of Prototypes in JavaScript

1. Object Prototype
   - Every object has a prototype, from which it inherits properties and methods.
   - Access via `Object.getPrototypeOf(obj)` or `obj.__proto__`.

   let obj = {};
   console.log(obj.__proto__); // Output: {}
   

2. Function Prototype
   - Functions have a `prototype` property used when creating objects with `new`.
   - Example:
       function Person(name) {
         this.name = name;
     }
     Person.prototype.greet = function() {
         console.log('Hello, ' + this.name);
     };
     let alice = new Person('Alice');
     alice.greet(); // Output: Hello, Alice
     

3. Prototype Chain
   - Objects inherit properties and methods from their prototype, forming a chain.
   - Example:
       let animal = { eats: true };
     let rabbit = { jumps: true };
     rabbit.__proto__ = animal;
     console.log(rabbit.eats); // Output: true
     

//==============================JavaScript Use Strict=========================
The "+" directive was new in ECMAScript version 5

purpose of "use strict" is to indicate that the code should be executed in "strict mode".
With strict mode, you can
not, use undeclared variables.

Certainly! Heres a list of key restrictions and changes applied by `"use strict"` in JavaScript:

1. Eliminates `this` coercion
2. Disallows undeclared variables
3. Disallows duplicate parameter names
4. Disallows `with` statements
5. Disallows octal literals
6. Disallows `eval` from modifying scope
7. Disallows `delete` on variables and functions
8. Requires unique function parameter names
9. `arguments` object is not linked to parameters
10. Prohibits `getter` and `setter` methods with the same name
11. Avoids silent errors
12. No `this` binding in class methods
13. Disallows future reserved keywords


=================================================================================================================
let and const var keywords

In javascript to declare a variable you can use 'var' keyword, but since ES6 there are 2 more keywords
introduced to declare the variables.



var:-
- it is hoisted
- It is function scoped
- Can be redeclared within the same scope
var x = 5;
var x = 10;

- It  rewritable
var x = 10;
x = 20; // Valid: Updates the value of x


let:-
- It is not hoisted
- It is block scoped

- Cannot be redeclared within the same block scope
let y = 5;
let y = 10; // SyntaxError: Identifier 'y' has already been declared


- It is rewritable

let y = 10;
y = 20; // Valid: Updates the value of y



hoisting error
ReferenceError: Cannot access 'a' before initialization

const:-
- It is not hoisted
- It is block scoped

- Cannot be redeclared within the same block scope

const z = 5;
const z = 10; // SyntaxError: Identifier 'z' has already been declared

-const is not  rewritable

const x = 10;
x = 20; //  TypeError: Assignment to constant variable.



For primitives, 
const makes the value itself immutable and the reference unchangeable.
For non-primitives, 
const makes the reference unchangeable, but the contents of the object or array can still be modified.

let and const
Not Hoisted , but with a Temporal Dead Zone (TDZ). The declaration is hoisted, 
but the variable is not accessible until the code execution reaches the let declaration.
 Accessing the variable before its declaration results in a ReferenceError.

 
//================================= Closure ========================
## Closure:-
 closure is ablity to provide access outer function scope to inner function 

 access variables from that scope even after the outer function has finished executing

-A closure is a combination of a nested function and lexical scope
-By using closure a nested function can use the variable of outer function.

-A lexical scope in JavaScript means that a variable defined outside a function can
be accessible inside another function





clousure inner function can be access of outer function


function outerFunction() {
let outerVariable = 'I am outer';

function innerFunction() {
// innerFunction has access to outerVariable due to closure
console.log(outerVariable);
}

return innerFunction;
}

const innerFunc = outerFunction();
innerFunc(); // Output: I am outer

function createCounter() {
  let count = 0;
  return function() {
    count++;
    return count;
  };
}

const counter = createCounter();
console.log(counter()); // 1
console.log(counter()); // 2





=============================================================================================================

Object destructuring:-
Object destructuring is used to declare and initialzize variables by extracting the values from
object properties.

const person = {
name: "Topper Skills",
mobile: "7875580668",
email: "topperskills@gmail.com",
city: "Pune",
};

### without Object destructuring

const phone = person.mobile;
const email = person.email;
const city = person.city;

### with Object destructuring
Property name and variable name must be same

const { mobile: phone, email, city } = person;
console.log(phone, email, city);


### Destructuring Nested Properties

const car = {
brand: "Hyundai",
model: "Verna",
info: {
price: 1200000,
color: "white",
bio:{
age:20
}
}
}


const {info:{bio:{age}}}=car
console.log(age)//20

const {info:{bio:{age:age3}}}=car
console.log(age3)//20


====================================================================================================

// Array Destructuring:-

const nums = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

const a = nums[0];
const b = nums[1];
const c = nums[2];
const d = nums[4];
with destructuring

const [a, b, c, d] = nums;

console.log(a, b, c, d);

const nestedArray = [1, [2, 3, 7], [4, [5, 6]]];

const [first, [, third], [fourth, [fifth, sixth]]] = nestedArray;

console.log(first); // 1
console.log(third); // 3
console.log(fourth); // 4
console.log(fifth); // 5
console.log(sixth); // 6


//============================Object.keys, values, entries =============


For plain objects, the following methods are available:

Object.keys(obj) – returns an array of keys.
Object.values(obj) – returns an array of values.
Object.entries(obj) – returns an array of [key, value] pairs.

const object1 = { a: 10, b: 20, c: 30 };

const keys = Object.keys(object1);
const values = Object.values(object1);
const entries = Object.entries(object1);

console.log(keys); // ["a", "b", "c"]
console.log(values); // [10, 20, 30]
console.log(entries); 
// [["a", 10], ["b", 20], ["c", 30]]

console.log(...entries); 
// ["a", 10] ["b", 20] ["c", 30]

--------------------------------------------------------------------------------------------------- 
const object1 = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

var key =Object.keys(object1);
var val =Object.values(object1)
var entries =Object.entries(object1)

console.log(key); Array ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

console.log(...val); 10 20 30 40 50 60 70 80 90 100\\> Array [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

console.log(...entries); -+Array ["0", 10] Array ["1", 20] Array ["2", 30] Array ["3", 40] Array ["4", 50] Array ["5",
60] Array ["6", 70] Array["7", 80] Array ["8", 90] Array ["9", 100]

// expected output: Array ["a", "b", "c"]


//=================================Spread operator==========================

Spread operator:-
It is used to extract elements of an array or to extract properties from an iterable object.

const arr = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

console.log(...arr);

const per = {
name: "TOpper Skills",
mobile: "7875580668",
email: "topperskills@gmail.com",
};
const iterObj = Object.keys(per);
console.log(...iterObj);\\name mobile email



======================================Rest operator:-========================


Rest operator:-
-The rest operator is used to store all the arguments which do not have matching parameters.
-The rest is an array.
-Rest operator basic help to pass infinite number of argument in a function

Example:

function add(a, b, ...args) {
console.log(a, b);
console.log(args);
}

add(10, 20);
add(10, 20, 30, 40, 50);

function greet(name) { // 'name' is a parameter
    console.log('Hello, ' + name);
}

greet('Alice'); // 'Alice' is an argument


//============================ arguments object vs rest operator===================================

##= arguments object vs rest operator =##

-Arguments is an object.
-rest is an array

-Arguments gives the details of a function call including caller, callee, arguments.
-Rest operator does not give details about the function call, it gives only the arguments which do not have
matching parameters

-Arguments object gives all the arguments despite those arguments have matching parameters or not
-Rest oeprator does not give the arguments which have matching parameters

-The arguments object is built-in
-The rest operation is not built, you need to declare it after all the parameters of a function



//============================== Noraml function vs arrow function =========================

A]Noraml function

-this value inside a regular function is dynamic and depends on the invocation.
-Noraml functions created using function declarations or expressions

-Noraml functions are constructible, invoked with the new keyword
-Noraml functions used have duplicate named parameters
-Noraml function is hoisted

-In normal function arguments object are available
-Arguments object gives the details of a function call including caller, callee, arguments.


B]Arrow function
-Arrow functions do not have their own this context.
 Instead, they inherit this from the surrounding lexical scope (the context in which they are defined).

-arrow function cannot be used as a constructor. NOT invoked with the new keyword
-Arrow functions can never have duplicate named parameters, whether in strict or non-strict mode.
-Arrow function is Not hoisted
-In Arrow function arguments object NOT available



-Arrow function — also called fat arrow function

-Curly brackets arent required if only one expression is present.
let add = (x, y) => x + y;

-If theres only one argument, then the parentheses are not required either:
let squareNum = x => x * x;

arrow functions do not have their own this value.
Instead, they inherit the this value from the enclosing lexical scop


//============================== call,apply,bind =========================


To call a function of a specific object you can use below methods
A] call():
-Call method is predefine method in JavaScript
-an object can use a method belonging to another object
-call method is invoke a function with given this value and argument provided by one by one

- accepts arguments as seperate values

///1
var employee1 = {firstName: 'John', lastName: 'Rodson'};
var employee2 = {firstName: 'Jimmy', lastName: 'Baily'};

function invite(greeting1, greeting2) {
console.log(greeting1 + ' ' + this.firstName + ' ' + this.lastName+ ', '+ greeting2);
}

invite.call(employee1, 'Hello', 'How are you?'); // Hello John Rodson, How are you?
invite.call(employee2, 'Hello', 'How are you?'); // Hello Jimmy Baily, How are you?


//2
var employee1 = {
  firstName: 'John',
  lastName: 'Rodson',
  invite: function(greeting1, greeting2) {
      console.log(greeting1 + ' ' + this.firstName + ' ' + this.lastName + ', ' + greeting2);
  }
};

var employee2 = {
  firstName: 'Jimmy',
  lastName: 'Baily'
};

employee1.invite.call(employee2, "Hello", "World");




B]apply():

-apply() method is similar to call() method
-call method argument takes separately
-apply method argument takes as an array
-invoke the function with a given this value and argument provided by an array

-accepts arguments as an array elements


ar employee1 = {firstName: 'John', lastName: 'Rodson'};
var employee2 = {firstName: 'Jimmy', lastName: 'Baily'};

function invite(greeting1, greeting2) {
console.log(greeting1 + ' ' + this.firstName + ' ' + this.lastName+ ', '+ greeting2);
}

invite.apply(employee1, ['Hello', 'How are you?']); // Hello John Rodson, How are you?
invite.apply(employee2, ['Hello', 'How are you?']); // Hello Jimmy Baily, How are you?





C] bind()

- bind() method we can bind an object to a common function ,so that the
function gives different result when its need
-bind method takes an object as an first argument and create a new function



var employee1 = {firstName: 'John', lastName: 'Rodson'};
var employee2 = {firstName: 'Jimmy', lastName: 'Baily'};

function invite(greeting1, greeting2) {
console.log(greeting1 + ' ' + this.firstName + ' ' + this.lastName+ ', '+ greeting2);
}

var inviteEmployee1 = invite.bind(employee1);
var inviteEmployee2 = invite.bind(employee2);
inviteEmployee1('Hello', 'How are you?'); // Hello John Rodson, How are you?
inviteEmployee2('Hello', 'How are you?'); // Hello Jimmy Baily, How are you?


const person = {
  firstName: 'John',
  lastName: 'Doe',
  fullName: function() {
      return this.firstName + ' ' + this.lastName;
  }
};

const printFullName = person.fullName;

// console.log(printFullName()); // Output: "undefined undefined"

const boundPrintFullName = printFullName.bind(person);
console.log(boundPrintFullName()) // Output: "John Doe"



- return a new function ,allow you to pass any number of argument
- it binds a function with an object and return the binded function.
It does not bind the existing function instead if create a new function to bind


##============ Object cloning============

-Crreating a duplicate object of an existing object is called object cloning

There are 2 types of object cloning

1. Shallow cloning
-In shallow cloning only direct/main object gets cloned but not the object
which are referred by the properties of main object.

-changing value of cloned object will be refect into
orginal object as well because both are point same refrance object

const original = { a: 1, b: { c: 2 } };
const clone = { ...original };


clone.b.c = 3;
console.log(original.b.c); // Output: 3

This happens because original.b and clone.b point to the same object in memory.

const original = {
  name: 'John',
  age: 30,
  address: { city: 'New York', country: 'USA' }
};

const shallowClone = Object.assign({}, original);

console.log(shallowClone === original); // false (different objects)
console.log(shallowClone.address === original.address); // true (same reference)



2. Deep cloning
-In deep cloning all the object direct/main and nested objects will be cloned.

-changing value of cloned object will be not refect into
orginal object as well because both are point different refrance object

const original = { a: 1, b: { c: 2 } };

const clone = JSON.parse(JSON.stringify(original));
clone.b.c = 3;
console.log(original.b.c); // Output: 2

const original = {
  name: 'John',
  age: 30,
  address: { city: 'New York', country: 'USA' }
};

const deepClone = JSON.parse(JSON.stringify(original));

console.log(deepClone === original); // false (different objects)
console.log(deepClone.address === original.address); // false (different objects)




var person = {
name: "deepak",
add: {
road: "MRG",
puc: 65
}

}
//var person2 = person;
//person2.name="wadikar"

// shallow cloning
let person2 = Object.assign({}, person)
person2.name = "patil";
person2.add.road = "pa";

//deep cloning
var p3 = JSON.parse(JSON.stringify(person));
p3.add.road = "MGm3"

console.log(person)
console.log(person2)
console.log(p3)


const obj={
name:"ABC",
age:20,
address:{
city:'Beijing',
country:'China'
}
}
const obj2 ={...obj}
obj2.name="PQR"

const obj3 =Object.assign({},obj)
obj3.age=21

const obj4=JSON.parse(JSON.stringify(obj))
obj4.address.city="Pune"
console.log("obj",obj);
console.log("obj2",obj2);
console.log("obj3",obj3);
console.log("obj4",obj4);






// Original object with nested properties
const original = {
    name: 'John',
    age: 30,
    address: { city: 'New York', country: 'USA' }
};

// Shallow clone using Object.assign or spread syntax
const shallowClone = Object.assign({}, original);

// Modify the shallow clone
shallowClone.name = 'Jane';
shallowClone.address.city = 'San Francisco';

// Log both original and shallow clone
console.log(original);    // Output: { name: 'John', age: 30, address: { city: 'San Francisco', country: 'USA' } }
console.log(shallowClone); // Output: { name: 'Jane', age: 30, address: { city: 'San Francisco', country: 'USA' } }



//=========================================Set====================
Set:-
Set is like an array but it stores only unique elements.

An array is used to store multiple elements of any type, an array can store duplicate
elements.

// Creating a set
1. Creating empty set.
const s1 = new Set();

// add(value) - adds an element and returns the set after adding the element

const mySet =new Set([1,2,4,,5,6,6,,33,2,4,5,6,6,4,4,4,1,1,11,"A","a"])
console.log(mySet)

mySet.add({
    name:"Abc"
});
mySet.add({second:'This is second value'});
mySet.add('third','This is third value')
mySet.add('APlle')
mySet.add("apple")
console.log(mySet)
mySet.delete(1)
for(let val of mySet){
    console.log("val --",val)
}
// mySet.clear()




console.log(mySet)



//============================map ===============================
Map:- The Map is used to store key value pairs .

A key value pair is called an entry
A key must be unique
the values can be duplicate

Creating Map

1. creating empty map

const m1 = new Map();

set()
delete()
value()
keys()


//=============================sync and asynch=================
Note:- Javascript is a Synchronous programming language.

Javascript is single threaded.

But the execution environment of the Javascript is asynchronous.

// synchronous execution

How does javascript code gets executed asynchronously when there is one thread?

=> Javascript is single threaded, synchronous but the environment in which the javascript
code gets executed is asynchronous.

The javascript runtime(event loop) performs non blocking IO operations by offloading most of the work
to operating system.
/
/callback

// To write async code you need

1. callback

A callback is a normal javascript function which is passed as an argument to
another function to perform future operation.

A callback is used to perform any future operation after an asynchronous operation.


// 2. Promise

// 3. async await



//== ==============================Higher Order function :-==============================
Higher Order function :-
A function which accepts another function as an argument is called a higher
order function.
The higher order function is used to perform different operations.

Example: addEventListener



//=================== promise =============================
Promise:
In JavaScript,
 a Promise is an object representing the eventual completion or failure of an asynchronous operation and its resulting value. 
 Promises provide a way to handle asynchronous code more effectively, avoiding callback hell and making code easier to read and maintain.



In JavaScript, a Promise is an object that will produce a single value some time in the future.
 If the promise is successful, it will produce a resolved value
 ,but if something goes wrong then it will produce a reason why the promise failed. 
The possible outcomes here are similar to that of promises in real life.




-Promise are thr ideal choice for handling asynchronous operation in simplest manner
-they can handle multiple asynchronous operation easily and provide better error handling then Callback and event
#promise has four strategist
1]fulfilled: Action related to the promise succeeded
2] Rejected : Action related to the promise failed
3] pending- Neither fulfilled nor rejected yet means promise still pending.
4]settle- The Promise has been either fulfilled or rejected.

A].then():
-then() function is invoked when a promise is resolved and a result is received.

B].catch()
catch() function is invoked when a promise is either rejected or some error has occured in execution.

Applications
Promises are used for asynchronous handling of events.
Promises are used to handle asynchronous http requests.





A promise is an object which is used to perform asynchronous operations.

A promise gets settled(either resolved or rejected) in future.

If promise gets resolved then it calls the callback passed to then() function.

If promise gets rejected then it called the callback passed to catch() function.
then chaining

Writing multiple thens one after another for a promise is called then chaining

A then() returns a promise





//===========================asynch await =========================


-The async await is used to pause the execution of a function until a promise gets settled


-async keyword Put the before a function , tells the function to return a Promise
-await keyword is used within an async function to pause its execution until a Promise is settled.
- It waits for the Promise to resolve (either fulfilled or rejected) and then returns its result.
-await should only be used inside the async function.




//===========================asynch await =========================
async await

-The async await is used to pause the execution of a function until a promise gets settled

A] - Async Keyword:

-async keyword Put the before a function , tells the function to return a Promise
- This allows the function to use the "await" keyword internally to handle asynchronous operations.


B]- Await Keyword:


- "await" keyword is used within an async function to pause its execution until a Promise is settled.
- It waits for the Promise to resolve (either fulfilled or rejected) and then returns its result.
- Note: The "await" keyword can only be used inside async functions, otherwise, it would result in a SyntaxError.



-await should only be used inside the async function.

-The await keyword simply makes JavaScript wait until that Promise settles and then returns its result
-await keyword only works inside async functions, otherwise you would get a SyntaxError.


//===========================global object =========================


Q1. what is global object in javascript?
-A global object is an object that always exists in the global scope
-In a web browser, the global object is the window object
-The global object can be accessed using the "this" operator in the global scope
-The global object in JavaScript is an always defined object that provides
variables and functions, and is available anywhere.



window is a global object of javascript it is used to load / display a web page
content in the web browser.

The window object represents a tab of a web browser, it includes navigation model, histoy,
location, document, etc.

document represents a web page in the web browser.

document object is a part of window object.

Using document object you can dynamically update the content on the viewport.

========================== ES6 features ==================================

Below is the list of top ES6 features every JavaScript developer should know,


1. let and const:
2. Arrow Functions:
3. Template Literals:
4. Destructuring Assignment:
5. Default Parameters:
6. Rest and Spread Operators:
7. Classes:
8. Modules:
9. Promises:
10. Symbol:
11. Iterators and Generators:
12. Map and Set:
13. WeakMap and WeakSet:
14. Enhanced Object Literals:
15. Object.assign():
16. String Methods:
17. Number Methods:
18. Math Methods:
19. New Data Structures:
20. For…of Loop:


Default parameters
Spread and Rest syntaxes (…)
let and const
promise
Destructuring assignment
Arrow function expressions
Classes

Template literals (Template strings)
Tagged Templates
Object.assign() and Object.is()

1. let and const
   ```javascript
   let x = 10;
   const y = 20;
   x = 15; // Allowed
   // y = 25; // Error: Assignment to constant variable
   ```

2. Arrow Functions
   ```javascript
   const add = (a, b) => a + b;
   console.log(add(2, 3)); // 5
   ```

3. **Template Literals**
   ```javascript
   const name = 'World';
   const greeting = `Hello, ${name}!`;
   console.log(greeting); // Hello, World!
   ```

4. **Destructuring Assignment**
   ```javascript
   const [a, b] = [1, 2];
   const { name, age } = { name: 'Alice', age: 30 };
   console.log(a, b); // 1 2
   console.log(name, age); // Alice 30
   ```

5. **Default Parameters**
   ```javascript
   function greet(name = 'Guest') {
     return `Hello, ${name}!`;
   }
   console.log(greet()); // Hello, Guest!
   console.log(greet('John')); // Hello, John!
   ```

6. **Rest and Spread Operators**
   - **Rest Operator**:
     ```javascript
     function sum(...numbers) {
       return numbers.reduce((acc, num) => acc + num, 0);
     }
     console.log(sum(1, 2, 3, 4)); // 10
     ```
   - **Spread Operator**:
     ```javascript
     const arr = [1, 2, 3];
     const newArr = [0, ...arr, 4];
     console.log(newArr); // [0, 1, 2, 3, 4]
     ```

7. **Classes**
   ```javascript
   class Person {
     constructor(name) {
       this.name = name;
     }
     greet() {
       return `Hello, ${this.name}!`;
     }
   }
   const john = new Person('John');
   console.log(john.greet()); // Hello, John!
   ```

8. **Modules**
   - **Export**:
     ```javascript
     // module.js
     export const pi = 3.14;
     export function add(a, b) {
       return a + b;
     }
     ```
   - **Import**:
     ```javascript
     // main.js
     import { pi, add } from './module.js';
     console.log(pi); // 3.14
     console.log(add(2, 3)); // 5
     ```

9. **Promises**
   ```javascript
   const myPromise = new Promise((resolve, reject) => {
     setTimeout(() => resolve('Done!'), 1000);
   });

   myPromise.then(result => console.log(result)); // Done!
   ```

10. **Symbol**
    ```javascript
    const sym1 = Symbol('description');
    const sym2 = Symbol('description');
    console.log(sym1 === sym2); // false
    ```

11. **Iterators and Generators**
    ```javascript
    function* generator() {
      yield 1;
      yield 2;
      yield 3;
    }
    const gen = generator();
    console.log(gen.next().value); // 1
    console.log(gen.next().value); // 2
    ```

12. **Map and Set**
    - **Map**:
      ```javascript
      const map = new Map();
      map.set('key1', 'value1');
      console.log(map.get('key1')); // value1
      ```
    - **Set**:
      ```javascript
      const set = new Set([1, 2, 3]);
      set.add(4);
      console.log(set.has(2)); // true
      ```

13. **WeakMap and WeakSet**
    - **WeakMap**:
      ```javascript
      const weakMap = new WeakMap();
      const obj = {};
      weakMap.set(obj, 'value');
      console.log(weakMap.get(obj)); // value
      ```
    - **WeakSet**:
      ```javascript
      const weakSet = new WeakSet();
      const obj = {};
      weakSet.add(obj);
      console.log(weakSet.has(obj)); // true
      ```

14. **Enhanced Object Literals**
    ```javascript
    const name = 'Alice';
    const person = {
      name,
      greet() {
        return `Hello, ${this.name}!`;
      }
    };
    console.log(person.greet()); // Hello, Alice!
    ```

15. **Object.assign()**
    ```javascript
    const target = { a: 1 };
    const source = { b: 2 };
    Object.assign(target, source);
    console.log(target); // { a: 1, b: 2 }
    ```

16. **String Methods**
    ```javascript
    const str = 'Hello, World!';
    console.log(str.includes('World')); // true
    console.log(str.startsWith('Hello')); // true
    console.log(str.endsWith('!')); // true
    ```

17. **Number Methods**
    ```javascript
    console.log(Number.isNaN(NaN)); // true
    console.log(Number.isFinite(123)); // true
    ```

18. **Math Methods**
    ```javascript
    console.log(Math.pow(2, 3)); // 8
    console.log(Math.trunc(4.9)); // 4
    ```

19. **For…of Loop**
    ```javascript
    const iterable = [10, 20, 30];
    for (const value of iterable) {
      console.log(value); // 10, 20, 30
    }
    ```

20. **Tagged Templates**
    ```javascript
    function tag(strings, ...values) {
      return strings.reduce((acc, str, i) => acc + str + (values[i] || ''), '');
    }
    const name = 'World';
    const message = tag`Hello, ${name}!`;
    console.log(message); // Hello, World!
    ```

These examples demonstrate how each ES6 feature can be used in practice.