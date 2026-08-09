
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