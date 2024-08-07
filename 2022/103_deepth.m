=========================================================================


Q1. Is javascript a dynamically typed language or a statically typed language ?

Javascript is a dynamically typed language.
It means all type checks are done at run time ( When program is executing )
So, we can just assign anything to the variable and it works fine.

  let a;
  a = 0;
  console.log(a) // 0
  a = "Hello"
  console.log(a) // "Hello"

=========================================================================



Q2. What are the different datatypes in javascript ? (Most asked)
Primitive datatypes:
String
number
boolean
null
undefined
Bigint
symbol
Non-Primitive datatypes:
Array
Object
Date


=========================================================================


Q3. What is Hoisting in javascript ? (Most asked)

In other scripting/server side languages, variables or functions must be declared before using it.

In javascript, variables and functions can be used before declaring it.
 The javascript compiler moves all the declarations of variables and functions on top. 
 so there will not be any error. This is called hoisting.

👉Interview Tip: Mention buzz word 'temporal dead zone' for let & const in above answer so that interviewer will ask What is temporal dead zone. 😉

=========================================================================


Q4. What are the various things hoisted in javascript ?

  Function declarations: Fully hoisted.
  var - Hoisted
  Arrow functions: Not hoisted
  Anonymous Function expressions: Not hoisted
  let and const - Hoisted but not initialized. (Temporal dead zone).
  class declarations - Hoisted but not initialized.



Good Reference: https://stackabuse.com/hoisting-in-javascript/



=========================================================================

Q5. What is temporal dead zone ?
It is a specific time period in the execution of javascript code where the variables declared with let and const exists but cannot be accessed until the value is assigned.
Any attempt to access them result in reference errors.

  function somemethod() {
    console.log(counter1); // undefined
    console.log(counter2); // ReferenceError
    var counter1 = 1;
    let counter2 = 2;
  }


=========================================================================
       
Q6. What are the differences let, var and const ? (Most asked)

Scope:
Variables declared with var are function scoped.( available through out the function where its declared ) or global scoped( if defined outside the function ).
Variables declared with let and const are block scoped.

Reassignment:
var and let can be reassigned.
const cannot be reassigned.

Hoisting:
var gets hoisted and initialized with undefined.
let and const - gets hoisted to the top of the scope but does not get assigned any value.(temporal dead zone)


=========================================================================


Q7. List out some key features of ES6 ? (Most asked)
Arrow functions
Let and Const declarations.
Destructuring assignment
Default parameters
Template literals
Spread and Rest operators
Promises
Classes
Modules
Map, Set, Weakmap, Weakset
👉 Interview Tip: Here try to explain definations (provided in below questions) for these features so that you can kill 2-3 min of interview time 😉


=========================================================================

Q8. What are limitations of arrow functions in javascript ?

Arrow functions are introduced in ES6. They are simple and shorter way to write functions in javascript.
Arrow functions cannot be accessed before initialization
Arrow function does not have access to arguments object
Arrow function does not have their own this. Instead, they inherit this from the surrounding code at the time the function is defined.
Arrow functions cannot be used as constructors. Using them with the 𝙣𝙚𝙬 keyword to create instances throws a TypeError.
Arrow functions cannot be used as generator functions.
👉 Note: Arrow functions + this combination questions will be asked here. Please explore on this combinations.


=========================================================================

Q9. What’s the spread operator in javascript ?
Spread operator is used to spread or expand the elements of an iterable like array or string into individual elements.
Uses:
Concatenating arrays.

  let x = [1,2];
  let y = [3,4];

  let z = […x,…y]   ⇒⇒ 1,2,3,4
          
Copying arrays or objects.

  let a = […x] // 1,2
          
Passing array of values as individual arguments to a function.

  function createExample(arg1,arg2){
    console.log(arg1,arg2);
  }

  createExample(…a)
          
👉 Interview Tip: Practice the above examples mentioned and showcase them in interviews to make interviewer think that you are a practical person. 😉


=========================================================================

Q10. What is rest operator in javascript ?
Rest operator is used to condense multiple elements into single array or object.
This is useful when we dont know how many parameters a function may receive and you want to capture all of them as an array.

  function Example(...args){
    console.log(args)
  }

  Example(1,2,3,4);
          
Q11. What is destructuring ?
It is introduced in Es6.
It allows us to assign the object properties and array values to distinct variables.

  const user = {
    "age": 10,
    "name": "Saikrishna"
  }

  const {age,name} = user;
  console.log(age,name) // 10,"Saikrishna"
          

  const [a,b] = [1,2];
  console.log(a,b) // 1,2

  =========================================================================

          
Q12. What are the differences between Map and Set ?


### Map
Map is the collection of key value pairs
Map is two dimensional
new Map([iterable]) – creates the map, with optional iterable (e.g. array) of [key,value] pairs for initialization.
map.set(key, value) – stores the value by the key, returns the map itself
map.get(key) – returns the value by the key, undefined if key doesn’t exist in map
map.has(key) – returns true if the key exists, false otherwise.
map.delete(key) – removes the element by the key, returns true if key existed at the moment of the call, otherwise false.
map.clear() – removes everything from the map.
map.size – returns the current element count.

  let data = new Map();
  data.set("name","saikrishna");
  data.set("id","1");
  for(let item of data){
    console.log(item)
  }

  O/P
  ["name","saikrishna"]
  ["id","1"]



### Set
Set is a collection of unique values
Set is one dimensional
new Set([iterable]) – creates the set, and if an iterable object is provided (usually an array), copies values from it into the set.
set.add(value) – adds a value, returns the set itself
set.delete(value) – removes the value, returns true if value existed at the moment of the call, otherwise false.
set.has(value) – returns true if the value exists in the set, otherwise false.
set.clear() – removes everything from the set.
set.size – is the elements count.

 let data = new Set();
  data.add(1);
  data.add(”saikrishna”);
  for(let item of data){
    console.log(item)
  }

  O/P
  1
  Saikrishna
          
=========================================================================


Q13. What are modules in javascript ?
Modules allows us to break down the large piece of code into smaller parts.
Modules helps us to write more reusable and maintenable code.
Modules can be imported and exported using import and export statements.
Q14. What is the difference between 'Pass by Value' and 'Pass by Reference'?
In JavaScript, whenever a function is called, the arguments can be passed in two ways, either pass by value or pass by reference.
Primitive datatypes such as string, number,boolean,null and undefined are passed by value.
Non -primitive datatypes such as object,arrays or functions are passed by reference.
In Pass by value, parameters passed as an arguments creates their own copy. So any changes made inside the function are made to the copied value so it will not affect the original value.

  // Pass by value example
  let num = 10;

  function changeNum(value) {
      value = 20;
      console.log(value);  // Output: 20
  }

  changeNum(num);
  console.log(num);  // Output: 10          
