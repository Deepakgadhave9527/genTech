=========================================================================

# JavaScript Web Storage

JavaScript provides two types of Web Storage:

- **Session Storage (`sessionStorage`)**
- **Local Storage (`localStorage`)**

Both store data as **key-value pairs**, and **both can only store strings**. If you want to store objects or arrays, use `JSON.stringify()` while storing and `JSON.parse()` while retrieving.

---

# Session Storage (`sessionStorage`)

### Features

`sessionStorage` stores data only for the current browser session
and is available only in the same browser tab that created it.
Each tab has its own separate session storage, so the data is not shared across tabs.
The stored data is automatically cleared when the tab or browser window is closed.
It stores data as key-value pairs and typically provides up to **5 MB** of storage, depending on the browser.

### Methods

### 1. Store Data

```javascript
sessionStorage.setItem("username", "John");
```

### 2. Retrieve Data

```javascript
let username = sessionStorage.getItem("username");
console.log(username);
```

### 3. Update Data

```javascript
sessionStorage.setItem("username", "David");
```

### 4. Remove One Item

```javascript
sessionStorage.removeItem("username");
```

### 5. Clear All Data

```javascript
sessionStorage.clear();
```

### 6. Check Number of Stored Items

```javascript
console.log(sessionStorage.length);
```

### 7. Get Key by Index

```javascript
console.log(sessionStorage.key(0));
```

### Store an Object

```javascript
const user = {
  id: 1,
  name: "John",
  age: 25,
};

sessionStorage.setItem("user", JSON.stringify(user));
```

### Retrieve an Object

```javascript
const user = JSON.parse(sessionStorage.getItem("user"));
console.log(user);
```

---

# Local Storage (`localStorage`)

### Features

- Data is stored permanently until it is manually removed.
- Data remains available even after the browser is closed and reopened.
- Data is shared across all tabs and windows of the same origin (protocol, domain, and port).
- Different websites cannot access each other's local storage.
- Maximum storage is typically around **5–10 MB**, depending on the browser.
- Stores data as **key-value pairs**.
- Only strings can be stored directly.

### Methods

### 1. Store Data

```javascript
localStorage.setItem("username", "John");
```

### 2. Retrieve Data

```javascript
let username = localStorage.getItem("username");
console.log(username);
```

### 3. Update Data

```javascript
localStorage.setItem("username", "David");
```

### 4. Remove One Item

```javascript
localStorage.removeItem("username");
```

### 5. Clear All Data

```javascript
localStorage.clear();
```

### 6. Check Number of Stored Items

```javascript
console.log(localStorage.length);
```

### 7. Get Key by Index

```javascript
console.log(localStorage.key(0));
```

### Store an Object

```javascript
const user = {
  id: 1,
  name: "John",
  age: 25,
};

localStorage.setItem("user", JSON.stringify(user));
```

### Retrieve an Object

```javascript
const user = JSON.parse(localStorage.getItem("user"));
console.log(user);
```

# Common Methods

| Method                | Description                            |
| --------------------- | -------------------------------------- |
| `setItem(key, value)` | Adds or updates a value                |
| `getItem(key)`        | Returns the stored value               |
| `removeItem(key)`     | Removes a specific item                |
| `clear()`             | Removes all stored items               |
| `key(index)`          | Returns the key at the specified index |
| `length`              | Returns the number of stored items     |

---

## Important Notes

- Both `sessionStorage` and `localStorage` store **only strings**.
- To store objects or arrays, use `JSON.stringify()`.
- To retrieve objects or arrays, use `JSON.parse()`.
- `getItem()` returns `null` if the key does not exist.
- Avoid storing sensitive information (such as passwords or tokens) in Web Storage because it is accessible through JavaScript.
- Storage is limited (typically 5–10 MB depending on the browser).

This version is accurate, complete, and suitable for JavaScript interview notes or learning material.


//===========================Bubbling and Capturing =========================


A) Bubbling

Event Bubbling is the default event propagation method in JavaScript.
 When an event occurs on a child element, it first runs on the target element and then propagates upward through its parent elements to the root (document).

-The bubbling principle is simple.
-When an event happens on an element, it first runs the handlers on it,
then on its parent, then all the way up on other ancestors.

-With bubbling, the event is first captured and handled by the innermost element and
then propagated to outer elements.


B] capturing

Event Capturing (also called the capture phase) is the opposite of bubbling. The event starts from the outermost parent and travels down to the target element.

