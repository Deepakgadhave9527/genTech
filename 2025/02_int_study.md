

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

