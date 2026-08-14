
==============================================

### Interceptors

Interceptors are a powerful feature provided by HTTP client libraries such as Axios that allow us to intercept and manipulate HTTP requests or responses before they are handled by the application.

There are mainly two types of interceptors: request interceptors and response interceptors.

A request interceptor runs before the request is sent and can be used to add authentication tokens, modify headers, add common parameters, or log requests.

A response interceptor runs after a response is received and can be used to` transform response data, handle errors globally, log responses, or handle authentication issues such as 401 Unauthorized and token refresh`.

- In React.js applications:
  - Interceptors help us avoid repeating common API logic in every component.
  - They allow us to centralize request and response handling.
  - This makes the code clean, reusable, and maintainable.

Interceptors are not a native JavaScript or Fetch API feature; they are provided by libraries such as Axios. With Fetch, we would need to create our own wrapper to achieve similar behavior.

==========================================


Fetch API doesn't provide built-in interceptors like Axios. However, we can achieve similar functionality by creating a custom wrapper around fetch. In that wrapper, we can add logic before the request, such as adding authentication headers, and after the response, such as global error handling or token refresh."

==========================================


### Axios

* Axios is a third-party HTTP client library.
* `npm install axios` installation is required.
* Axios automatically parses JSON responses.
* Error checking is usually handled with `try/catch`.
* Built-in support for **request and response interceptors**.
* Simple timeout configuration.
* Common headers are easy to configure globally.
* Both Axios and Fetch are **Promise-based**, support **Async/Await**, and support **request cancellation**.

### Fetch

* Fetch is a **native Web API**.
* No installation is required.
* Fetch requires you to call `response.json()` to parse JSON responses.
* Error checking requires checking `response.ok` or `response.status`.
* No simple built-in timeout option; use `AbortController`.
* Common headers require manual configuration or a wrapper.
* Both Axios and Fetch are **Promise-based**, support **Async/Await**, and support **request cancellation**.

=============================================================================

### Use Fetch If:

- You want to avoid additional dependencies and rely on native browser APIs.
- Performance and bundle size are critical, especially in modern environments.
- You are comfortable handling request/response interception and additional error handling manually.

This format highlights the specific reasons and scenarios where Axios or Fetch would be preferred based on their capabilities and characteristics.


### Axios — Missing Points

* Axios supports creating **reusable Axios instances** with common configuration such as base URL and default settings.
* Axios can **automatically attach authentication tokens** to requests using request interceptors.
* Axios can handle **global response errors**, such as `401 Unauthorized`, using response interceptors.

### Fetch — Missing Points

* Fetch does **not have built-in Axios-style request and response interceptors**.
* Authentication tokens need to be **added manually** to request headers or handled through a custom wrapper.
* Fetch can be wrapped in a **custom reusable function** to centralize common API logic such as headers, authentication, and error handling.





================================================================================

Webpack

Webpack is a popular open-source module bundler for JavaScript applications.

It's primarily used in web development to bundle JavaScript files for usage in a browser,
It's managing dependencies and bundling various assets like JavaScript files, images,
and CSS into a single bundle,

Webpack's behavior is configured through a webpack.config.js file.
Plugins is used Webpack's functionality for tasks like optimization, asset management,
It's widely used in modern web development, often alongside frameworks like React, Vue.js, or Angular.



=========================================================================

# JavaScript Web Storage

JavaScript provides two types of Web Storage:

- `Session Storage (`sessionStorage`)`
- `Local Storage (`localStorage`)`

Both store data as `key-value pairs`, and `both can only store strings`. If you want to store objects or arrays, use `JSON.stringify()` while storing and `JSON.parse()` while retrieving.


# Session Storage (`sessionStorage`)

### Features

- `sessionStorage` stores data only for the current browser session
and is available only in the same browser tab that created it.

- Each tab has its own separate session storage, so the data is not shared across tabs.

- The stored data is automatically cleared when the tab or browser window is closed.

It stores data as key-value pairs and typically provides up to `5 MB` of storage, depending on the browser.


```js
sessionStorage.method(key, value);
```


# Local Storage (`localStorage`)

### Features

- Data is stored permanently until it is manually removed.
- Data remains available even after the browser is closed and reopened.
- Data is shared across all tabs and windows of the same origin (protocol, domain, and port).
- Different websites cannot access each other's local storage.
- Maximum storage is typically around `5–10 MB`, depending on the browser.
- Stores data as `key-value pairs`.
- Only strings can be stored directly.

```js
localStorage.method(key, value);
```
sessionStorage and localStorage use the same methods:

# Common Methods
1. `setItem(key, value)` = Adds or updates a value.
2. `getItem(key)` = Returns the stored value.
3. `removeItem(key)` = Removes a specific item.
4. `clear()` = Removes all stored items.
5. `key(index)` = Returns the key at the specified index.
6. `length` = Returns the number of stored items.

=========================================================================

## Important Notes


`localStorage` and `sessionStorage` can store `only string values`.

If we directly pass an object to `setItem()`, JavaScript converts the object into the string ``[object Object]``. When we retrieve that value, we also get ``[object Object]``, not the original object.

Therefore, if we want to store an object or array, we use `JSON.stringify()` to convert the object or array into a JSON string before storing it. When retrieving the data, we use `JSON.parse()` to convert the JSON string back into a JavaScript object or array.

`In simple terms:`

`Object → JSON.stringify() → String → Storage`

`String → JSON.parse() → Object`