-when an event happen on element ,it first run the parent element of then lastly run handler


-With capturing, the event is first captured by the outermost element and
propagated to the inner elements.

In event capturing, the event is handled before it reaches the target. You must explicitly enable it by passing true as the third argument in addEventListener

document.getElementById("parent").addEventListener("click", () => {
  console.log("Parent clicked (capture)");
}, true);



-Capturing is also called "trickling", which helps remember the propagation order:

stopPropagation prevents further propagation of the current event in the capturing and bubbling phases.

preventDefault prevents the default action the browser makes on that event.





=========================================================================
### Pure Functions
- *Deterministic*: Always return the same output for the same input.
- *No Side Effects*: Do not alter external state or rely on it.
- *Benefits*: Easier to understand, test, compose, and optimize (e.g., memoization).

*Example*:
javascript
function add(a, b) {
    return a + b;
}

console.log(add(2, 3)); // Always returns 5


### Impure Functions
- *Non-deterministic*: Output can vary for the same input.
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

Generators and iterators are closely related concepts in JavaScript that allow for efficient handling of sequences and collections of data. Here's an overview of both, including their definitions, usage, and how they interrelate.


### Iterators

```

### Iterators

**Iterators** are objects that allow for sequential access to elements in a collection, one at a time.

The `next()` method returns an object with two properties:

- **`value`**: The current value in the sequence.
- **`done`**: A boolean that tells whether the iteration has finished (`true`) or not (`false`).

#### Example of an Iterator:

const myArray = [1, 2, 3];
const iterator = myArray[Symbol.iterator]();

console.log(iterator.next()); // { value: 1, done: false }
console.log(iterator.next()); // { value: 2, done: false }
console.log(iterator.next()); // { value: 3, done: false }
console.log(iterator.next()); // { value: undefined, done: true }

### How it works:

1. `Symbol.iterator` creates an iterator object for the array.
2. Each call to `next()` moves the iterator to the next element.
3. When there are no more elements, `done` becomes `true`.

Iterators are used internally by features like `for...of`, spread syntax (`...`), and destructuring.

Example using `for...of`:

```javascript
const myArray = [1, 2, 3];

for (const value of myArray) {
  console.log(value);
}
```

Output:

```
1
2
3
```

Here, JavaScript automatically calls the iterator's `next()` method behind the scenes.

``

====================================================================

### Generators

**Generators** are special functions that can pause their execution and resume it later.
allowing for control over the function's execution.

They are defined using the function\* syntax and use the yield keyword to pause execution and produce values one at a time.

normal function, which runs from start to finish in a single call, a generator function remembers its state between calls beacuse pause execution

The generator object provides the next() method.

The result of next() is always an object with two properties:
value: the yielded value.
done: true if the function code has finished, otherwise false.

#### Example of a Generator:

function\* simpleGenerator() {
yield 1;
yield 2;
yield 3;
}

const gen = simpleGenerator();

console.log(gen.next()); // { value: 1, done: false }
console.log(gen.next()); // { value: 2, done: false }
console.log(gen.next()); // { value: 3, done: false }
console.log(gen.next()); // { value: undefined, done: true }

- simpleGenerator is a generator function.
- Calling simpleGenerator() returns a generator object gen.
- gen is an object that implements the iterator protocol, with a next() - method that returns the next value in the sequence.
- Generators are objects in JavaScript.

<!-- It allow to control excuation of function
They return a generator object, which is both an iterator and an iterable. -->

### project scenarios of generators in one line each\*\*:

1. Pagination:
   Use generators to fetch API data page by page instead of loading thousands of records at once.

2. Infinite Scrolling:
   Use generators to generate the next set of posts/products when a user keeps scrolling (like Instagram or Amazon).

3. Redux-Saga:
   Use generators to handle async workflows like API calls, loading states, and navigation steps in React applications.

4. Large File Processing:
   Use generators to read and process large files (CSV, logs, videos) chunk by chunk to save memory.

5. Unique ID Generation:
   Use generators to create sequential IDs, invoice numbers, ticket numbers, or order numbers dynamically.
========================================================

Event delegation\

Event delegation is a JavaScript technique where you attach one event listener to a parent element instead of adding separate listeners to each child element.

Event delegation in JavaScript is a technique where you attach a single event listener to a parent element, rather than to multiple child elements individually.
This approach leverages event bubbling in the DOM, where an event occurring on a nested element will bubble up through its ancestors.

Here's how event delegation works:

1. **Attach Listener to Parent Element**: Instead of attaching event listeners to each child element, you attach a single event listener to the parent element that contains all the child elements you are interested in.

2. **Use Event Bubbling**: When an event happens (like a click) on a child element, the event bubbles up through its ancestors in the DOM hierarchy.

3. **Check the Target Element**: In the event handler function attached to the parent element, you can check the `event.target` property to determine which specific child element triggered the event. This allows you to conditionally execute different actions based on which child element was clicked.

### Example:

Suppose you have a list of items in an unordered list (`<ul>`) and you want to handle click events on each list item (`<li>`).

<ul id="parentList">
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
</ul>

In JavaScript, you can delegate the click event handling to the parent `<ul>` element:

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

=
================================================================================
Callback hell



Callback hell is a phenomenon where a Callback is called inside another Callback. 
It is the nesting of multiple Callbacks inside a function. 

where multiple asynchronous operations are nested within each other as callbacks.
This can result in code that is difficult to read, understand, and maintain

 The two common ways of escaping the callback Hell heare are by using promises and async/await.

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




================================================================================
```js
   curried function
   
    curried function is a function that takes one argument at a time, returning a new function each time,
    until all arguments are provided and the final return the result
   
   <!-- This allows for partial application and greater flexibility in function composition and usage. -->
   
   
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
                   return amount - (amount * (discount / 100));
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
       return totalPrice * (1 - discount);
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
   
   









