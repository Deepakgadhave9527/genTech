
=============== memoization ===================================



### What does memoizing mean?

Memoization is a technique where the result of a function call is cached (stored), so if the same inputs occur again, the cached result is returned immediately instead of recalculating.

========================================================================
## Memoization

Memoization is an optimization technique that stores (caches) the result of an 
expensive function so that if the function is called again with the same inputs, 
it returns the cached result instead of recalculating it.

This improves performance by avoiding repeated computations.

- It is especially useful for functions with heavy calculations,
 recursive algorithms, or repeated inputs.

- memoization only provides a benefit when the same inputs occur again.

- If the input is different, there's no cache entry for it, 
so the function must compute the result normally and then store it.

- Memoization is an optimization technique that improves the performance of functions 
by caching the results of expensive function calls.
When the same inputs occur again, 
the function returns the stored (cached) result instead of recomputing it.


==============================================================

Immediately Invoked Function Expression (IIFE)


IIFE is a JavaScript function that runs immediately after it is created / defined.


- It is often used to create a local scope to avoid polluting the global scope.

- Runs code immediately after declaration, useful for initialization tasks, c
onfiguring settings, or starting applications at the desired moment.


(function() {
console.log("This function runs immediately!");
})();

(function(name) {
console.log("Hello, " + name + "!");
})("World");




| Feature                    | Purpose                                                    |
| -------------------------- | ---------------------------------------------------------- |
| Encapsulation          | Creates private scope for variables/functions              |
| Avoid Global Pollution | Prevents global variable name conflicts                    |
| Data Privacy           | Hides internal data using closures                         |
| Module Pattern         | Exposes only required functions and keeps the rest private |






Encapsulation: Creates private scopes for variables and functions, preventing conflicts and unintended modifications in the global scope.

Avoiding Global Pollution: Keeps the global namespace clean, minimizing naming clashes with other scripts or libraries and maintaining modular, self-contained code.


Data Privacy: Utilizes closures to maintain data privacy, hiding internal variables and functions while exposing only necessary parts, fundamental to the Module Pattern.


==============================================================


why arrow functions ?

-Arrow functions do not have their own this context; instead, 
they inherit this from the parent scope at the time they are defined.

This is especially useful in:
Callbacks
Event handlers

 - Lexical this binding, avoiding this confusion.
- Concise syntax for defining functions.
- no need to return for single-expression functions.
- No binding of arguments object.
- Convenient for use in callbacks, especially with array methods.

Arrow functions streamline JavaScript code 
making it shorter, clearer, and more expressive, particularly in modern development practices
.

==============================================================
 
Explain Hoisting in javascript.

Hoisting is the default behaviour of javascript where the variable and function declarations to the top of their scope before code execution.



Hoisting is a **JavaScript behavior** where **variable and function declarations are moved to the top of their scope** (global or function) **before code execution**.

* **Variables declared with `var`** are **hoisted and initialized with `undefined`**.
* **`let` and `const`** are hoisted but **not initialized** (they are in a “temporal dead zone” until their declaration).
* **Function declarations** are hoisted **with their entire definition**, so they can be called before they appear in the code.
* **Function expressions** (assigned to a variable) behave like variables: hoisted only as **undefined** if declared with `var`.

---

### **Examples**

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

 **Key points:**

* Hoisting moves **declarations**, not **initializations**.
* `var` → undefined, `let/const` → temporal dead zone, function declarations → fully hoisted.




Hoisting is the default behaviour of javascript where  the variable and function
declarations are moved on top during the compilation phase


==============================================================

4. Difference between “ == “ and “ === “ operators.
Both are comparison operators.
The difference between both the operators is that “==” is used to compare values whereas,
 “ === “ is used to compare both values and types.




==============================================================



##  Correct Explanation of Constructor Function Behavior in JavaScript

### 🔹1. Default Behavior of Constructor Functions

In JavaScript, when you use a **constructor function** with `new`, it automatically returns the new object instance unless you **explicitly return an object**.

```js
function Person(first, last) {
  this.firstName = first;
  this.lastName = last;
}

const person1 = new Person("John", "Doe");
console.log(person1); //  Person { firstName: 'John', lastName: 'Doe' }
```

---

### 🔹2. Returning a **Primitive** from a Constructor

If a constructor explicitly returns a **primitive value** (like a string, number, boolean, etc.), **that return value is ignored**, and the newly created object is returned instead.

```js
function Person(first, last) {
  this.firstName = first;
  this.lastName = last;

  return "Hello"; // 🔴 This return is ignored
}

const person2 = new Person("Jane", "Doe");
console.log(person2); //  Person { firstName: 'Jane', lastName: 'Doe' }
```

> ✔️ `this` is still returned, not the string `"Hello"`.

---

### 🔹3. Returning an **Object** from a Constructor

If a constructor explicitly returns an **object**, that object **overrides** the default `this`.