- Both `sessionStorage` and `localStorage` store `only strings`.
- To store objects or arrays, use `JSON.stringify()`.
- To retrieve objects or arrays, use `JSON.parse()`.
- `getItem()` returns `null` if the key does not exist.
- Avoid storing sensitive information (such as passwords or tokens) in Web Storage because it is accessible through JavaScript.
- Storage is limited (typically 5–10 MB depending on the browser).



=========================================================================
### Bubbling and capturing

A) Bubbling

- Event Bubbling is the default behavior of an event in JavaScript

When an event occurs on a child element, it first runs on the target element and then propagates upward through its parent elements to the root (document).

B] capturing

- Event Capturing (also called the capture phase) is the opposite of bubbling. 

- when an event happen on element ,it first run the parent element of then move to downward of child element then lastly run handler

- The event starts from the outermost parent and travels down to the target element.

- Capturing is also called "trickling",

- stopPropagation prevents further propagation of the current event in the capturing and bubbling phases.


```javascript


document.getElementById("parent").addEventListener("click", () => {
  console.log("Parent clicked (capture)");
}, true);


- `true` = `Capturing phase`
- `false` = `Bubbling phase` (default)

```



---------------------------------------------------------------------------
- `stopPropagation()`

- event.stopPropagation() is a JavaScript method used to stop event propagation in the DOM.

- It can stop both event bubbling and event capturing.

- When an event occurs on a child element, it first runs on the target element and then propagates upward through its parent elements to the root (document).

- By calling event.stopPropagation() inside the child element's event handler,we can stop the event propagation from reaching parent elements.

```js
child.addEventListener("click", (event) => {
    event.stopPropagation();
    console.log("Child clicked");
  });
```

-------------------------------------------------------------------------


### `stopImmediatePropagation()`

event.stopImmediatePropagation() is a JavaScript method that used to stops the event propagating bubbling and capturing phase
and also stop any other event listeners attached to the same element 



=========================================================================

####

-preventDefault() is a JavaScript method that `prevents the browsers default action` that associated with an event .

- used to stop the default action associated with an event from occurring.

  - Example: Prevent a form from submitting.
  - Example: Prevent a link from navigating to a new page.
  - Example: Prevent a context menu from appearing.


=========================================================================


### Pure Functions
- *Deterministic*: Always return the `same output for the same input`.
- *No Side Effects*: Do not alter external state or rely on it.
- *Benefits*: Easier to understand, test, compose, and optimize (e.g., memoization).

*Example*:
javascript
function add(a, b) {
    return a + b;
}

console.log(add(2, 3)); // Always returns 5


### Impure Functions
- *Non-deterministic*: `different output for the same input`.
- *Side Effects*: Modify external state, perform I/O operations, etc.
- *Challenges*: Harder to reason about, test, and maintain.

*Example*:
javascript
let count = 0;

function increment() {
    count += 1;
    return count;
}

console.log(increment()); // Output depends on external `count` variable


### Summary
- *Pure functions*: Predictable, testable, and composable.
- *Impure functions*: Necessary for state changes and I/O operations but harder to manage.



=========================================================================

### Iterators

Iterators` are objects

with help of iterators we can access sequential elements in a collection one at a time 


-An iterator provides a next() method. Each time next() is called, it returns an object with two properties:

1. value – the current value in the sequence.
2. done – a boolean indicating whether the iteration is finished.
   - false → there are more values.
   - true → there are no more values.e


```js
const iterator = collection[Symbol.iterator]();
iterator.next();


#### Example of an Iterator:

const myArray = [1, 2, 3];
const iterator = myArray[Symbol.iterator]();

console.log(iterator.next()); // { value: 1, done: false }
console.log(iterator.next()); // { value: 2, done: false }
console.log(iterator.next()); // { value: 3, done: false }
console.log(iterator.next()); // { value: undefined, done: true }

javaScript uses the iterator protocol in features such as:

for...of
Spread syntax (...)
Array/string destructuring
Array.from()
Map and Set iteratio



====================================================================

### Generators

- `Generators` are special functions that can `pause their execution and   resume it later`. 
its means  control over the function's execution.

They are defined using the `function\- syntax` and use the `yield keyword to pause execution` and produce values one at a time.

normal function, which runs from start to finish in a single call,  bur generator function remembers its state between calls beacuse pause execution

The generator object provides the next() method. and it returns an object with two properties:

1] value: the yielded value.
2] done: true if the function code has finished, otherwise false.

#### Example of a Generator:

function\- simpleGenerator() {
yield 1;
yield 2;
yield 3;
}

const gen = simpleGenerator();

console.log(gen.next()); // { value: 1, done: false }
console.log(gen.next()); // { value: 2, done: false }
console.log(gen.next()); // { value: 3, done: false }
console.log(gen.next()); // { value: undefined, done: true }

1. `Pagination` — Fetch data page by page instead of loading everything at once
2. `Infinite Scrolling` — Generate the next set of posts or products as the user scrolls
3. `Redux-Saga` — Control and manage asynchronous workflows step by step
4. `Large File Processing` — Process large files chunk by chunk to save memory
5. `Unique ID Generation` — Generate sequential IDs dynamically as needed