=========================================================================
####
-preventDefault() is a JavaScript method that prevents the browsers default action for an event.

- used to stop the default action associated with an event from occurring.

  - Example: Prevent a form from submitting.
  - Example: Prevent a link from navigating to a new page.
  - Example: Prevent a context menu from appearing.


---------------------------------------------------------------------------
- `stopPropagation()`
event.stopPropagation() is a JavaScript method used to stop event propagation in the DOM.

(stop event bubbling or capturing.)

When an event occurs on a nested child element, it normally bubbles from the child element to its parent elements.
By calling event.stopPropagation() inside the child element's event handler,
- we stop the event from reaching parent elements.
It allows the current element's event handler to execute, 
but parent elements handlers will not be triggered.
It does not affect sibling elements because siblings are not part of the event propagation path.


-------------------------------------------------------------------------


### `stopImmediatePropagation()`

event.stopImmediatePropagation() is a JavaScript method that stops the event from propagating to parent elements
and also prevents any other event listeners attached to the same element from executing.







### ======================== Event loop =========================================


 Event loop

- The event loop is a mechanism that allows JavaScript to execute asynchronous code in a single-threaded environment.

- With the help of the Event Loop, JavaScript manages the execution order  of synchronous and asynchronous code.

## Main Components of the Event Loop

- Call Stack
- Web APIs (Browser APIs / Node.js APIs)
- Microtask Queue (promise, callbacks, etc.,),
- Macrotask Queue (setTimeout, setInterval, I/O operations, DOM events, etc.,)
- Event Loop


### Call Stack


1. with help of  Call Stack e JavaScriptengine to keep track of function execution.
2. Whenever a function is called, it is pushed onto the Call Stack, and when the function completes,
 it is removed from the stack.
3. JavaScript follows the LIFO principle, 
meaning the last function added to the stack will be executed and removed first.


"The Call Stack follows the LIFO (Last In, First Out) principle. 
This means the most recently added function is at the top of the stack, 
so JavaScript executes it first. Once its execution is completed, 
it is removed (popped) from the stack, and execution continues with the function below it."

4. JavaScript executes all synchronous code in the Call Stack until it becomes empty.

5. then Event Loop starts processing asynchronous callbacks only when the Call Stack becomes empty.


# Web APIs

**Web APIs** are provided by the browser (or Node.js APIs in Node.js) to handle asynchronous operations.

Examples include:

- `setTimeout`
- `setInterval`
- `fetch`
- DOM Events
- I/O Operations

Once an asynchronous operation is completed, 
its callback is placed into either the **Microtask Queue** or the **Macrotask Queue**, 
depending on the type of operation.



### Micro Task Queue


The Microtask Queue is a queue that stores high-priority asynchronous tasks.
 These tasks are executed after the current synchronous code finishes 
 and the Call Stack becomes empty, but before the Event Loop processes the next macrotask.

Microtasks are given higher priority than macrotasks.

