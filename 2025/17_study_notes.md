
webworker
webpack
flex-gird

================================================================================
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

================================================================================


### Axios

* Axios is a `third-party HTTP client library` used to communicate with backend APIs.
* `npm install axios` installation is required because Axios is an `external dependency`.
* Axios automatically `parses JSON responses into JavaScript objects` in typical JSON API usage.
* Error checking is usually handled with ``try/catch``, especially when using `async/await`.
* Axios has built-in support for `request and response interceptors` for modifying requests and handling responses globally.
* Axios provides a `simple timeout configuration` to reject requests that take too long.
* Common headers are `easy to configure globally`, which helps avoid repeating the same headers in every request.
* Both Axios and Fetch are `Promise-based`, support `Async/Await`, and support `request cancellation` using `AbortController`.

### Fetch

* Fetch is a `native Web API` used to communicate with backend APIs without installing an external library.

* `No installation is required` because Fetch is available in modern browsers and Node.js environments.
* Fetch requires you to call ``response.json()`` to explicitly parse a JSON response into a JavaScript object.
* Error checking requires checking ``response.ok` or `response.status``, because HTTP errors like `404` or `500` do not automatically reject the Promise.
* Fetch has `no simple built-in timeout option` like Axios; timeout behavior can be implemented using `AbortController`.
* Common headers require `manual configuration or a reusable wrapper` if you want to avoid repeating them.
* Both Axios and Fetch are `Promise-based`, support `Async/Await`, and support `request cancellation` using `AbortController`.



================================================================================


- **`while` Loop**: Checks the condition before executing the code block. If the condition is false initially, the code block inside the loop will not execute at all.

  **Syntax:**
  ```javascript
  while (condition) {
    // Code to execute
  }
  ```

  **Example:**
  ```javascript
  let count = 1;

  while (count > 5) {
    console.log(count);
    count++;
  }

  - **`while` Loop**:
  - Condition is checked before the loop executes.
  - If the condition is false initially, the code block may not execute at all.
  



============================


Let's understand these three terms with JavaScript examples.

### 1. Declaration

Declaration means creating a variable (creating a binding/name) without giving it a value.


```javascript
let name;


---

### 2. Initialization

Initialization means giving a variable its first value at the time it is created.

Example:

let name = "John";

Here:

* `name` is declared.
* `"John"` is the first value given to it.
* This is called initialization.


### 3. Assignment

Assignment means changing or updating the value of an already declared variable.

Example:

let name = "John"; // initialization

name = "David"; // assignment
```

First:

```
name → "John"
```

After assignment:

```
name → "David"
```

  

//=========================== global object =========================
## 1. What is the Global Object in JavaScript?

A **global object** is the top-level object that always exists in the global scope. It provides access to globally available variables, functions, and built-in objects.

- In browsers, the global object is `window`.
- In Node.js, the global object is `global`.
- In modern JavaScript, `globalThis` is the standard way to access the global object across all environments.
- The global object contains built-in APIs such as `setTimeout()`, `setInterval()`, `console`, and more.

> **Note:** In browsers, global variables declared with `var` become properties of the `window` object, whereas `let` and `const` do not.

### Example

```javascript
var name = "Deepak";
let age = 25;

console.log(window.name); // "Deepak"
console.log(window.age);  // undefined

console.log(globalThis.name); // "Deepak"
```
========================================================================
## What is the `window` Object? (Interview Answer)

The **`window` object** is the global object in web browsers.
It represents the browser window (or tab) and provides access to browser-specific APIs and features.

It provides access to:
- `document`
- `location`
- `history`
- `navigator`
- `localStorage`
- `sessionStorage`
- `alert()`
- `setTimeout()`
- `setInterval()`
- `fetch()` and more.

### Example

```javascript
window.alert("Hello");
console.log(window.innerWidth);
```

========================================================================

## What is the `document` Object?

The **`document` object** represents the HTML document loaded in the browser. 
It is a property of the `window` object and is used to access and manipulate the DOM (Document Object Model).

It is used to:
- Access HTML elements
- Modify HTML content and attributes
- Change CSS styles
- Create and remove elements
- Handle DOM events

### Example

```javascript
document.getElementById("demo");
document.querySelector(".btn");