```
========================================================

### Event delegation

- Event delegation is a JavaScript technique 
- where we can attach one event listener to a parent element instead of adding separate  event listeners to each child element individually.

This approach leverages event bubbling in the DOM, where an event occurring on a nested element will bubble up through its ancestors.


### Example:

Suppose you have a list of items in an unordered list (`<ul>`) and you want to handle click events on each list item (`<li>`).

<ul id="parentList">
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
</ul>

In JavaScript, you can delegate the click event handling to the parent `<ul>` element:
```js
const parentList = document.getElementById('parentList');

parentList.addEventListener('click', function(event) {
if (event.target.tagName === 'LI') {
console.log('Clicked on:', event.target.textContent);
// Perform actions based on the clicked list item
}
});

In this example:

- The `click` event listener is added to the `parentList`.
- When a `<li>` element is clicked, the event bubbles up to the `parentList`.
- Inside the event handler, `event.target` refers to the actual element that triggered the event (in this case, the `<li>`).
- You can then perform actions based on the specific `<li>` element that was clicked.



Here's how event delegation works:

1. `Attach Listener to Parent Element`: Instead of attaching event listeners to each child element, you attach a single event listener to the parent element that contains all the child elements you are interested in.

2. `Use Event Bubbling`: When an event happens (like a click) on a child element, the event bubbles up through its ancestors in the DOM hierarchy.

3. `Check the Target Element`: In the event handler function attached to the parent element, you can check the `event.target` property to determine which specific child element triggered the event. This allows you to conditionally execute different actions based on which child element was clicked.


Event delegation in JavaScript is a technique where you attach a single event listener to a parent element, rather than to multiple child elements individually.
```
=============================================================

### Callback hell



- Callback hell is a phenomenon where a Callback is called inside another Callback.
- It is the nesting of multiple Callbacks inside a function. 


- Callback hell is a situation where `multiple asynchronous callbacks are deeply nested inside one another`, making the code difficult to read, understand, debug, and maintain.

- The two common ways of escaping the callback Hell heare are by using promises and async/await.

 It is also called the `Pyramid of Doom` because the code starts moving deeper and deeper to the right.


```js
// Nested callbacks
doSomething(function(result1) {
  doSomethingElse(result1, function(result2) {
    doAnotherThing(result2, function(result3) {
      console.log('Final Result:', result3);
    });
  });
});

// Using Promises
doSomething()
  .then(result1 => {
    return doSomethingElse(result1);
  })
  .then(result2 => {
    return doAnotherThing(result2);
  })
  .then(result3 => {
    console.log('Final Result:', result3);
  })
  .catch(error => {
    console.error('Error:', error);
  });




where multiple asynchronous operations are nested within each other as callbacks.
This can result in code that is difficult to read, understand, and maintain

```
===================================================================
### curried function
   
  curried function is a function that takes one argument at a time, returning a new function each time, until all arguments are provided and the final return the result
      
   ```js
   function add(a) {
       return function(b) {
           return function(c) {
               return function(d) {
                   return a + b + c + d;
               };
           };
       };
   }
   
   
   const result = add(1)(2)(3)(4); // Result: 10
   console.log(result);
   
   
   
   
   
   function calculateDiscount(baseDiscount) {
       return function(minimumPurchase) {
           return function(isPremiumCustomer) {
               return function(amount) {
                   let discount = baseDiscount;
                   if (minimumPurchase && amount >= minimumPurchase) {
                       discount += 10; // Additional discount for reaching minimum purchase
                   }
                   if (isPremiumCustomer) {
                       discount += 5; // Additional discount for premium customers
                   }
                   return amount - (amount - (discount / 100));
               };
           };
       };
   }
   
   // Apply discounts based on different criteria
   const discountCalculator = calculateDiscount(15)(100)(true);
   const finalPrice = discountCalculator(200); // Result: $170
   
   console.log(finalPrice); // Output: 170
   
   
   
   
   
   Suppose youre building an e-commerce platform, and you have a function that calculates the total price of items in a shopping cart.
    However, different customers may have different discounts based on their membership level. You want to create a flexible function that can calculate the total price for any customer,
     taking into account their membership discount.
   
   // Curried function to calculate total price with discount
   function calculateTotalPrice(discount) {
     return function(items) {
       const totalPrice = items.reduce((acc, item) => acc + item.price, 0);
       return totalPrice - (1 - discount);
     };
   }
   
   // Sample shopping cart items
   const cartItems = [
     { name: 'Product A', price: 20 },
     { name: 'Product B', price: 30 },
     { name: 'Product C', price: 40 }
   ];
   
   // Define discount rates for different membership levels
   const standardDiscount = 0.1; // 10% discount for standard members
   
   // Create specialized version of the calculateTotalPrice function for standard members
   const calculateTotalPriceForStandardMember = calculateTotalPrice(standardDiscount);
   
   // Calculate total price for standard member
   const totalPriceForStandardMember = calculateTotalPriceForStandardMember(cartItems);
   
   console.log("Total price for standard member:", totalPriceForStandardMember); // Output: 81 (10% discount applied)
   
   
   ```
   

 ================================================


 ### Event loop

- The event loop is a mechanism that allows JavaScript to execute asynchronous code in a single-threaded environment.

- With the help of the Event Loop, JavaScript manages the execution order  of synchronous and asynchronous code.

## Main Components of the Event Loop

- Call Stack
- Web APIs (Browser APIs / Node.js APIs)
- Microtask Queue (promise, callbacks, etc.,),
- Macrotask Queue (setTimeout, setInterval, I/O operations, DOM events, etc.,)
- Event Loop


### Call Stack


1. with help of  Call Stack e JavaScript engine to keep track of function execution.

2. Whenever a function is called, it is pushed onto the Call Stack, and when the function completes,it is removed from the stack.

3. JavaScript follows the LIFO principle, 
meaning the last function added to the stack will be executed and removed first.


"The Call Stack follows the LIFO (Last In, First Out) principle. 
This means the most recently added function is at the top of the stack, 
so JavaScript executes it first. Once its execution is completed, 
it is removed (popped) from the stack, and execution continues with the function below it."

4. JavaScript executes first synchronous code until the Call Stack becomes empty.

5. When the current synchronous execution is complete, the Event Loop  start the processes pending microtasks first and then the next macrotask.`