In Pass by reference, parameters passed as an arguments does not creates their own copy. so any changes made inside the function will affect the original value.

  // Pass by reference example
  let arr = [1, 2, 3];

  function addToArr(value) {
      value.push(4);
      console.log(value);  // Output: [1, 2, 3, 4]
  }

  addToArr(arr);
  console.log(arr);  // Output: [1, 2, 3, 4]

  =========================================================================

            
Q15. What is the difference between map and filter ? (Frequently asked)

Both map and filter are useful in JavaScript when working with an arrays.
map transforms each element of an array and creates a new array which contains the transformed elements.
 whereas filter will creates a new array with only those elements which satisfies the specified condition.

 =========================================================================

Q16. What is the difference between map() and forEach() (Frequently asked)
map method is used to transform the elements of an array. Whereas forEach method is used to loop through the elements of an array.
map method will return a new array with the transformed values. forEach method does not return a new array.
map method can be used with other array methods like filter method. whereas forEach method cannot be used with other array methods as it does not return any array.

=========================================================================


Q17. What is the difference between for-in and for-of ?
Both for-in and for-of are used to iterate over the datastructure.
for-in:
for-in iterates over the enumerable property keys of an object.
for-of:
for-of is used to iterate over the values of an iterable object.
Examples of iterable objects are array,string,nodelists etc. (for of on object returns error)

=========================================================================

Q18. What is difference between find vs findIndex ?
find:
It will return the first element of array that passes specified condition.

  function findMethod(){
  let arr = [{id:1,name:"sai"},{id:2,name:"krishna"}];
  let data = arr.find(x=> x.id==2)
  console.log(data)
  }

  findMethod()

  Output:
  {id:2,name:"krishna"}
          
findIndex:
It will return the index of first element of an array that passes the specified condition.

  function findMethod(){
  let arr = [{id:1,name:"sai"},{id:2,name:"krishna"}];
  let data = arr.findIndex(x=> x.id==2)
  console.log(data)
  }

  findMethod()

  Output:
  2
          
 =========================================================================

Q19. What is the difference between Pure and Impure functions?
Pure Functions:
Pure functions are the functions which will return same output for same arguments passed to the function.
This will not have any side effects.
It does not modify any non local state.

function greeting(name) {
  return 'Hello $ {name}';
}
console.log(greeting("Saikrishna Nangunuri"));
          
Impure Functions:
Impure functions are the functions which will return inconsistent output for same arguments passed to the function.
This will have side effects.
This will modify non local state.

  let message = "good morning";
  function greeting1(name) {
    return 'Hello $ {name} , $ {message}';
  }
  console.log(greeting1("Saikrishna Nangunuri"));
          
Good Reference: https://www.scaler.com/topics/pure-function-in-javascript/


 =========================================================================

Q20. What are the differences between call(), apply() and bind() ? (Frequently asked)
Call method will invoke the function immediately with the given this value and allows us to pass the arguments one by one with comma separator.
Apply method will invoke the function immediately with given this value and allows us to pass the arguments as an array.
Bind method will return a new function with the given this value and arguments which can be invoked later.

  let name1 = {
    firstName: "Saikrishna",
    lastName: "Nangunuri"
  }

  let name2 = {
    firstName: "Learn",
    lastName: "depth"
  }

  const printName = function(thirdParam){
    console.log(this.firstName,thirdParam)
  }

  printName.call(name1,"Call Hello");
  printName.call(name2,"Call Hello");
  printName.apply(name2,[Apply Hello])
          
The only difference between call and apply is that syntax of how we pass the arguments.
bind: This gives us a copy which can be invoked or executed later rather than directly invoking it whereever we are writing this line of code.
We can use bind() for events like onClick where you dont know when they will be fired but you know the desired context.

  let name1 = {
    firstName: "Saikrishna",
    lastName: "Nangunuri"
  }

  let name2 = {
    firstName: "Learn",
    lastName: "depth"
  }

  const printName = function(thirdParam){
    console.log(this.firstName,thirdParam)
  }

  let bindPrintName = printName.bind(name1,"Iam from the bind method");
  bindPrintName()
          

  =========================================================================

Q21. What are the different ways to create object in javascript ? (Most asked)
Object literal :

  let userDetails = {
    name: "Saikrishna",
    city: "Hyderabad"
  }
          
Object constructor :

  let userDetails = new Object();
  userDetails.name = "Saikrishna";
  userDetails.city = "Hyderabad";
          
Object.Create() :
This is used when we want to inherit properties from an existing object while creating a new object.

  let animal = {
    name: "Animal name"
  }

  let cat = Object.create(animal);
          
Object.assign() :
This is used when we want to include properties from multiple other objects into new object we are creating.

  let lesson = {
    lessonName: "Data structures"
  };

  let teacher= {
    teacher: "Saikrishna"
  };

  let course = Object.assign({},lesson,teacher);

  =========================================================================

Q22. Whats the difference between Object.keys,values and entries ?
Object.keys(): This will return the array of keys
Object.values(): This will return the array of values
Object.entries(): This will return array of [key,value] pairs. (Practice example for this - this might be asked)

  let data = {
    name: "Sai",
    lang: "English"
  };

  Object.keys(data)  // ["name","lang"]
  Object.values(data) // ["Sai","english"]
  Object.entries(data) // [["name","Sai"],["lang","English"]]
          
Q23. Whats the difference between Object.freeze() vs Object.seal()
Object.freeze:
Will make the object immutable ( prevents the addition of new propeties and prevents modification of existing properties)

  let data = {
    a : 10
  };

  Object.freeze(data);
  data.a= 20;
  data.c = 30;

  console.log(data) 

  output: {
    a: 10
  }
          
Object.Seal():
Will prevent the addition of new properties but we can modify existing properties.

  let data = {
    a : 10
  };

  Object.seal(data);
  data.a = 20;
  data.c = 30;

  console.log(data)

  Output: 
  data: {
    a: 20
  }

    =========================================================================
           
