
===========================================================================

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






================================================================================

**Why is `console.log(obj2)` empty?**

Because `Object.create()` creates an object with the given object as its prototype, not its own properties.

```js
var obj2 = Object.create({ name: "av5" });
console.log(obj2);          // 👉 Outputs: {}
console.log(obj2.name);     // 👉 Outputs: "av5"

obj2 = {
  // No own properties
  __proto__: {
    name: "av5"
  }
}
```

`console.log(obj2)` shows `{}` because `obj2` has no own properties — it inherits `name` from its prototype.
`Object.create()` sets the passed object as the prototype, not as direct properties.





   

=========================================================================

================================================================================================================================================================
Single-Threaded Execution:

JavaScript executes code in a single-threaded manner, meaning one operation is performed at a time.
The event loop helps manage this single-threaded execution, especially for asynchronous tasks.





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


  



========================================================================



8. When to Use Map
Use a Map when:

You need non-string keys.
You need to maintain the order of entries.
You need efficient lookups and insertions.
You want built-in iteration over entries.

Use an object when:

You need simple key-value pairs with string keys.
You want inheritance or prototype-based features.



========================= ===============================================

### Set vs. Map
#Map
A Map is a built-in JavaScript object that stores key-value pairs.

A key value pair is called an entry
Keys in a Map must be unique, 
while values can be duplicated.

  - Stores: Key-value pairs.
  - Uniqueness: Keys must be unique; values can be duplicated.
  - Methods: `set(key, value)`, `get(key)`, `delete(key)`, `has(key)`, `size`.

It allows you to associate each key with a specific value and provides efficient methods for adding, retrieving, and deleting key-value pairs.
------------------------------------
- Set:
 - Definition: A `Set` stores unique values, with no key-value pairs. It automatically removes duplicates.

  - Key-Value: No key-value pairs.
  - Uniqueness: Ensures all values are unique.
  - Methods: `add(value)`, `delete(value)`, `has(value)`, `size`.

 has(value): Check if a value exists in the Set.
forEach(callback): Iterates through the Set.
keys(), values(), entries(): Provides iterators for advanced use cases.
clear(): Clears the entire Set.




### `Object.assign({}, obj1, obj2)` vs `Object.assign(obj1, obj2)` (Theoretical Answer)

`Object.assign()` is used to **copy properties from one or more source objects into a target object**.

Syntax:

```javascript
Object.assign(target, source1, source2, ...)
```

The **first parameter is always the target object**. All remaining parameters are source objects.

---

### 1. `Object.assign({}, obj1, obj2)`

Here, `{}` is the target object.

* A new empty object is created.
* Properties from `obj1` and `obj2` are copied into this new object.
* The original `obj1` and `obj2` objects are not modified.
* It is commonly used to create a shallow copy of objects.

Example:

```javascript
Object.assign({}, obj1, obj2);
```

Result:

```javascript
{
  name: "Rahul",
  age: 25
}
```

But `obj1` remains:

```javascript
{
  name: "Rahul"
}
```

---

### 2. `Object.assign(obj1, obj2)`

Here, `obj1` is the target object.

* Properties from `obj2` are copied directly into `obj1`.
* The original `obj1` object is modified.
* This is called **object mutation**.

Example:

```javascript
Object.assign(obj1, obj2);
```

After execution:

```javascript
obj1 = {
  name: "Rahul",
  age: 25
}
```

---

### Main Difference

| `Object.assign({}, obj1, obj2)` | `Object.assign(obj1, obj2)`              |
| ------------------------------- | ---------------------------------------- |
| Creates a new object            | Modifies existing object                 |
| Does not mutate original object | Mutates `obj1`                           |
| Used for immutability           | Used for updating an object directly     |
| Returns a new object reference  | Returns the same target object reference |

---

### React Interview Perspective

In React, immutability is preferred because React detects changes using object references.

Therefore, developers usually use:

```javascript
Object.assign({}, oldObject, updatedValues)
```

or the spread operator:

```javascript
{
  ...oldObject,
  ...updatedValues
}
```

instead of directly modifying the existing state object.