# Web APIs

`Web APIs` are provided by the browser (or Node.js APIs in Node.js) to handle asynchronous operations.

Examples include:

- `setTimeout`
- `setInterval`
- `fetch`
- DOM Events
- I/O Operations

Once an asynchronous operation is completed, 
its callback is placed into either the `Microtask Queue` or the `Macrotask Queue`, 
depending on the type of operation.



### Micro Task Queue


The Microtask Queue is a queue that s`tores high-priority asynchronous tasks`.these tasks are executed after the current synchronous code finishes 
and the Call Stack becomes empty, but before the Event Loop processes the next macrotask.

Microtasks are given higher priority than macrotasks.

Examples of microtasks:

- Promise callbacks (`.then()`, `.catch()`, `.finally()`)
- `queueMicrotask()`
- `MutationObserver` callbacks

The Event Loop executes `all pending microtasks` before moving to the Macrotask Queue.


### Macro Task Queue

The Macrotask Queue (also called the Task Queue or Callback Queue) is a queue that stores asynchronous tasks with normal priority. These tasks are executed only after all pending microtasks have been completed.

Common macrotasks include:

setTimeout()
setInterval()
DOM events (e.g., click, load)
I/O operations (in Node.js)

### Event Loop:

Event Loop: The Event Loop is the mechanism that continuously checks whether the Call Stack is empty. 
If it is, it first executes all pending microtasks and then executes the next macrotask. 
This process repeats continuously




The main difference between microtask and macrotask queue is their priority.
The event loop always gives higher priority to the microtask queue, a
and will process all the callbacks in the microtask queue before moving on to the macrotask queue.


=================================================================


### Web APIs - Definition

> `"Web APIs are browser-provided (or Node.js runtime-provided) features that allow JavaScript to perform asynchronous operations outside the JavaScript engine, such as timers, network requests, and DOM events. Once the operation is completed, the callback is sent to the appropriate queue for execution."`

`Examples:`

- `setTimeout()`
- `setInterval()`
- `fetch()`
- DOM Events (`click`, `load`)
- I/O operations

---

### Macrotask Queue - Definition

> `"The Macrotask Queue is a queue that stores callbacks of completed asynchronous operations such as `setTimeout`, `setInterval`, DOM events, and I/O operations. The Event Loop moves these callbacks to the Call Stack for execution only after the Call Stack is empty and all Microtasks have been completed."`

`Examples:`

- `setTimeout()` callback
- `setInterval()` callback
- DOM event callbacks
- I/O callbacks

---

### Simple difference for interview:

> `"Web APIs perform the asynchronous work, while the Macrotask Queue stores the callbacks after the work is completed and waits for the Event Loop to execute them."` ✅

Example:

```javascript
setTimeout(() => {
    console.log("Hello");
}, 1000);
```

Flow:

```text
setTimeout()
     ↓
Web API
(timer waits 1 second)
     ↓
Macrotask Queue
(callback waits)
     ↓
Event Loop
     ↓
Call Stack
(callback executes)
```

This distinction is important in interviews because many people incorrectly say that Web APIs and Macrotask Queue are the same.







==========================================

### How the Event Loop Works

1. `Execution Context:` JavaScript starts by executing the global context, which is the main code file.
2. `Call Stack:` Functions are pushed onto the Call Stack and executed. If a function contains an asynchronous operation (e.g., `setTimeout`), the operation is offloaded to the browser or Node.js environment.
3. `Task Queues:`
   - When an asynchronous operation completes, its callback is placed into the appropriate queue (Micro Task Queue or Macro Task Queue).
4. `Event Loop:`
   - The event loop continuously checks the Call Stack. If the Call Stack is empty, it starts processing the Micro Task Queue.
   - All microtasks are processed before moving on to the Macro Task Queue.
   - Once the Micro Task Queue is empty, the event loop will process one task from the Macro Task Queue.

### Example

Consider the following code:

```javascript
console.log("Start");

setTimeout(() => {
  console.log("Timeout");
}, 0);

Promise.resolve().then(() => {
  console.log("Promise");
});

console.log("End");
```

`Execution Flow:`

1. `'Start'` is logged to the console.
2. `setTimeout` is called, its callback is placed in the Macro Task Queue.
3. `Promise.resolve().then` is called, its callback is placed in the Micro Task Queue.
4. `'End'` is logged to the console.
5. The Call Stack is now empty.
6. The event loop checks the Micro Task Queue and executes the promise callback, logging `'Promise'` to the console.
7. The event loop then checks the Macro Task Queue and executes the timeout callback, logging `'Timeout'` to the console.

`Output:`

```
Start
End
Promise
Timeout
```

By understanding the event loop and its components, you can better manage asynchronous operations in JavaScript and predict the order of execution for your code.

<!-- Microtasks are operations scheduled to run right after the current script finishes but before the browser performs any rendering or handling of input/output operations. -->