Q24. What is a polyfill in javascript ?
👉 **Interview Tip:** If polyfill is asked, then 99% they will ask you to write a polyfill. So practice atleast 2-3 polyfills (map,foreach compulsary)
A polyfill is a piece of code which provides the modern functionality to the older browsers that does not natively support it.
Polyfill for foreach:

  let data = ["sai","krishna"];

  data.forEach((item,i)=>{
    console.log(item,i)
  })

  Array.prototype.forEach((callback)=>{
    for(let i=0;i<=this.length-1;i++){
      callback(this[i],i)
    }
  })
          
Polyfill for map:

  
let data = [1,2,3,4];

let output = data.map((item, ix)=>{
  return '$ {item}_hello'
})

Array.prototype.map=((callback)=>{
  let temp = [];
  for(let i=0;i<=this.length-1;i++){
    temp.push(callback(this[i]))
  }
  return temp;
})

console.log(output)
          
Good Reference: https://dev.to/umerjaved178/polyfills-for-foreach-map-filter-reduce-in-javascript-1h13
Q25. What is prototype in javascript ?
If we want to add properties at later stage to a function which can be accessible across all the instances. Then we will be using prototype.

  function Student(){
		this.name = "Saikrishna",
		this.exp= "8"
  }

  Student.prototype.company = "Hexagon"

  let std1 = new Student();
  std1.exp = "9"

  let std2 = new Student();
  std2.exp = "10"

  console.log(std1);
  console.log(std2)
          
Good Reference: https://www.tutorialsteacher.com/javascript/prototype-in-javascript
Q26. What is generator function in javascript ?
A generator function is a function which can be paused and resumed at any point during execution.
They are defined by using function* and it contains one or more yield expressions.
The main method of generator is next(). when called, it runs the execution until the nearest yield.
It returns an object which contains 2 properties. i.e., done and value.
done: the yielded value
value: true if function code has finished. else false.


  function* generatorFunction() {
    yield 1;
    yield 2;
    yield 3;
    return 4
  }
  
  const generator = generatorFunction();
  console.log(generator.next()); // Output: { value: 1, done: false }
  console.log(generator.next()); // Output: { value: 2, done: false }
  console.log(generator.next()); // Output: { value: 3, done: false }
  console.log(generator.next()); // Output: { value: 4, done: true }
          
Q27. What is IIFE ?
IIFE means immediately invoked function expression.
functions which are executed immediately once they are mounted to the stack is called iife.
They does not require any explicit call to invoke the function.
Good Reference: https://www.geeksforgeeks.org/immediately-invoked-function-expressions-iife-in-javascript/
Good Reference: https://www.tutorialsteacher.com/javascript/immediately-invoked-function-expression-iife

  (function(){
    console.log("2222")
  })()
          
Q28. What is CORS ? (Most asked)
👉 **Interview Tip:** This defination is more than enough so prepare this below answer well.
CORS means cross origin resource sharing.
It is a security feature that allows the webapplications from one domain to request the resources like Api’s/scripts from another domain.
cors works by adding specific http headers to control which origins have access to the resources and under what conditions.
Good Reference: https://dev.to/lydiahallie/cs-visualized-cors-5b8h
Q29. What are the difference between typescript and javascript ?
Typescript is the superset of javascript and has all the object oriented features.
Javascript is a dynamically typed language whereas typescript is a statically typed language.
Typescript is better suited for large scale applications where as javascript is suited for small scale applications.
Typescript points out the compilation errors at the time of development. Because of this, getting runtime errors is less likely.
Typescript supports interfaces whereas javascript does not.
Functions have optional parameters in typescript whereas in javascript does not have it.
Typescript takes longer time to compile code.
👉 **Interview Tip:** If your interview contains typescript then this is a 99% dam sure question. Prepare these differences blindly.
Q30. What is authentication vs authorization ? (Most asked)
Authentication:
Its the process of verifying who the user is.
Authorization:
Its the process of verifying what they have access to. What files and data user has access to.
👉 **Interview Tip:** For this question, learn **jwt token mechanism** and tell that you have implemented this in your project. This helps a lot.This kills atleast 3-4 min of interview time 😉
Good Reference: https://www.youtube.com/watch?v=7Q17ubqLfaM
Q31. What are the differences between null and undefined ?
Null:
If we assign null to a variable, it means it will not have any value
Undefined:
means the variable has been declared but not assigned any value yet.
Q32. What is the difference between == and === in javascript ?
== will check for equality of values where as === willl check for equality as well as datatypes.
Q33. Slice vs Splice in javascript ? (Most helpful in problem solving)
Slice:
If we want to create an array that is subset of existing array with out changing the original array, then we will use slice.

  let arr = [1,2,3,4];
  let newArr = arr.slice(1,3);

  console.log(newArr) // [2,3]
          
Splice:
If we want to add/delete/replace the existing elements in the array, then we will use splice.
  
  let arr = [1,2,3,4,5,0,10];
  let newArr = arr.splice(2,4,8,9,6);
  // splice(startIndex,numberOfItemsToRemove,replaceElements)

  console.log(arr); //  [1,2,8,9,6,10]
  console.log(newArr); // [3,4,5,0]
          
Q34. What is setTimeOut in javascript ?
setTimeOut is used to call a function or evaluate an expression after a specific number of milliseconds.

  setTimeOut(function(){
  console.log("Prints Hello after 2 seconds")
  },2000);

  // Logs message after 2 seconds
          
👉 **Interview Tip:** Most asked in output based and problem solving so learn syntax more. Practice some examples.
Q35. What is setInterval in javascript ?
setInterval method is used to call a function or evaluate an expression at specific intervals.

  setInterval(function(){
      console.log("Prints Hello after every 2 seconds");
  },2000);
          
👉 **Interview Tip:** Most asked in output based and problem solving so learn syntax more. Practice some examples.
Q36. What are Promises in javascript ?
👉 **Interview Tip:** When this is asked cover all below points so that he will not ask any other question on promises 😈.
Promise is an object which represents the eventual completion or failure of an asynchronous operation in javascript.
At any point of time, promise will be in any of these below states.,
Fulfilled: Action related to promise is succeded.
Rejected: Action related to the promise is failed.
Pending: Promise is neither fulfilled nor rejected
Settled: Promise has been fulfilled or rejected.
Promise can be consumed by registering the functions using .then() and .catch() methods.
Promise constructor:
will take one argument which is a callback function. This callback function takes 2 arguments resolve and reject.
If performed operations inside callback function wents well then we will call resolve() and if does not go well then we will call reject()

  let promise = new Promise(function(resolve,reject){
    const x = "Saikrishna";
    const y = "Saikrishna";
    
    if(x === y){
      resolve("Valid")
    } else{
      let err = new Error("Invalid")
      reject(err)
    }
  })

  promise.then((response)=>{
      console.log("success",response)
  }).catch((err)=>{
      console.log("failed",err)
  })
          