```js
function Person(first, last) {
  this.firstName = first;
  this.lastName = last;

  return { custom: "object" }; //  This replaces the created object
}

const person3 = new Person("Alice", "Smith");
console.log(person3); //  { custom: 'object' }
```

---

### 🔹4. Your Incorrect/Mismatched Example

You wrote:

```js
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
console.log(myFather); 
// ❌ You wrote: Outputs Person {...}
//  Actually: Still returns the object, NOT the string
```

This example is labeled as **"returning a primitive"** but wrongly states that the object is replaced. It should clarify that **the primitive is ignored**, and the object is returned.

---

##  Summary

| Return Type       | What Happens                      |
| ----------------- | --------------------------------- |
| Nothing (default) | `this` (new instance) is returned |
| Primitive         | Ignored, `this` is still returned |
| Object            | Returned instead of `this`        |

---

If you're writing this for documentation or teaching, I’d recommend presenting **two clearly separated examples**, like above, with matching labels. Let me know if you’d like a polished markdown or HTML version.


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

Primitives are not objects and cannot hold properties or behavior, whereas non-primitives (objects) can hold properties and methods.


=========================================

#  JavaScript Type Coercion

**Type coercion in JavaScript** means converting values from one type to another — either automatically (implicit) or manually (explicit).

* **Implicit coercion** happens automatically (e.g., `'5' + 1` → `'51'`).
* **Explicit coercion** is done deliberately using `Number()`, `String()`, `Boolean()`, etc.

> \ To avoid bugs prefer **explicit conversion** and **strict equality (`===`)**.


## 🔹 Types of Coercion

### 1. Implicit Coercion (Automatic)

JS converts types automatically when an operation requires it:

```js
console.log(1 + "2");   // "12"   (number → string, concatenation)
console.log(1 - "2");   // -1     (string → number, subtraction)
console.log("5" * "2"); // 10     (both strings → number)
console.log(1 == "1");  // true   (loose equality coerces string → number)
```

### 2. Explicit Coercion (Manual)

You convert types on purpose:

```js
console.log(Number("123"));   // 123
console.log(String(456));     // "456"
console.log(Boolean(0));      // false
console.log(Boolean("hi"));   // true
```

---

##  Implicit Coercion — Operator behaviors & examples

### 🔸 `+` prefers **strings**

```js
'5' + 1         // "51"
false + '1'     // "false1"
"Hello " + 5    // "Hello 5"
```

### 🔸 `-`, `*`, `/` prefer **numbers**

```js
'5' - 1         // 4
true + 1        // 2       (true → 1)
true + true     // 2
null + 1        // 1       (null → 0)
undefined + 1   // NaN     (undefined → NaN)
```

### 🔸 Comparison with `==` (loose equality)

```js
0 == false           // true
" " == 0             // true
null == 0            // false
undefined == null    // true
```

### 🔸 Boolean Context

```js
if ("") console.log("runs");       // doesn't run ("" is falsy)
if ("hello") console.log("runs");  // runs ("hello" is truthy)
```

---

##  Truthy & Falsy Values

* **Falsy values:**
  `false, 0, -0, 0n, "", null, undefined, NaN`

* **Truthy values:**
  Everything else (for example: `"0"`, `"false"`, `[]`, `{}`, `function(){}`).

---

##  Operator Preferences Summary

| Operator      | Coercion Preference |
| ------------- | ------------------- |
| `+`           | **Strings**         |
| `-`, `*`, `/` | **Numbers**         |

---

##  Explicit Type Coercion (manual conversions)

```js
Number('5')       // 5
String(10)        // "10"
Boolean(0)        // false
parseInt('42')    // 42
'' + 123          // "123"   // shortcut to string
```

---

##  Loose (`==`) vs Strict (`===`) equality — Best Practice

```js
0 == false   // true   (coerced)
0 === false  // false  (no coercion)
```

✔️ Use **strict equality (`===`)** instead of `==`.
✔️ Use **explicit conversion** for clarity.

---

## 🔁 Quick Conversion Rules (Cheat Sheet)

* `+` with a string → **string concatenation**.
* `-`, `*`, `/`, `%` → operands coerced to **numbers**.
* `if(...)`, `while(...)`, `||`, `&&` → values coerced to **boolean** (truthy/falsy).
* `==` → performs type conversion (many special cases).
* `===` → compares **without coercion**.




==============================================================

```js
(null == undefined) // true  
(null === undefined) // false  
```

**null:**
Type: object
Represents an intentional "no value" set by the programmer.

**undefined:**
Type: undefined
Typically means a variable has been declared but not assigned a value yet.

**Why `==` considers them equal:**
Both `null` and `undefined` represent absence of a value or non-existence. Therefore, when using loose equality (`==`), JavaScript treats them as equal.

**Why `===` considers them different:**
In strict equality (`===`), JavaScript compares both value and type. Since `null` and `undefined` have different types (`object` and `undefined`), they are not equal.