<!-- Microtasks are tasks that are executed immediately after the currently executing script and before any rendering or I/O operations. -->

<!--
The Event loop is a concept that helps us to know the execution of code in Javascript.

The event loop in JavaScript is a fundamental concept that helps manage the execution of asynchronous code, -->

 <!-- single-threaded environment of JavaScript to handle concurrent operations. 
 It works by constantly checking two queues: the microtask queue and the macrotask queue. These queues store the callbacks of the asynchronous operations that are waiting to be executed.

 The main difference between microtask and macrotask queue is their priority. 
 The event loop always gives higher priority to the microtask queue, and will process all the callbacks in the microtask queue before moving on to the macrotask queue. -->

<!-- The Call Stack is where the JavaScript engine keeps track of function calls. -->

-->

<!-- Macrotasks are tasks that are scheduled to be executed after the current executing script and after all microtasks have been processed -->

```js

================================= Closure ========================


A closure in JavaScript is a function that remembers outer (lexical) scope variables  and can access them even after the outer function has finished executing.

This happens because the function maintains a reference to those variables.

Closures are commonly used to maintain state, create private variables, implement callbacks, and build function factories.

==========================================================

### 🔹 Simple Closure Example:

``javascript
function outerFunction() {
  let outerVariable = "I am outer";
  let a = 20;
  function innerFunction() {
    console.log(outerVariable); // Accesses outerVariable via closure
    console.log(a); // Accesses outerVariable via closure
  }
  a = 30;
  return innerFunction;
}

const innerFunc = outerFunction();
innerFunc(); // Output: outerVariable = I am outer and a=30
```

In JavaScript, a closure does not remember a copy of the variable's value; instead, it maintains access to the actual variable from the outer lexical scope. In this example, `a` is initially `20`, but before `outerFunction()` finishes, `a` is changed to `30`. The `innerFunction` still has access to that same `a` variable through the closure, so when `innerFunc()` is called later, it reads the current value of `a`, which is `30`.

---

### 🔹 Real-World Use Case – Counter:

```javascript
function createCounter() {
  let count = 0;
  return function () {
    count++;
    return count;
  };
}

const counter = createCounter();
console.log(counter()); // 1
console.log(counter()); // 2
```

> `count` is private and persistent across function calls due to closure.

When function_a_outer is executed, function_b_inner still retains access to its lexical scope. These variables are held by reference, not as the original values at definition time. As a result, the inner function always accesses the latest value of those variables

==========================================================

- When a customer visits an online store, a new shopping cart is created.
- This cart contains a private list of items, inaccessible directly from outside.
- To manage the cart, specific functions are provided:
  - One for adding items.
  - One for removing items.
  - One for viewing the cart's contents.
- These functions can access the private list, even though it's hidden from the outside.
- When a customer adds an item:
  - The function modifies the private list to include the new item
- When a customer removes an item:
  - Another function checks the list and updates it accordingly.
- To view the cart:
  - A function reads and displays the list without changing it.
- This use of closures ensures that the cart’s internal list remains encapsulated and secure, only modifiable through the designated functions.
- The private list retains its state throughout the customer’s session because the functions maintain a reference to it.
- This encapsulation:
  - Enhances security by preventing direct tampering.
  - Ensures that each customer's cart operates independently and consistently throughout their shopping experience.

<!--
Certainly! Here's a concise explanation using a continuous format:

When a customer visits an online store, a new shopping cart is created. This cart contains a private list of items, inaccessible directly from outside. To manage the cart, specific functions are provided: one for adding items, one for removing items, and one for viewing the cart's contents. These functions can access the private list, even though it's hidden from the outside. When a customer adds an item, the function modifies the private list to include the new item. When they remove an item, another function checks the list and updates it accordingly. To view the cart, a function reads and displays the list without changing it.

This use of closures ensures that the cart’s internal list remains encapsulated and secure, only modifiable through the designated functions. The private list retains its state throughout the customer’s session because the functions maintain a reference to it. This encapsulation enhances security by preventing direct tampering and ensures that each customer's cart operates independently and consistently throughout their shopping experience. -->

=======================================

for(var x = 1; x < 5; x++) {
setTimeout(() => {
console.log(x);
}, 1000);
}

for(let x = 1; x < 5; x++) {
setTimeout(() => {
console.log(x);
}, 1);
}

Since var does not create a new scope for each iteration, all callbacks reference the same x varibale.

Since let creates a new scope for each iteration, each callback references its own unique x varibale.

in case of var , var is function scope  , only one varible is created and for loop doest not crated each interation new variable, setTimeout callback create clouse , clouse is rember only refeance not value , here for exuation time  setTimeout callback pushed macro task quea , first it finshded time then pushedout from stack , then loop is shynchrounse task it fished first then value of var is is five Since all callbacks reference the same variable, beasue dose not crate new varible