========================================================================-

## Relationship Between `window` and `document`

The `document` object is a property of the `window` object.

window.document === document; // true

window
│
├── document
├── location
├── history
├── navigator
├── localStorage
├── sessionStorage
├── alert()
├── setTimeout()
└── fetch()
```

---

## One-Line Interview Answers

- **Global Object:** The top-level object that provides globally accessible variables, functions, and built-in objects.
- **Window Object:** The global object in browsers that represents the browser window and provides browser-specific APIs.
- **Document Object:** An object that represents the HTML document and provides methods to access and manipulate the DOM.


  




===========================================================================

In JavaScript, a do...while loop is used to execute a block of code at least once before checking a condition, and then it repeatedly executes the block as long as the condition remains true.

do {
  // Block of code to be executed
} while (condition);



  **Syntax:**
  ```javascript
  do {
    // Code to execute
  } while (condition);
  ```

  **Example:**
  ```javascript
  let count = 1;

  do {
    console.log(count);
    count++;
  } while (count > 5);



- **`do...while` Loop**:
  - Code block is executed before the condition is checked.
  - Guarantees at least one execution of the code block.

  
  ### ===========================================================================

### 2. **When to Use**

- **`while` Loop**: Use this when you want to run a block of code as long as a condition is true, 
and you don’t necessarily need to execute the code block if the condition is initially false.


- **`do...while` Loop**: Use this when you need to execute the code block at least once regardless of the condition. 
This is useful when the code block needs to run before any condition is evaluated.


### 3. **Execution Example**

Here’s a practical example showing the difference:

**while` Loop Example:**
```javascript
let num = 0;

while (num > 0) {
  console.log("This won't run because num is 0");
  num--;
}
```

**`do...while` Loop Example:**
```javascript
let num = 0;

do {
  console.log("This will run once, even though num is 0");
  num--;
} while (num > 0);
```





===========================

  Custom Hooks:
  Custom Hooks are a mechanism to reuse stateful logic
  Custom hooks are nothing but these are javascript functions,
  if we have something common logic that we want to share between components
  then we use custom hooks.
  These are logic that will be reused in many components.
  We can create hooks using the name start with “use” keyword.

  {/_
  A custom Hook is basically a JavaScript function.
  Its name begins with "use" that could invoke other Hooks.
  The working of a custom Hook is identical to a regular function.
  The "use" in the starting describes that this particular function conforms to the rules of Hooks.
  Moreover, building custom Hooks enables you to extract component logic inside reusable functions.
  We create a different function and write a shared logic here. _/}





==============================================================

### What are PropTypes?

- `PropTypes` is a library used for `runtime type-checking of props` in React.
- It allows us to define the `expected type` of each prop a component should receive.
- If a component receives an incorrect prop type, React can show a `warning in the console during development`.
- PropTypes can also specify whether a prop is `required` using `.isRequired`.
- It is mainly useful for `catching incorrect prop usage during development`.

Install it with:

```bash
npm install prop-types
```

Example:

```jsx
import PropTypes from "prop-types";

function User({ name, age }) {
  return <h1>{name} - {age}</h1>;
}

User.propTypes = {
  name: PropTypes.string.isRequired,
  age: PropTypes.number.isRequired,
};
```

### Interview answer

PropTypes is a separate library used for runtime type-checking of props in React. We define the expected data type for each prop, such as string, number, or boolean. If an incorrect type is passed, React shows a warning in the development console. We can also use `.isRequired` to indicate that a prop must be provided.”`


===========================================================================

## lexical scope

in JavaScript, lexical scope determines variable accessibility based on where variables
 and functions are declared in the code.


-A lexical scope in JavaScript means that a variable defined outside a function 
can be accessible inside another function

### Function Scope:
Each function in JavaScript creates a new scope. Variables defined within a function are not accessible outside of it.

### Block Scope:
Variables declared with let and const are block-scoped, meaning they are only accessible within the nearest set of curly braces {} in which they are defined.

### Nested Scopes:
Inner functions have access to variables and functions in their outer scopes. This nesting can continue indefinitely, allowing inner functions to access variables from all outer scopes up to the global scope.