Q37. What are the differences between Promise.all, allSettled, any, race ?
Promise.all:
Will wait for all of the promises to resolve or any one of the promise reject.
Promise.allSettled:
Will wait for all the promises to settle (either fulfilled or rejected).
Promise.any:
Will return if any one of the promise fulfills or rejects when all the promises are rejected.
Promise.race:
Will return as soon as when any one of the promise is settled.
Good Reference: https://medium.com/@log2jeet24/javascript-different-types-of-promise-object-methods-to-handle-the-asynchronous-call-fc93d1506574
👉 **Interview Tip:** practice some examples on this concepts. This is a practical question. You can expect some scenario based questions from interviewer on this concept so prepare well from above link
Q38. What is a callstack in javascript ?
Callstack will maintain the order of execution of execution contexts.
Q39. What is a closure ? (Most asked in all the interviews 99% chance)
Defination: A function along with its outer environment together forms a closure
Each and every function in javascript has access to its outer lexical environment means access to the variables and functions present in the environments of its parents
Even when this function is executed in some outer scope(not in original scope) it still remembers the outer lexical environment where it was originally present in the code.

      
  function Outer(){
      var a = 10;
      function Inner(){
        console.log(a);
      }
      return Inner;
  }

  var Close = Outer();
  Close();
          
Q40. What are callbacks in javascript ?
A callback is a function which is passed as an argument to another function which can be executed later in the code.
Usecases:
setTimeOut
Higher order functions ( Like map,filter,forEach ).
Handling events ( Like click/key press events ).
Handling asynchronous operations ( Like reading files, making Http requests ).

  function Print(){
      console.log("Print method");
  }

  function Hello(Print){
      console.log("Hello method");
      Print();
  }

  Hello(Print);

  Output:
  Hello method
  Print method  
          
Q41. What are Higher Order Functions in javascript ?
A function which takes another function as an argument or returns a function as an output.
Advantages:
callback functions
Asynchronous programming ( functions like setTimeOut,setInterval often involves HOF. they allow to work with asynchronous code more effectively. )
Abstraction
Code reusability
Encapsulation
Concise and readable code
Q42. What is the main difference between Local Storage and Session storage ? (Most asked)
Local storage and session storage are two ways of storing data using key value pairs in web browsers.
LocalStorage is the same as SessionStorage but it persists the data even when the browser is closed and reopened and on reload(i.e it has no expiration time) whereas in sessionStorage data gets cleared when the page session ends.
Both provides same methods,
setItem(key, value) – store key/value pair.
getItem(key) – get the value by key.
removeItem(key) – remove the key with its value.
clear() – delete everything.
key(index) – get the key on a given position.
length – the number of stored items.
Good Reference: https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API#concepts_and_usage


