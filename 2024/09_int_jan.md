
```js

## Lexical Scope

In JavaScript, `lexical scope determines variable accessibility based on where variables and functions are declared in the code.`

-`A lexical scope in JavaScript means that a variable defined outside a function 
can be accessible inside another function`


* A function can access variables declared in `its own scope and its outer (parent) scopes`.

* If a function is declared inside another function, the inner function can access variables from the outer function.

* However, the outer function `cannot access variables declared inside the inner function`.


let a = 10;

function A() {
  let b = 20;

  function B() {
    let c = 30;

    console.log(a); // ✅
    console.log(b); // ✅
    console.log(c); // ✅
  }

  console.log(c); // ❌
}




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





in JavaScript, lexical scope determines variable accessibility based on where variables
 and functions are declared in the code.



When a function (Function B) is declared inside another function (Function A), JavaScript uses lexical scoping to determine what variables Function B has access to.

========================================================================

Lexical scope = rule

Where a function is written determines which variables it can access.

Closure = behavior

When that function is retained and used later, it can still access those outer variables. c

Example:

function outer() {
  let count = 0;

  function inner() {
    count++;
    console.log(count);
  }

  return inner;
}

const counter = outer();

counter(); // 1
counter(); // 2
counter(); // 3

`Lexical scope:`
`inner()` is written inside `outer()`, so it can access `count`.

`Closure:`
`outer()` has already finished, but `counter` still remembers/accesses `count`.

So your definition is excellent:

> `Lexical scope = rule` → *Where the function is written determines what it can access.*

> `Closure = behavior` → *The function retains access to those outer variables when used later.*

One small refinement: a closure doesnt necessarily require the function to be called "later"; technically, a closure is the `function together with its preserved lexical environment`.


========================================================================
Flexbox:

One-dimensional layout model.
Best for arranging items in a row or a column.
Suited for smaller-scale layouts.
Controls alignment and distribution along a single axis.
Uses properties like display: flex, flex-direction, justify-content, and align-items.



CSS Grid:

Two-dimensional layout system.
Organizes content in rows and columns.
Ideal for larger-scale layouts.
Provides precise control over layout and placement of items
Utilizes properties like display: grid, grid-template-rows, and grid-template-columns.

====================================

### `Difference between nullish coalescing (??) and logical OR (||).`

?? and || both provide a fallback value, but they check different conditions.

1] Logical OR (||) returns the right-hand value when the left-hand value is falsy.

Falsy values affected by ||:

false
0
""
null
undefined
NaN


const name = "" || "Guest";
console.log(name); // Guest




b] Nullish coalescing (??) returns the right-hand value only when the left-hand value is `"null or undefined.`"

const name = null ?? "Guest";
console.log(name); // Guest