Examples of microtasks:

- Promise callbacks (`.then()`, `.catch()`, `.finally()`)
- `queueMicrotask()`
- `MutationObserver` callbacks

The Event Loop executes **all pending microtasks** before moving to the Macrotask Queue.


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

> **"Web APIs are browser-provided (or Node.js runtime-provided) features that allow JavaScript to perform asynchronous operations outside the JavaScript engine, such as timers, network requests, and DOM events. Once the operation is completed, the callback is sent to the appropriate queue for execution."**

**Examples:**

* `setTimeout()`
* `setInterval()`
* `fetch()`
* DOM Events (`click`, `load`)
* I/O operations

---

### Macrotask Queue - Definition

> **"The Macrotask Queue is a queue that stores callbacks of completed asynchronous operations such as `setTimeout`, `setInterval`, DOM events, and I/O operations. The Event Loop moves these callbacks to the Call Stack for execution only after the Call Stack is empty and all Microtasks have been completed."**

**Examples:**

* `setTimeout()` callback
* `setInterval()` callback
* DOM event callbacks
* I/O callbacks

---

### Simple difference for interview:

> **"Web APIs perform the asynchronous work, while the Macrotask Queue stores the callbacks after the work is completed and waits for the Event Loop to execute them."** ✅

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

1. **Execution Context:** JavaScript starts by executing the global context, which is the main code file.
2. **Call Stack:** Functions are pushed onto the Call Stack and executed. If a function contains an asynchronous operation (e.g., `setTimeout`), the operation is offloaded to the browser or Node.js environment.
3. **Task Queues:**
   - When an asynchronous operation completes, its callback is placed into the appropriate queue (Micro Task Queue or Macro Task Queue).
4. **Event Loop:**
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

**Execution Flow:**

1. `'Start'` is logged to the console.
2. `setTimeout` is called, its callback is placed in the Macro Task Queue.
3. `Promise.resolve().then` is called, its callback is placed in the Micro Task Queue.
4. `'End'` is logged to the console.
5. The Call Stack is now empty.
6. The event loop checks the Micro Task Queue and executes the promise callback, logging `'Promise'` to the console.
7. The event loop then checks the Macro Task Queue and executes the timeout callback, logging `'Timeout'` to the console.

**Output:**

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

```

//================================= Closure ========================



1. A closure is the combination of a function and the lexical environment in which it was created.

2 closure in JavaScript function to remember and access variables from its outer (lexical) scope even after the outer function has finished executing.

3. This works because the function maintains a reference to those variables rather than copying their values.

4. Closures are commonly used to maintain state, create private variables, implement callbacks, event handlers, function factories, and memoization.





A closure in JavaScript is a function that remembers and can access variables from its outer (lexical) scope even after the outer function has finished executing. This happens because the function maintains a reference to those variables. Closures are commonly used to maintain state, create private variables, implement callbacks, and build function factories.


### 🔹 Simple Closure Example:

```javascript
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

When a customer visits an online store:

A new shopping cart is created (via a function).

The cart has a private list of items, not accessible directly from outside.

The cart exposes functions to:

Add items

❌ Remove items

👁️ View cart contents

These functions are closures — they retain access to the private list of items, even after the main cart function has executed.

---

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


```
### `var` with Closure and Event Loop Explanation

In the case of **`var`**, only one variable is created because `var` is **function-scoped**.  
The `for` loop does not create a new variable for each iteration.

Each `setTimeout` callback creates a **closure** that references the same variable. The closure remembers the variable reference, not the value at the time the callback was created.

The callbacks do not execute immediately; they are moved to the **Macrotask Queue** after the timer completes.

When the **Event Loop** executes them, the loop has already finished and the variable value has become **5**. Since all callbacks reference the same variable, all callbacks print the same value:

Output:

5
5
5
5


---

### `let` with Closure and Event Loop Explanation

In the case of **`let`**, a new variable is created for each iteration because `let` is **block-scoped**. The `for` loop creates a separate variable binding for every iteration.

Each `setTimeout` callback creates a **closure** that references its own iteration-specific variable. The closure remembers the value of `x` for that particular iteration.

The callbacks do not execute immediately; they are moved to the **Macrotask Queue** after the timer completes.

When the **Event Loop** executes them, the loop has already finished, but each callback has its own separate `x` variable with the value from its respective iteration.

Therefore, each callback prints its own stored value:

Output:

1
2
3
4
```