function outerFunction() {
  var outerVar = 'I am outside!';

  function innerFunction() {
    var innerVar = 'I am inside!';
    console.log(outerVar); // Accessible
    console.log(innerVar); // Accessible
  }

  innerFunction();
  console.log(outerVar); // Accessible
  // console.log(innerVar); // Uncaught ReferenceError: innerVar is not defined
}

outerFunction();



========================================================================
Scope Chain

Scope chain is the variable lookup process where JavaScript searches from the current scope outward until it finds the required variable.

Scope Chain in JavaScript refers to the process by which JavaScript determines where to look for variables when they're accessed in different scopes. When a variable or function is referenced, JavaScript starts by searching in the current scope. If it doesn't find it there, it moves up to the next outer scope, and this continues until it either finds the variable or reaches the global scope. This process forms a "chain" of scopes, linking inner and outer scopes together.

The scope chain stops when the required variable is found or when the global scope is reached and the variable is not found, leading to a ReferenceError. This mechanism allows inner functions to access variables from outer scopes but not vice versa.

So, your explanation is close, but it’s important to emphasize that the scope chain is about the order in which JavaScript searches for variables, rather than variables or functions "using" each other. The search moves outward from the innermost scope to the global scope.



========================================================================


## Scope Chain vs. Context in JavaScript

### Scope Chain
- **Definition**: The order in which the JavaScript engine looks for variables, starting from the innermost scope and moving outward until it finds the variable or reaches the global scope.
- **Example**:
  ```javascript
  function outer() {
      let outerVar = 'I am outer';
      function inner() {
          console.log(outerVar); // 'I am outer'
      }
      inner();
  }
  outer();
  ```

### Context
- **Definition**: Refers to the value of `this` within a function and is determined by how the function is called.
- **Example**:
  ```javascript
  const obj = {
      value: 42,
      getValue: function() {
          return this.value;
      }
  };
  console.log(obj.getValue()); // 42
  ```



==============================================================

Q12 what is dom ?



-DOM: DOM stands for ‘Document Object Model’.
DOM is a tree-like representation of an HTML document created by the browser.
It represents every HTML element, attribute, and text as objects (nodes).
JavaScript interacts with the DOM through the document object, 
allowing it to access, modify, add, or remove HTML elements,
 attributes, styles, and content dynamically without reloading the page.



-DOM: DOM stands for ‘Document Object Model’.
-It is a structured representation of the HTML elements
that are present in a webpage or web-app.
- JavaScript interacts with the DOM using the document object.  
- The DOM represents all elements, attributes, and content of a web page as objects that can be accessed and manipulated using JavaScript.




- Includes element nodes, text nodes, and attribute nodes.  
- Enables adding, removing, or modifying elements and attributes dynamically.  
- Handles user interactions like clicks, key presses, and other events.  
- Provides methods for navigation (parentNode, childNodes) and modification (setAttribute, appendChild).  
- Allows real-time updates and interactivity in web pages.  



================================================================================

===========================================================================



A framework is a set of pre-written code that provides a structure for developing software applications. 

A library, on the other hand, is a collection of pre-written code that can be used to perform specific tasks.

====

================================================================================================
## lexical scope

in JavaScript, lexical scope determines variable accessibility based on where variables
 and functions are declared in the code.


-A lexical scope in JavaScript means that a variable defined outside a function 
can be accessible inside another function


When a function (Function B) is declared inside another function (Function A), JavaScript uses lexical scoping to determine what variables Function B has access to.
// 🌍 Global scope
let globalVar = "I am global";

function Function_A_outer() {
  // 🔹 Lexical Scope Level 1 (outer)
  let outerVar = "I am outer";

  function Function_b_inner() {
    // 🔸 Lexical Scope Level 2 (inner)
    let innerVar = "I am inner";

    //  Accessing variables through lexical scope
    console.log(globalVar); // ← from Global Scope
    console.log(outerVar);  // ← from outer()'s Lexical Scope
    console.log(innerVar);  // ← from inner()'s own scope
  }

  Function_b_inner(); // Call the inner function
}

Function_A_outer(); // Call the outer function

==========================================================
==============================================================
==============================================================
============================================================================================================================
==============================================================
==============================================================