```js
### `var` with Closure and Event Loop Explanation

In the case of ``var``, only one variable is created because `var` is `function-scoped`.  
The `for` loop does not create a new variable for each iteration.

Each `setTimeout` callback creates a `closure` that references the same variable. The closure remembers the variable reference, not the value at the time the callback was created.

The callbacks do not execute immediately; they are moved to the `Macrotask Queue` after the timer completes.

When the `Event Loop` executes them, the loop has already finished and the variable value has become `5`. Since all callbacks reference the same variable, all callbacks print the same value:

Output:

5
5
5
5


---

### `let` with Closure and Event Loop Explanation

In the case of ``let``, a new variable is created for each iteration because `let` is `block-scoped`. The `for` loop creates a separate variable binding for every iteration.

Each `setTimeout` callback creates a `closure` that references its own iteration-specific variable. Each callback creates a closure that references its own iteration-specific x variable.

The callbacks do not execute immediately; they are moved to the `Macrotask Queue` after the timer completes.

When the `Event Loop` executes them, the loop has already finished, but each callback has its own separate `x` variable with the value from its respective iteration.

Therefore, each callback prints its own stored value:

Output:

1
2
3
4
```






==============================================================

### Why are Arrow Functions Used?

Arrow functions are used in JavaScript because they provide a shorter and cleaner syntax for writing functions.

- Arrow functions do not have their own `this` context. Instead, they `inherit `this` from the surrounding (parent) scope` at the time they are defined.
- This is especially useful in:

  - `Callbacks`
  - `Event handlers`
  - `Array methods` such as `map()`, `filter()`, and `forEach()`

- They provide `lexical `this` binding`, which helps avoid confusion with `this`.
- They have a `concise syntax`, making functions easier to write and read.
- For a `single-expression function`, the `return` keyword and curly braces are not required.
- Arrow functions do not have their own ``arguments` object`; they use the `arguments` from the surrounding scope.
- They are convenient for writing short callback functions.

`In short:` Arrow functions make JavaScript code `shorter, cleaner, and more expressive`, especially when working with callbacks and array methods.

.

==============================================================
 
Explain Hoisting in javascript.


Hoisting is a `JavaScript behavior` where `variable and function declarations are moved to the top of their scope` (global or function) `before code execution`.

- `Variables declared with `var`` are `hoisted and initialized with `undefined``.
- ``let` and `const`` are hoisted but `not initialized` (they are in a “temporal dead zone” until their declaration).
- `Function declarations` are hoisted `with their entire definition`, so they can be called before they appear in the code.
- `Function expressions` (assigned to a variable) behave like variables: hoisted only as `undefined` if declared with `var`.

---

### `Examples`

```js
// var hoisting
console.log(a); // undefined
var a = 5;

// let/const hoisting
console.log(b); // ReferenceError
let b = 10;

// Function declaration hoisting
greet(); // Hello!
function greet() {
  console.log("Hello!");
}

// Function expression hoisting
sayHi(); // TypeError: sayHi is not a function
var sayHi = function() {
  console.log("Hi!");
};
```

---

 `Key points:`

- Hoisting moves `declarations`, not `initializations`.
- `var` → undefined, `let/const` → temporal dead zone, function declarations → fully hoisted.




Hoisting is the default behaviour of javascript where  the variable and function
declarations are moved on top during the compilation phase




========================================================

PUT
  - The PUT method is used to update or replace an entire resource.

PATCH
- The `PATCH` method is used to `partially update a resource`.
- It updates only the `specified fields`, while the other fields remain unchanged.
========================================================


### PUT

* The `PUT` method is used to `update or replace an entire resource`.
* It generally expects the complete resource data in the request body.
* If some fields are missing, they may be replaced or reset, depending on the API implementation.

### PATCH

* The `PATCH` method is used to `partially update a resource`.
* It updates only the `specified fields`, while the other fields remain unchanged.

### Simple Example

Suppose a user has:

```json
{
  "name": "John",
  "age": 25,
  "city": "Pune"
}
```

`PUT:`

```json
{
  "name": "John",
  "age": 26,
  "city": "Mumbai"
}
```

→ Updates/replaces the `entire resource`.

`PATCH:`

```json
{
  "age": 26
}
```

→ Updates `only the age`, while `name` and `city` remain unchanged.

`In short:`

> `PUT → Update/replace the entire resource`
> `PATCH → Update specific fields of a resource`


Patch vs Put

- `PUT`

  - The PUT method is used to update an entire resource.
  - If the resource exists, it will be completely replaced with the new data provided.
  - PUT replaces the entire resource.
  - If your form or component allows the user to update an entire resource (e.g., editing all fields of a user profile), you might use PUT.