Q43. What is the difference between Indexeddb and sessionstorage ?
IndexedDb:
It is used for storing large amount of structured data.
It uses object oriented storage model.
Persist data beyond the duration of page session.
SessionStorage:
Limited storage, around 5mb of data.
Simple key-value storage.
Available only for the duration of page session.
Q44. Possible followup questions on local storage :
👉 Interview Tip: When asked about local storage 100% compulsary they will confuse you with practical questions.😖😖
All the scenarios are covered here so 100% sure nothing more than this will be asked. 😊😊
𝐈 𝐜𝐫𝐞𝐚𝐭𝐞𝐝 𝐚 𝐥𝐨𝐜𝐚𝐥𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐚𝐧𝐝 𝐜𝐥𝐨𝐬𝐞𝐝 𝐭𝐡𝐞 𝐛𝐫𝐨𝐰𝐬𝐞𝐫 𝐚𝐧𝐝 𝐫𝐞𝐩𝐨𝐞𝐧𝐞𝐝 𝐢𝐭. 𝐖𝐢𝐥𝐥 𝐥𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐩𝐞𝐫𝐬𝐢𝐬𝐭𝐬 ?
Yes local storage data persists even when i close and reopen the browser
𝐈 𝐰𝐚𝐧𝐭 𝐭𝐨 𝐚𝐜𝐜𝐞𝐬𝐬 𝐋𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐢𝐧 𝐚𝐧𝐨𝐭𝐡𝐞𝐫 𝐭𝐚𝐛 𝐨𝐟 𝐬𝐚𝐦𝐞 𝐛𝐫𝐨𝐰𝐬𝐞𝐫 𝐢𝐬 𝐢𝐭 𝐩𝐨𝐬𝐬𝐢𝐛𝐥𝐞 ?
Yes we can access local storage data in another tab as well.
𝐈 𝐫𝐞𝐥𝐨𝐚𝐝𝐞𝐝 𝐭𝐡𝐞 𝐩𝐚𝐠𝐞 𝐚𝐟𝐭𝐞𝐫 𝐜𝐫𝐞𝐚𝐭𝐢𝐧𝐠 𝐥𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞. 𝐖𝐢𝐥𝐥 𝐢𝐭 𝐩𝐞𝐫𝐬𝐢𝐬𝐭𝐬 ?
Yes local storage data persists on page reload.
𝐈𝐟 𝐢 𝐨𝐩𝐞𝐧 𝐦𝐮𝐥𝐭𝐢𝐩𝐥𝐞 𝐭𝐚𝐛𝐬 𝐰𝐢𝐭𝐡 𝐬𝐚𝐦𝐞 𝐮𝐫𝐥 𝐡𝐨𝐰 𝐥𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐛𝐞𝐡𝐚𝐯𝐞𝐬 ?
I can access localstorage data in multiple tabs if its same url
𝐈𝐟 𝐢 𝐨𝐩𝐞𝐧 𝐦𝐮𝐥𝐭𝐢𝐩𝐥𝐞 𝐰𝐢𝐧𝐝𝐨𝐰𝐬 𝐰𝐢𝐭𝐡 𝐬𝐚𝐦𝐞 𝐮𝐫𝐥 𝐡𝐨𝐰 𝐥𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐛𝐞𝐡𝐚𝐯𝐞𝐬
I can access local storage data even for different windows with same url.
𝐖𝐡𝐞𝐧 𝐥𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐰𝐢𝐥𝐥 𝐛𝐞 𝐫𝐞𝐦𝐨𝐯𝐞𝐝 ?
It stays indefnitely until its deleted manually by the user.
𝐈𝐬 𝐋𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐬𝐲𝐧𝐜𝐡𝐫𝐨𝐧𝐨𝐮𝐬 𝐨𝐫 𝐚𝐬𝐲𝐧𝐜𝐡𝐫𝐨𝐧𝐨𝐮𝐬 ?
Localstorage is synchronous. If i perform operations on local storage, It blocks the execution of other javascript code until the current operation is completed.
𝐈 𝐰𝐚𝐧𝐭 𝐚𝐬𝐲𝐧𝐜𝐡𝐫𝐨𝐧𝐨𝐮𝐬 𝐨𝐩𝐞𝐫𝐚𝐭𝐢𝐨𝐧𝐬 𝐚𝐧𝐝 𝐥𝐚𝐫𝐠𝐞 𝐝𝐚𝐭𝐚 𝐬𝐞𝐭𝐬 𝐭𝐨 𝐛𝐞 𝐬𝐭𝐨𝐫𝐞𝐝 𝐭𝐡𝐞𝐧 𝐰𝐡𝐚𝐭 𝐲𝐨𝐮 𝐰𝐢𝐥𝐥 𝐬𝐮𝐠𝐠𝐞𝐬𝐭 ?👉 Remember this question )
I can go with Indexeddb where asynchronous operations are supported and we can work with large data sets.
𝐖𝐡𝐚𝐭 𝐢𝐬 𝐭𝐡𝐞 𝐦𝐚𝐱 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐥𝐢𝐦𝐢𝐭 𝐨𝐟 𝐥𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 ?
We can store max of 5mb.
𝐈 𝐰𝐢𝐥𝐥 𝐭𝐫𝐲 𝐭𝐨 𝐬𝐭𝐨𝐫𝐞 𝐥𝐞𝐭𝐬 𝐬𝐚𝐲 𝐚𝐧 𝐢𝐦𝐚𝐠𝐞 𝐨𝐟 𝐬𝐢𝐳𝐞 𝐦𝐨𝐫𝐞 𝐭𝐡𝐚𝐧 𝟓𝐦𝐛 𝐢𝐧 𝐥𝐨𝐜𝐚𝐥𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐭𝐡𝐞𝐧 𝐰𝐡𝐚𝐭 𝐡𝐚𝐩𝐩𝐞𝐧𝐬 ?
It will throw QuotaExceededException if it exceeds the limit.
𝐖𝐡𝐚𝐭 𝐈𝐟 𝐈 𝐭𝐮𝐫𝐧 𝐨𝐟𝐟 𝐦𝐲 𝐥𝐚𝐩𝐭𝐨𝐩 𝐚𝐧𝐝 𝐫𝐞𝐨𝐩𝐞𝐧 𝐭𝐡𝐞 𝐛𝐫𝐨𝐰𝐬𝐞𝐫, 𝐰𝐢𝐥𝐥 𝐥𝐨𝐜𝐚𝐥 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐩𝐞𝐫𝐬𝐢𝐬𝐭𝐬 ?
Yes localstorage data still persists even if i shutdown my laptop and reopen the browser
Q45. Possible followup questions on session storage :
👉 Interview Tip: When asked about session storage 100% compulsary they will confuse you with practical questions.😖😖
All the scenarios are covered here so 100% sure nothing more than this will be asked. 😊😊
𝐈 𝐜𝐫𝐞𝐚𝐭𝐞𝐝 𝐚 𝐬𝐞𝐬𝐬𝐢𝐨𝐧𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐚𝐧𝐝 𝐜𝐥𝐨𝐬𝐞𝐝 𝐭𝐡𝐞 𝐛𝐫𝐨𝐰𝐬𝐞𝐫 𝐚𝐧𝐝 𝐫𝐞𝐩𝐨𝐞𝐧𝐞𝐝 𝐢𝐭 𝐚𝐧𝐝 𝐫𝐞𝐬𝐭𝐨𝐫𝐞𝐝 𝐭𝐚𝐛. 𝐖𝐢𝐥𝐥 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐩𝐞𝐫𝐬𝐢𝐬𝐭𝐬 ?
No session storage data does not persists on browser close & reopen.
𝐈 𝐜𝐫𝐞𝐚𝐭𝐞𝐝 𝐚 𝐬𝐞𝐬𝐬𝐢𝐨𝐧𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐚𝐧𝐝 𝐜𝐥𝐨𝐬𝐞𝐝 𝐭𝐡𝐞 𝐛𝐫𝐨𝐰𝐬𝐞𝐫 𝐚𝐧𝐝 𝐫𝐞𝐩𝐨𝐞𝐧𝐞𝐝 𝐢𝐭 𝐚𝐧𝐝 𝐫𝐞𝐬𝐭𝐨𝐫𝐞𝐝 𝐭𝐚𝐛. 𝐖𝐢𝐥𝐥 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐩𝐞𝐫𝐬𝐢𝐬𝐭𝐬 ?
No session storage data does not persists on browser close & reopen.
𝐂𝐚𝐧 𝐢 𝐚𝐜𝐜𝐞𝐬𝐬 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐢𝐧 𝐚𝐧𝐨𝐭𝐡𝐞𝐫 𝐭𝐚𝐛 𝐨𝐟 𝐬𝐚𝐦𝐞 𝐛𝐫𝐨𝐰𝐬𝐞𝐫 ?
No we cannot access session storage data of one tab in another tab.
𝐈 𝐫𝐞𝐥𝐨𝐚𝐝𝐞𝐝 𝐭𝐡𝐞 𝐩𝐚𝐠𝐞 𝐚𝐟𝐭𝐞𝐫 𝐜𝐫𝐞𝐚𝐭𝐢𝐧𝐠 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞. 𝐖𝐢𝐥𝐥 𝐢𝐭 𝐩𝐞𝐫𝐬𝐢𝐬𝐭𝐬 ?
Yes session storage data persists on page reload.
𝐈𝐟 𝐢 𝐨𝐩𝐞𝐧 𝐦𝐮𝐥𝐭𝐢𝐩𝐥𝐞 𝐭𝐚𝐛𝐬 𝐰𝐢𝐭𝐡 𝐬𝐚𝐦𝐞 𝐮𝐫𝐥 𝐡𝐨𝐰 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐛𝐞𝐡𝐚𝐯𝐞𝐬 ?
We cannot access session storage data in multiple tabs even if its same url
𝐈𝐟 𝐢 𝐨𝐩𝐞𝐧 𝐦𝐮𝐥𝐭𝐢𝐩𝐥𝐞 𝐰𝐢𝐧𝐝𝐨𝐰𝐬 𝐰𝐢𝐭𝐡 𝐬𝐚𝐦𝐞 𝐮𝐫𝐥 𝐡𝐨𝐰 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐛𝐞𝐡𝐚𝐯𝐞𝐬 ?
We cannot access session storage data in multiple windows even if its same url
𝐖𝐡𝐞𝐧 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐝𝐚𝐭𝐚 𝐰𝐢𝐥𝐥 𝐛𝐞 𝐫𝐞𝐦𝐨𝐯𝐞𝐝 ?
once tab closes or session ends session storage data will be removed.
𝐈𝐬 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐬𝐲𝐧𝐜𝐡𝐫𝐨𝐧𝐨𝐮𝐬 𝐨𝐫 𝐚𝐬𝐲𝐧𝐜𝐡𝐫𝐨𝐧𝐨𝐮𝐬 ?
Session storage is synchronous. If i perform operations on session storage, It blocks the execution of other javascript code until the current operation is completed.
𝐈 𝐰𝐚𝐧𝐭 𝐚𝐬𝐲𝐧𝐜𝐡𝐫𝐨𝐧𝐨𝐮𝐬 𝐨𝐩𝐞𝐫𝐚𝐭𝐢𝐨𝐧𝐬 𝐚𝐧𝐝 𝐥𝐚𝐫𝐠𝐞 𝐝𝐚𝐭𝐚 𝐬𝐞𝐭𝐬 𝐭𝐨 𝐛𝐞 𝐬𝐭𝐨𝐫𝐞𝐝 𝐭𝐡𝐞𝐧 𝐰𝐡𝐚𝐭 𝐲𝐨𝐮 𝐰𝐢𝐥𝐥 𝐬𝐮𝐠𝐠𝐞𝐬𝐭 ? 👉 Remember this question )
I can go with Indexeddb where asynchronous operations are supported and we can work with large data sets.
𝐖𝐡𝐚𝐭 𝐢𝐬 𝐭𝐡𝐞 𝐦𝐚𝐱 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐥𝐢𝐦𝐢𝐭 𝐨𝐟 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐬𝐭𝐨𝐫𝐚𝐠𝐞 ?
We can store max of 5mb.
𝐈 𝐰𝐢𝐥𝐥 𝐭𝐫𝐲 𝐭𝐨 𝐬𝐭𝐨𝐫𝐞 𝐥𝐞𝐭𝐬 𝐬𝐚𝐲 𝐚𝐧 𝐢𝐦𝐚𝐠𝐞 𝐨𝐟 𝐬𝐢𝐳𝐞 𝐦𝐨𝐫𝐞 𝐭𝐡𝐚𝐧 𝟓𝐦𝐛 𝐢𝐧 𝐥𝐨𝐜𝐚𝐥𝐬𝐭𝐨𝐫𝐚𝐠𝐞 𝐭𝐡𝐞𝐧 𝐰𝐡𝐚𝐭 𝐡𝐚𝐩𝐩𝐞𝐧𝐬 ?
It will throw QuotaExceededException if it exceeds the limit.
Q46. What are cookies ?
Cookies are used to store information about the user in the webpages.
Cookies are stored as key value pairs and hold 4kb of data.
When user logins to the application, server uses the set-cookie http header in the response to set a cookie with a unique session identifier. Next time when user makes the api requests, cookie will be sent in the http header by using which server will identify who the user is.
Eg:
document.cookie='username=John Doe; expires=Thu, 18 Dec 2013 12:00:00 UTC; path=/'
Good Reference: https://www.w3schools.com/js/js_cookies.asp
Q47. Interview questions on this keyword.
👉 Interview Tip:Asked frequently so all scenarios are covered here. Learn carefully. Thank me later 😇
𝐖𝐡𝐚𝐭 𝐢𝐬 𝐭𝐡𝐢𝐬 𝐢𝐧 𝐣𝐚𝐯𝐚𝐬𝐜𝐫𝐢𝐩𝐭 ?
this refers to the object that is currently executing the code.
𝐖𝐡𝐚𝐭 𝐢𝐬 𝐭𝐡𝐞 𝐯𝐚𝐥𝐮𝐞 𝐨𝐟 𝐭𝐡𝐢𝐬 𝐢𝐧 𝐠𝐥𝐨𝐛𝐚𝐥 𝐬𝐜𝐨𝐩𝐞 ?
Its a global object. its value can be global or window. It depends on where you are running javascript code.(like browser or node environment etc)
𝐈 𝐰𝐢𝐥𝐥 𝐮𝐬𝐞 𝐧𝐨𝐧 𝐬𝐭𝐫𝐢𝐜𝐭 𝐦𝐨𝐝𝐞. 𝐍𝐨𝐰 𝐢𝐟 𝐢 𝐮𝐬𝐞 𝐭𝐡𝐢𝐬 𝐢𝐧𝐬𝐢𝐝𝐞 𝐚 𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧, 𝐰𝐡𝐚𝐭 𝐰𝐢𝐥𝐥 𝐛𝐞 𝐭𝐡𝐞 𝐨𝐮𝐭𝐩𝐮𝐭 ?
Its a global object.
In non strict mode, when ever this keyword value is null or undefined, javascript will replace it’s value with global object.(Due to this substitution)
𝐈𝐧 𝐬𝐭𝐫𝐢𝐜𝐭 𝐦𝐨𝐝𝐞, 𝐖𝐡𝐚𝐭 𝐰𝐢𝐥𝐥 𝐭𝐡𝐞 𝐯𝐚𝐥𝐮𝐞 𝐨𝐟 𝐭𝐡𝐢𝐬 𝐢𝐧𝐬𝐢𝐝𝐞 𝐚 𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧 ?

  𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧 𝐱(){
    𝐜𝐨𝐧𝐬𝐨𝐥𝐞.𝐥𝐨𝐠(𝐭𝐡𝐢𝐬)
  }
          
In strict mode, the value of this will be undefined.
𝐍𝐨𝐰 𝐈𝐧 𝐬𝐭𝐫𝐢𝐜𝐭 𝐦𝐨𝐝𝐞, 𝐈𝐟 𝐢 𝐜𝐚𝐥𝐥 𝐚𝐛𝐨𝐯𝐞 𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧 𝐮𝐬𝐢𝐧𝐠 𝐰𝐢𝐧𝐝𝐨𝐰.𝐱() 𝐭𝐡𝐞𝐧 𝐰𝐡𝐚𝐭 𝐢𝐬 𝐭𝐡𝐞 𝐫𝐞𝐬𝐮𝐥𝐭 𝐨𝐟 𝐭𝐡𝐢𝐬 ?

  𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧 𝐱(){
    𝐜𝐨𝐧𝐬𝐨𝐥𝐞.𝐥𝐨𝐠(𝐭𝐡𝐢𝐬)
  }
  𝐰𝐢𝐧𝐝𝐨𝐰.𝐱()
  
          
It will log window object.
𝐖𝐡𝐚𝐭 𝐰𝐢𝐥𝐥 𝐛𝐞 𝐭𝐡𝐞 𝐯𝐚𝐥𝐮𝐞 𝐨𝐟 𝐭𝐡𝐢𝐬 𝐢𝐧𝐬𝐢𝐝𝐞 𝐨𝐛𝐣𝐞𝐜𝐭 𝐦𝐞𝐭𝐡𝐨𝐝 𝐛𝐞𝐥𝐨𝐰 ?

  𝐥𝐞𝐭 𝐨𝐛𝐣 = {
    𝐱:”𝐇𝐞𝐥𝐥𝐨”,
    𝐲: 𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧(){
      𝐜𝐨𝐧𝐬𝐨𝐥𝐞.𝐥𝐨𝐠(𝐭𝐡𝐢𝐬.𝐱)
    }
  }

  𝐨𝐛𝐣.𝐲()
          