- `PATCH`
  - The PATCH method is used to apply partial updates to a resource.
  - This means you only send the fields you want to update, and the rest of the resource remains unchanged.
  - PATCH updates only the specified fields.
  - If your form or component allows the user to update only specific fields (e.g., changing the user's email address or password), you might use PATCH.

========================================================




accessibility

- Web accessibility  is the design and creation of websites that can be used by everyone.

- Accessibility (a11y) means making web applications usable for everyone, including people with disabilities. 

- Accessibility ensures that users can navigate and interact with applications using keyboards, screen readers, and other assistive technologies.


  In ReactJS, accessibility can be achieved using semantic HTML, ARIA attributes, keyboard support, focus management, and proper handling of dynamic content. Good accessibility improves usability and helps applications follow standards such as WCAG (Web Content Accessibility Guidelines).



React provides various tools and techniques to make applications more accessible, such as:
-
1. Semantic HTML:
-Using appropriate HTML elements to provide meaning and structure to the content.
 For example, using <button> instead of <div> for clickable elements.

2. ARIA attributes:
-Accessible Rich Internet Applications (ARIA) attributes can be added
 to HTML elements to provide additional information to assistive technologies. 
React supports adding ARIA attributes to components to enhance accessibility.
2wa C

4. Focus management: Managing focus to ensure that users can navigate through the application in a logical order, 
and that focus is not trapped within certain elements.

5. Screen reader support: Testing applications with screen readers to ensure that content is properly announced and navigable.

6. Providing alternative text for images: Adding descriptive alt text to images to ensure that users with visual impairments understand the content.

7. Handling dynamic content: Ensuring that dynamically generated content is accessible and properly announced by assistive technologies.




in reactjs we can develop application that are usable by people with disabilities.

<!-- Accessibility support is necessary to allow assistive technology to interpret web pages. -->
<!-- 
Accessibility in ReactJS refers 
to the web applications built with React are usable by people with disabilities.  -->


<!-- This includes individuals who may have visual, auditory, motor, or cognitive impairments.  -->

==============================================


What is assistive technology in websites?
Screen readers, voice recognition software, reading assistants, and switch devices that replace the need to use a keyboard or mouse are examples of assistive technologies.


==============================================


Internationalization vs Localization



Internationalization (i18n)


Internationalization (i18n) is the process of designing and developing an application so  that it can support multiple languages and regions without changing the source code.

Instead of hardcoding text in the application, all user-facing text is stored in separate language resource files, such as en.json, mr.json, and hi.json. 
 
 This approach makes it easy to add new languages or update existing translations without changing the application code.

Localization (l10n)


Localization (l10n) is the process of translating and customizing an application for a specific language, country, or region. Based on the user's selected language, the application loads the corresponding language file, such as mr.json for Marathi or en.json for English, and displays all content in that language. Localization may also include adapting date, time, number, and currency formats to match the selected locale, ensuring users have a familiar and localized experience.








==================================================================================

### `What is an Event Listener?`

An Event Listener is a JavaScript function that waits for a specific event to occur on an HTML element. When the event occurs, it executes a callback function. 

- Event listeners are commonly added using the addEventListener() method.

- Common events include click, keydown, submit, and mouseover.

Use `addEventListener()` to attach an event listener to an element.
Use `removeEventListener() `to detach an event listener.



- `User Actions`: Clicks, key presses, mouse movements, etc.
- `System-generated Events`: Page load, resize, etc.

### `How to Use Event Listeners:`

1. `Adding an Event Listener`  
   To attach an event listener to an element, use the `addEventListener()` method. This method allows you to specify:
   - The type of event (e.g., `click`, `keydown`, etc.)
   - The function to be executed when the event is triggered.

   `Syntax`:
   ```javascript
   element.addEventListener('event', function, useCapture);
   ```

   - `event`: The type of event to listen for (e.g., `click`, `keyup`).
   - `function`: The callback function to be executed when the event occurs.
   - `useCapture` (optional): A boolean value that determines whether the event should be captured during the capturing phase (`true`) or the bubbling phase (`false`).

   `Example`:
   ```javascript
   const button = document.querySelector('button');
   button.addEventListener('click', () => {
     console.log('Button was clicked!');
   });
   ```

2. `Removing an Event Listener`  
   To remove an event listener, use the `removeEventListener()` method. You need to pass the same event type and the function that was originally attached to the event.

   `Syntax`:
   ```javascript
   element.removeEventListener('event', function);
   ```

   `Example`:
   ```javascript
   const button = document.querySelector('button');
   function handleClick() {
     console.log('Button was clicked!');
   }
   button.addEventListener('click', handleClick);

   // Later in the code, to remove the event listener
   button.removeEventListener('click', handleClick);
   ```

---

### `Key Notes:`
- `addEventListener()` allows you to add multiple listeners for the same event type on the same element.
- `removeEventListener()` requires the exact same reference to the function used when adding the event listener. If an anonymous function was used, you cannot remove it.


An event listener is a function or piece of code that waits for a specific event (such as a mouse click, key press, or form submission) to occur on an element. When the event happens, the event listener automatically executes the associated function.

An `event listener` in JavaScript is a function that waits for a specific event to occur on a particular element and then executes a predefined action when the event is triggered. Events can be things like:


An event listener in JavaScript is a functions() that waits for a specific event to occur on an element and then executes a specified action. Events can be user actions like clicks, key presses, mouse movements, or system-generated events like page load.




==================================================================================

When to Use <form onSubmit> vs <button onClick>?


### `Use `<form onSubmit>`:`
- `Primary Purpose`: Specifically used for `submitting forms`.
- `Form Handling`: Triggers when the form’s submit button is clicked or the Enter key is pressed while focused on an input.
- `Keyboard Accessibility`: Automatically listens for both the Enter key and button clicks, making it more `keyboard-friendly` and accessible.
- `Page Refresh`: By default, submitting a form will refresh the page unless you call `e.preventDefault()` in your handler.
- `Semantic HTML`: Provides better structure for `accessibility`, logically grouping inputs and actions.


### `Use `<button onClick>`:`
- `Primary Purpose`: Used to `trigger standalone actions` (not tied to form submission).
- `Form Handling`: Only triggers when the button is clicked; does not handle form submission or listen for the Enter key.
- `No Page Refresh`: The button will `not refresh the page` unless you manually trigger it.
- `Use Case`: Ideal for actions like `showing modals, fetching data, or toggling UI elements`, but `not for form submission`.



`Conclusion:`  
- ``<form onSubmit>`` is preferred for `form submissions` because it offers better accessibility, handles both Enter key and button clicks, and provides a more `semantic structure`.
- ``<button onClick>`` is better suited for `triggering actions` not related to form submission.


`Both approaches are valid`, but `<form onSubmit>` is preferred for form-based interactions because it provides better semantic structure, accessibility, and seamless behavior for users.

=============== memoization ===================================

### What does memoizing mean?

Memoization is a technique where the result of a function call is cached (stored), so if the same inputs occur again, the cached result is returned immediately instead of recalculating.

This improves performance by avoiding repeated computations.

==============================================================


# Immediately Invoked Function Expression (IIFE)

An `Immediately Invoked Function Expression (IIFE)` is a JavaScript function that is `executed immediately after it is created`.


1. IIFE created its own local scope 
2.  Runs code immediately after declaration, useful for initialization tasks,
    configuring settings, or starting applications at the desired moment. ?

IIFE creates a private scope for variables, providing encapsulation and data privacy by hiding internal data through closures.


### Syntax

```javascript
(function() {
  console.log("This function runs immediately!");
})(); //The function is created and immediately executed.

```


### IIFE with Parameters

An IIFE can also accept arguments:

```javascript
(function(name) {
  console.log("Hello, " + name + "!");
})("World");//Hello, World!



=========================================================

1. `Creates a private scope for variables, providing encapsulation and data privacy.`

2. `Hides internal data using closures, preventing direct access from outside.`



### Why Use IIFE?

`1. Creates a Private Scope`

Variables declared inside an IIFE are not directly accessible from outside.

```javascript
(function() {
  const secret = "12345";
  console.log(secret);
})();

// console.log(secret); // Error
```

`2. Data Privacy`

IIFEs can be used to hide internal variables and implementation details from the outside code.

`3. Avoids Global Namespace Pollution`

Variables inside an IIFE do not become global variables, which helps prevent naming conflicts.

`4. Initialization`

IIFEs can be useful when some code needs to run `once immediately`, such as initialization or configuration code.

### IIFE and Closures

An IIFE can also be combined with `closures` to create private data.

```javascript
const counter = (function() {
  let count = 0;

  return function() {
    count++;
    return count;
  };
})();

console.log(counter()); // 1
console.log(counter()); // 2
```

Here, `count` cannot be accessed directly from outside, but the returned function can access it because of the `closure`.

### In Short

> `IIFE = Create a function + execute it immediately.`

It is mainly useful for `private scope, data encapsulation, avoiding global variables, and one-time initialization`.



----------------------------------------------------------


| Feature                    | Purpose                                                    |
| -------------------------- | ---------------------------------------------------------- |
| Encapsulation          | Creates private scope for variables/functions              |
| Avoid Global Pollution | Prevents global variable name conflicts                    |
| Data Privacy           | Hides internal data using closures                         |
| Module Pattern         | Exposes only required functions and keeps the rest private |



- It is often used to create a local scope to avoid polluting the global scope.



Encapsulation: Creates private scopes for variables and functions, preventing conflicts and unintended modifications in the global scope.

Avoiding Global Pollution: Keeps the global namespace clean, minimizing naming clashes with other scripts or libraries and maintaining modular, self-contained code.


Data Privacy: Utilizes closures to maintain data privacy, hiding internal variables and functions while exposing only necessary parts, fundamental to the Module Pattern.




========================================================================


The return this.firstName inside the constructor function will not work as intended 
because constructor functions implicitly return the newly created object unless you explicitly return an object.
 Returning a primitive value will override the object creation.

### returning an Object:
If you explicitly return an object from a constructor function, this returned object will replace the default instance that the constructor creates.

function Person(first, last, age, eye) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eye;
  this.nationality = "English";

  // Returning a primitive value (string)
  return this.firstName;
}

const myFather = new Person("John", "Doe", 50, "blue");
console.log(myFather); // Outputs: Person { firstName: 'John', lastName: 'Doe', age: 50, eyeColor: 'blue', nationality: 'English' }


### Returning a Primitive Value:
If you explicitly return a primitive value (like a string, number, boolean, etc.), 
this value is ignored, and the newly created instance is returned instead.


function Person(first, last, age, eye) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eye;
  this.nationality = "English";

  // Returning a new object
  return { custom: 'object' };
}

const myFather = new Person("John", "Doe", 50, "blue");
console.log(myFather); // Outputs: { custom: 'object' }
javascript
========================================================================


Why is a primitive ignored?

1. `Primitive values are ignored` because when using `new`, JavaScript expects the constructor to return an `object`. A primitive cannot replace the newly created `this` object.

2. `Objects are returned` because an object can replace the newly created `this` object and become the result of the `new` expression.

> `Important:` Don't say primitives are ignored simply because they cannot hold properties or methods. The key reason is the `special behavior of the `new` operator`.


=========================================

### JavaScript Type Coercion — Short Interview Answer

**Type coercion** in JavaScript means converting a value from one data type to another.

There are two types:

1. **Implicit Coercion** – JavaScript automatically converts the type.

   ```js
   "5" + 1   // "51"
   "5" - 1   // 4
   ```

2. **Explicit Coercion** – We manually convert the type.

   ```js
   Number("5")   // 5
   String(10)    // "10"
   Boolean(1)    // true
   ```

* `+` with string → **concatenation**: `"5" + 1` → `"51"`
* `-`, `*`, `/`, `%` → **convert to number**: `"5" - 1` → `4`
* `==` → **allows type conversion**: `5 == "5"` → `true`
* `===` → **does not convert types**: `5 === "5"` → `false`

 **`==` may automatically convert types before comparing, 
while `===` compares both value and type without conversion.**