It will print Hello. Because, When ever we are inside the method, the value of this keyword is the object where this method is present.
𝐖𝐡𝐚𝐭 𝐰𝐢𝐥𝐥 𝐛𝐞 𝐭𝐡𝐞 𝐭𝐡𝐢𝐬 𝐯𝐚𝐥𝐮𝐞 𝐢𝐟 𝐢𝐭'𝐬 𝐥𝐨𝐠𝐠𝐞𝐝 𝐢𝐧𝐬𝐢𝐝𝐞 𝐚𝐫𝐫𝐨𝐰 𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧 ?

  𝐥𝐞𝐭 𝐨𝐛𝐣 = {
    𝐱:”𝐇𝐞𝐥𝐥𝐨”,
    𝐲: ()=>{
      𝐜𝐨𝐧𝐬𝐨𝐥𝐞.𝐥𝐨𝐠(𝐭𝐡𝐢𝐬)
    }
  }

  𝐨𝐛𝐣.𝐲()
          
It will print window object.Because, Arrow function does not have their own this binding. they take the this value of their lexical environment where they are enclosed.
𝐖𝐡𝐚𝐭 𝐰𝐢𝐥𝐥 𝐛𝐞 𝐭𝐡𝐢𝐬 𝐯𝐚𝐥𝐮𝐞 𝐢𝐟 𝐢 𝐮𝐬𝐞 𝐢𝐧 𝐛𝐮𝐭𝐭𝐨𝐧 𝐞𝐥𝐞𝐦𝐞𝐧𝐭

  <𝐛𝐮𝐭𝐭𝐨𝐧 𝐨𝐧𝐜𝐥𝐢𝐜𝐤="𝐚𝐥𝐞𝐫𝐭(𝐭𝐡𝐢𝐬)">𝐜𝐥𝐢𝐜𝐤</𝐛𝐮𝐭𝐭𝐨𝐧>
          
It will display [object HTMLElement]
Q48. What are Interceptors ?
Interceptors allows us to modify the request or response before its sent to the server or received from the server.

  axios.interceptors.request.use((config)=>{
      if(longUrls.include(url)){
          config.timeout = 1000;
      }
      return config;
  }
      
  axios.interceptors.response.use((response)=>{
      return response;
  })
          
Q49. What is eval() ?
eval function evaluates javascript code represented as a string. The string can be javascript expression, variable, statement or a sequence of statements.
console.log(eval('1 + 2')); // 3
Q50. What is the difference between Shallow copy and deep copy ? (Most asked)
👉 Interview Tip: Give this example and explain that’s it.
Shallow copy:
A shallow copy creates a new object or array and copies the references of the original elements
Good Reference: https://www.linkedin.com/posts/saikrishnanangunuri_javascript-javascriptdeveloper-reactjs-activity-7211747675635900416-h9IB?utm_source=share&utm_medium=member_desktop

  let originalArray = [1, 2, [3, 4]];
  let shallowCopy = [...originalArray];

  shallowCopy[2][0] = 100;
  console.log(originalArray); // Output: [1, 2, [100, 4]]
          
Deep copy:
A deep copy creates a new object or array that has its own copies of the properties of the original object.

  let originalArray = [1, 2, [3, 4]];
  let deepCopy = JSON.parse(JSON.stringify(originalArray));
  deepCopy[2][0] = 100;
  console.log(originalArray); // Output: [1, 2, [3, 4]]

  using lodash:
  let array = _.cloneDeep(originalArray)
          
Q51. What are the difference between undeclared and undefined variables ?
undeclared:
These variables does not exist in the program and they are not declared.
If we try to read the value of undeclared variable then we will get a runtime error.
undefined:
These variables are declared in the program but are not assigned any value.
If we try to access the value of undefined variables, It will return undefined.
Q52. What is event bubbling ?
Event bubbling is a type of event propagation where the event first triggers on the innermost target element, and then successively triggers on the ancestors (parents) of the target element in the same nesting hierarchy till it reaches the outermost DOM element.

  <!DOCTYPE html>
  <html>
  <head>
    <title>Event Bubbling</title>
  </head>
  <body>
    <div id="div1" style="padding: 50px; border: 1px solid black;">
      Div 1
      <div id="div2" style="padding: 50px; border: 1px solid red;">
        Div 2
        <button id="button1">Click Me</button>
      </div>
    </div>

    <script>
      document.getElementById('div1').addEventListener('click', function() {
        console.log('Div 1 clicked');
      });

      document.getElementById('div2').addEventListener('click', function() {
        console.log('Div 2 clicked');
      });

      document.getElementById('button1').addEventListener('click', function(event) {
        console.log('Button clicked');
        // To stop the event from bubbling up
        event.stopPropagation();
      });
    </script>
  </body>
  </html>


   =========================================================================
         
Q53. What is event capturing ?
Event capturing is a type of event propagation where the event is first captured by the outermost element, and then successively triggers on the descendants (children) of the target element in the same nesting hierarchy till it reaches the innermost DOM element.
You can enable event capturing by passing true as the third argument to addEventListener.

  <!DOCTYPE html>
  <html>
  <head>
    <title>Event Capturing</title>
  </head>
  <body>
    <div id="div1" style="padding: 50px; border: 1px solid black;">
      Div 1
      <div id="div2" style="padding: 50px; border: 1px solid red;">
        Div 2
        <button id="button1">Click Me</button>
      </div>
    </div>

    <script>
      document.getElementById('div1').addEventListener('click', function() {
        console.log('Div 1 clicked');
      }, true);

      document.getElementById('div2').addEventListener('click', function() {
        console.log('Div 2 clicked');
      }, true);

      document.getElementById('button1').addEventListener('click', function(event) {
        console.log('Button clicked');
        // To stop the event from propagating further
        // event.stopPropagation();
      }, true);
    </script>
  </body>
  </html>
          
Q54. What are the various array methods in javascript ?
toString(): returns array as acomma separated string.
join(): same as toString but we can specify the separator. Eg: [”a”,”b”,”c”].join(”=”) // a=b=c
at(): returns element at specific index. Eg: [”ayan”,”saikrishna”].at(1)
pop(): removes the last element from an array.
push(): adds new element to array at the end.
shift(): removes the first element at the beginning and shifts all the elements to lower index.
unshift(): adds new element at beginning and moves other elements one index further.
concat(): creates new array by concatenating existing arrays.
copyWithin(): copies array element to another position Eg: [”a”,”b”,”c”].copyWithin(2,0)
flat(): creates a new array with all the sub array elements
fill(): will fill all the elements of an array from a start index ti an end index with a stati value.
Good Reference: https://www.w3schools.com/js/js_array_methods.asp

  =========================================================================

Q55. What are the differences between some and every in javascript ?
some(): will check if atleast one of the element in the array satisfies the specified condition. It returns true if any element passes the condition. else returns false.

  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const someGreaterThan10 = numbers.some(number => number > 10);
  console.log(someGreaterThan10); // true
          
every(): will check if all the elements of the array satisfies the specified condition. it return true if all the elements satisfies the condition, else returns false.

  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const everyGreaterThan10 = numbers.every(number => number > 10);
  console.log(everyGreaterThan10); // false
          
Q56. What are the different types of errors in javascript ?
Syntax errors: These are occured when code is not written according to the javascript syntax rules.

  Eg: let x=;
          
Reference errors: These occurs when we refer any variables or methods that does not exists.

  let val = y;//y does not exist

  function x(){
    data() // This method is not exists.
  }
          
Type errors: These errors occurs when operation is performed on the value of wrong datatype

  try {
    new Array(-1);
  } catch (e) {
    console.error(e); // RangeError: Invalid array length
  }

  Eg2:
  if (num < 30) throw new RangeError("Wrong number");
                  ^
  RangeError: Wrong number
          
Range errors: These errors occurs when the value is not present in allowed range.

  try {
    new Array(-1);
  } catch (e) {
    console.error(e); // RangeError: Invalid array length
  }

  Eg2:
  if (num < 30) throw new RangeError("Wrong number");
                  ^
  RangeError: Wrong number
          
Eval or Evaluation errors: These errors occurs in eval functions. Not commonly used in modern browsers.

  try {
    eval('eval("invalid code")');
  } catch (e) {
    console.error(e); // EvalError (in some older JavaScript versions)
  }
          
URI errors: These erros occurs when wrong characters used in URI functions

  console.log(decodeURI("https://www.educative.io/shoteditor")) // works fine
  console.log(decodeURI("%sdfk")); //throws error
  decodeURIComponent('%');
          
Q57. What is tree shaking in javascript ?
It is one of the optimization technique in javascript which removes the unused code from the bundle during the build process.
It is commonly used in bundling tools like Webpack and Rollup.
Advantages:
It reduces the bundle size by eleminating unused modules and functions.
Faster load time.
Performance will be improved.
Cleaner and maintainable codebases.
Q58. What is prototype inheritance in javascript ?
Prototype inheritance in javascript is the linking of prototypes of a parent object to a child object so that we can share and utilize the properties of a parent class using a child class.
The ES5 introduced two differnd methods such as Object.create() and Object.getPrototypeOf().

  let package = {
    version: "2.0",
  };
  let application = Object.create(package, {
    name: { value: "game" },
  }); // inherited from package
  console.log(application);
  console.log(Object.getPrototypeOf(application));
          
Good Reference: https://www.scaler.com/topics/javascript/prototype-inheritance-in-javascript/
Q59. What are the differences between fetch and axios ?
fetch is inbuilt webapi method present in most of the modern browsers where as axios is a third party library is built on top of XMLHttpRequest object.
axios performs automatic parsing of response data where as in fetch we need to manually parse the response data(eg: response.json()).
axios supports interceptors by using which we can modify the request or response before they are sent/received from the server.
axios prevents csrf (cross site request forgery)attacks.
Good Reference: https://apidog.com/blog/axios-vs-fetch/

  fetch:

  fetch(url)
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok ' + response.statusText);
    }
    return response.json();
  })
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error('There has been a problem with your fetch operation:', error);
  });
  
  axios:

  axios.get(url)
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error('There has been a problem with your axios operation:', error);
  });
          
   =========================================================================
         
Q60. Is javascript synchronous or asynchronous and single threaded or multithreaded ?
Javascript is a synchronous single threaded language.
 This means that it executes line by line in order and each line must finish executing before the next line starts.
However, javascript has can handle asynchronous operations using mechanisms like callbacks, promises and async/await. 
These mechanisms allows javascript to perform tasks such as network requests, file reading, setTimeout/setInterval without blocking the main thread.
These mechanisms allow JavaScript to delegate tasks to the browser and then continue executing other code while waiting for those tasks to complete. 
This asynchronous behavior gives the illusion of concurrency, even though JavaScript itself remains single-threaded.