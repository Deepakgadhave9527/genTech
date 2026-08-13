



### 1. Looping through objects

const user = { name: "Rahul", age: 25 };

for (let key of Object.keys(user)) {
  console.log(key, user[key]);
}

Output:

name Rahul
age 25

### 2. Converting object to array (for map/filter)

const prices = { apple: 100, banana: 50, mango: 80 };

const updated = Object.entries(prices).map(([fruit, price]) => {
  return [fruit, price + 10];
});

console.log(updated);

Output:

[["apple", 110], ["banana", 60], ["mango", 90]]



### 3. Working with dynamic API data

const apiData = {
  id: 1,
  title: "Post",
  status: "active"
};

Object.entries(apiData).forEach(([key, value]) => {
  console.log(`${key} => ${value}`);
});


Output:

id => 1
title => Post
status => active




==============================================================

4. Difference between “ == “ and “ === “ operators.
Both are comparison operators.
The difference between both the operators is that “==” is used to compare values whereas,
 “ === “ is used to compare both values and types.




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








==============================================================


## 1. `splice()`

* **Purpose:** Modify the original array by **adding**, **removing**, or **replacing** elements.
* **Mutates:** Yes — it changes the original array.
* **Returns:** An array of the removed elements (if any).
* **Syntax:**

  ```js
  array.splice(startIndex, deleteCount, item1, item2, ...)
  ```
* **Parameters:**

  * `startIndex` — position to start changing the array
  * `deleteCount` — number of elements to remove from `startIndex`
  * `item1, item2, ...` — elements to add starting at `startIndex`

### Example:

```js
const arr = [1, 2, 3, 4, 5];

// Remove 2 elements starting at index 1, and insert 'a', 'b'
const removed = arr.splice(1, 2, 'a', 'b');

console.log(arr);      // Output: [1, 'a', 'b', 4, 5]
console.log(removed);  // Output: [2, 3]
```

---

## 2. `slice()`

* **Purpose:** Extract a portion of the array and return it as a **new array**.
* **Mutates:** No — original array stays unchanged.
* **Returns:** A new array with the selected elements.
* **Syntax:**

  ```js
  array.slice(startIndex, endIndex)
  ```
* **Parameters:**

  * `startIndex` — start extracting from this index (inclusive)
  * `endIndex` — stop extracting before this index (exclusive)

### Example:

```js
const arr = [1, 2, 3, 4, 5];

// Extract elements from index 1 up to (but not including) index 4
const newArr = arr.slice(1, 4);

console.log(arr);     // Output: [1, 2, 3, 4, 5]
console.log(newArr);  // Output: [2, 3, 4]
```
----------------------------------------------------------------------

In React.js, splice and slice are both methods used to manipulate arrays,
 but they have different purposes:

- splice()  :
  - Changes the contents of an array by removing or replacing existing elements and/or adding new elements.
  - Modifies the original array in place.
  - Syntax: array.splice(startIndex, deleteCount, item1, item2, ...)
  - startIndex: The index at which to start changing the array.
  - deleteCount: The number of elements to remove from the array (if set to 0, no elements are removed).
  - Example:
    
    const array = [1, 2, 3, 4, 5];
    array.splice(2, 1); // Removes 1 element starting from index 2
    // Result: array is now [1, 2, 4, 5]
  
    

- slice():
  - Returns a shallow copy of a portion of an array into a new array object selected from startIndex to endIndex (endIndex is not included).
  - Does not modify the original array.
  - Syntax: array.slice(startIndex, endIndex)
  - startIndex: The index at which to begin the extraction (inclusive).
  - endIndex: The index before which to end the extraction (exclusive).
  - Example:
    
    const array = [1, 2, 3, 4, 5];
    const newArray = array.slice(1, 4); // Returns a new array with elements from index 1 to index 3
    // Result: newArray is [2, 3, 4]
  

In short, splice changes the original array by adding, removing, or replacing elements, 
while slice returns a portion of the array as a new array without modifying the original.



==============================================================




arr.splice(0) removes all elements from the array and returns them, leaving the array empty.
arr.splice(-n) removes the last n elements from the array and returns them.
arr.splice(-n, 0, item1, item2, ...) inserts elements before the last n elements without removing any


==============================================================



* **`Object.freeze()`** → cannot add, remove, or modify any properties of the object (completely immutable).
* **`Object.seal()`** → you can update existing properties, but can’t add new or delete.
* **`Object.preventExtensions()`** → you can update and delete properties, but can not add new properties.


By default in non-strict mode, freeze, seal, and preventExtensions do not throw errors — they just silently fail.

But in strict mode ('use strict';), operations that break these rules will throw a TypeError.*.



==============================================================



Object.freeze()
Object.seal()
Object.preventExtensions()



Object.freeze():=cannot add, remove, or modify any properties of the object compltede immutable
Object.seal():=you can update exastiting properties, but cant add new or delete
Object.preventExtensions():=you can update and delete properties ,but can not add new properties




Object.freeze(), Object.seal(), and Object.preventExtensions() are 
all methods in JavaScript used for controlling object mutability,
 but they have different levels of restriction.

1. Object.freeze(): 
   - This method completely freezes an object, making it immutable. 
   - Once an object is frozen, you cannot add, remove, or modify any properties of the object.
   - This means that the object becomes "read-only."
   - Example:
     
     const obj = { prop: 1 };
     Object.freeze(obj);
     obj.prop = 2; // This will fail silently or throw an error in strict mode
    

2. Object.seal():
- This method prevents new properties from being added to an object,
- You cannot add or remove properties from a sealed object.
- You can still modify existing properties' values.

   - Example:
     
     const obj = { prop: 1 };
     Object.seal(obj);
     obj.prop = 2; // This will change the value of 'prop'
     obj.newProp = 3; // This will fail silently or throw an error in strict mode
    

3. Object.preventExtensions():
   - you cannot addd  new properties  added to an object,
    but it allows existing properties to be modified or deleted.
   - Essentially, it makes an object non-extensible.

   - Example:
     
     const obj = { prop: 1 };
     Object.preventExtensions(obj);
     obj.prop = 2; // This will change the value of 'prop'
     obj.newProp = 3; // This will fail silently or throw an error in strict mode
     delete obj.prop; // This will delete the 'prop' property
    


In summary, 
 Object.freeze() makes an object completely immutable, 
Object.seal() makes it so you can modify existing properties but not add or remove them,
Object.preventExtensions() only prevents new properties from being added while allowing existing properties to be modified or removed.



==============================================

### stringify

- `JSON.stringify()` takes a JavaScript object and transforms it into a JSON string.

// Converting a JavaScript object to a JSON string
const jsObject = {name: "Jane", age: 25, city: "Chicago"};
const jsonStr = JSON.stringify(jsObject);
console.log(jsonStr); // Output: '{"name":"Jane","age":25,"city":"Chicago"}'

### parse

- `JSON.parse()` takes a JSON string and transforms it into a JavaScript object.

```javascript
// Converting a JSON string to a JavaScript object
const jsonString = '{"name":"John", "age":30, "city":"New York"}';
const jsonObject = JSON.parse(jsonString);
console.log(jsonObject);  // Output: {name: "John", age: 30, city: "New York"}


==============================================

- **`for...in`**: Iterates over object keys (properties).
- **`for...of`**: Iterates over iterable values (arrays, strings, etc.).

Use `for...in` for objects, `for...of` for arrays and other iterables.

const obj = { a: 1, b: 2, c: 3 };

for (let key in obj) {
console.log(key); // Output: "a", "b", "c"
console.log(obj[key]); // Output: 1, 2, 3 (corresponding values)
}

const arr = [1, 2, 3];

for (let value of arr) {
console.log(value); // Output: 1, 2, 3
}

### Rule to remember:

Use dot notation (.) → when the property name is fixed and known.
Use bracket notation ([]) → when the property name is dynamic or comes from a variable.

That is why for...in almost always uses:

for (let key in user) {
console.log(user[key]);

for...in is not recommended for arrays because it iterates over object properties (keys), not array elements. It can also iterate over inherited or custom properties added to the array.

For arrays, we should use for...of, forEach, or normal for loops.

======================================================

### `for...of`

- Use when you only need **array values** and want simple iteration.
- It is useful for displaying items or processing each item.
- It gives the **value directly**, not the index.

Example:

```javascript
const items = ["Apple", "Banana", "Mango"];

for (const item of items) {
  console.log(item);
}
```

---

### `forEach()`

- Use when you want to perform an action on **every item**.
- It is useful for logging, updating UI, or running side effects.
- You cannot use `break` or `continue` inside `forEach()`.
- It does not return a new array.

Example:

```javascript
const items = ["Apple", "Banana", "Mango"];

items.forEach((item) => {
  console.log(item);
});
```

---

### Normal `for` loop

- Use when you need **index control**.
- Useful when you need `break`, `continue`, custom steps, or reverse looping.
- Good for complex logic or performance-sensitive code.

Example:

```javascript
const items = ["Apple", "Banana", "Mango"];

for (let i = 0; i < items.length; i++) {
  console.log(items[i]);
}
```

### Quick rule:

- Need only values → use **`for...of`**
- Need to run something for every item → use **`forEach()`**
- Need index or more control → use **normal `for` loop**

======================================================

- **`map()`**: Transforms each element of an array and returns a new array.
- **`for...of`**: Iterates over values of an iterable (like arrays, strings) one by one.

=======================================================
flat()== method creates a new array with all sub-array elements concatenated into it recursively up to the specified
depth.\*\*
arr = [1, 2, [3, 4, [5, 6, [7, 8, [9, 10]]]]];
arr.flat(Infinity);
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

================================================================================
How many way object will create


1. Object Literal
2. Object Constructor
3. The new Keyword
4. Object.assign()
5. Object.create()
6. Object.fromEntries()

1. **Using Object Literal:**
   const obj = {
     name: "John",
     age: 30,
   };


2. **Using Object Constructor:**
   const obj = new Object();
   obj.name = "John";
   obj.age = 30;

3. **Using the new Keyword:**
   function ObjectName(name, age) {
     this.name = name;
     this.age = age;
   }
   const obj = new ObjectName("John", 30);


4. **Using Object.assign():**
   const obj = Object.assign({}, { name: "John", age: 30 });

5. **Using Object.create():**
   const protoObj = { name: "John", age: 30 };
   const obj = Object.create(protoObj);

6. **Using Object.fromEntries():**
   const entries = [['name', 'John'], ['age', 30]];
   const obj = Object.fromEntries(entries);

   
================================================================================



1. **Split Method**:
   - Splits a string into an array of substrings based on a specified separator.
   const str = "Hello,World";
   const arr = str.split(","); // ['Hello', 'World']
   

2. **Reverse Method**:
   - Reverses the order of elements in an array.
   const arr = [1, 2, 3, 4, 5];
   arr.reverse(); // [5, 4, 3, 2, 1]
   

3. **Join Method**:
   - Joins all elements of an array into a single string, separated by a specified separator.
   const arr = ['Hello', 'World'];
   const str = arr.join(", "); // 'Hello, World'
   

These examples demonstrate how each method works in a simple and straightforward manner.



================================================================================



### Differences between `map()` and `forEach()`

b
1. **Return Value**:

   * `map()` returns a **new array** with transformed elements.
   * `forEach()` returns **undefined**.

2. **Immutability**:

   * `map()` is **immutable** — it does not change the original array.
   * `forEach()` is **mutable** — it can change the n original array **if you modify elements inside the loop**.
   * ➕ If you don't modify anything inside `forEach()`, the array remains unchanged — but it's **capable of mutating**.

3. **Chaining**:

   * `map()` supports **chaining** other array methods like `filter()`, `reduce()`, etc.
   * `forEach()` does **not support chaining** since it returns `undefined`.

4. **Purpose / Use Case**:

   * Use `map()` when you want to **transform and return a new array**.
   * Use `forEach()` when you just need to **loop through items** and perform **side effects** (like logging or DOM updates), without returning anything.

---


Use map() when you want to transform and return a new array.
Use forEach() when you just need to loop through items and perform side effects (like logging or DOM updates), without returning anything.



==============================================================

Constructor function
-A constructor function in JavaScript is a regular function used to create and initialize multiple objects with the same structure
- By convention, constructor function names start with a capital letter and 

-are called using the new keyword.

- when creating many objects with the same properties
- this is simply a reference to the newly created object when the constructor is called with new.

```js
 function Person(name, age) {
     this.name = name;
     this.age = age;
 }


 const p1= new Person("Alice", 30);
 const p2 = new Person("haery",20);
// add property city to p1
 p1.city=`nanande`;

 //adding method to p1
 p1.address = function(){
    return `${this.name} lives in ${this.city}.`;

 }

// add method in Person prototype
 Person.prototype.biodate= function(){
    console.log(this);
     return `${this.name} is ${this.age} years old and lives in ${this.city}.`;
 }
  

 console.log(p1)
  console.log(p2)

```
 Methods added to the prototype are shared by all objects created from the constructor. JavaScript stores only one copy of the method in the prototype, and every object accesses that same method through the prototype chain. This saves memory because a new copy of the method is not created for each object.


Objects created from a different constructor cannot access those methods unless inheritance or a shared prototype is used.

## Constructor Function in JavaScript

### 🔹1. Default Behavior of Constructor Functions

In JavaScript, when you use a `constructor function` with `new`, it automatically returns the new object instance unless you `explicitly return an object`.

```js
function Person(first, last) {
  this.firstName = first;
  this.lastName = last;
}

const person1 = new Person("John", "Doe");
console.log(person1); //  Person { firstName: 'John', lastName: 'Doe' }
```

---

### 🔹2. Returning a `Primitive` from a Constructor

If a constructor explicitly returns a `primitive value` (like a string, number, boolean, etc.), `that return value is ignored`, and the newly created object is returned instead.

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

### 🔹3. Returning an `Object` from a Constructor

If a constructor explicitly returns an `object`, that object `overrides` the default `this`.

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

This example is labeled as `"returning a primitive"` but wrongly states that the object is replaced. It should clarify that `the primitive is ignored`, and the object is returned.

---

##  Summary

| Return Type       | What Happens                      |
| ----------------- | --------------------------------- |
| Nothing (default) | `this` (new instance) is returned |
| Primitive         | Ignored, `this` is still returned |
| Object            | Returned instead of `this`        |

---

If you're writing this for documentation or teaching, I’d recommend presenting `two clearly separated examples`, like above, with matching labels. Let me know if you’d like a polished markdown or HTML version.




#  JavaScript Type Coercion

`Type coercion in JavaScript` means converting values from one type to another — either automatically (implicit) or manually (explicit).

- `Implicit coercion` happens automatically (e.g., `'5' + 1` → `'51'`).
- `Explicit coercion` is done deliberately using `Number()`, `String()`, `Boolean()`, etc.

> \ To avoid bugs prefer `explicit conversion` and `strict equality (`===`)`.


## 🔹 Types of Coercion

### 1. Implicit Coercion (Automatic)

JS converts types automatically when an operation requires it:

```js
console.log(1 + "2");   // "12"   (number → string, concatenation)
console.log(1 - "2");   // -1     (string → number, subtraction)
console.log("5" - "2"); // 10     (both strings → number)
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

### 🔸 `+` prefers `strings`

```js
'5' + 1         // "51"
false + '1'     // "false1"
"Hello " + 5    // "Hello 5"
```

### 🔸 `-`, `*`, `/` prefer `numbers`

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

- `Falsy values:`
  `false, 0, -0, 0n, "", null, undefined, NaN`

- `Truthy values:`
  Everything else (for example: `"0"`, `"false"`, `[]`, `{}`, `function(){}`).

---

##  Operator Preferences Summary

| Operator      | Coercion Preference |
| ------------- | ------------------- |
| `+`           | `Strings`         |
| `-`, `*`, `/` | `Numbers`         |

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

✔️ Use `strict equality (`===`)` instead of `==`.
✔️ Use `explicit conversion` for clarity.

---

## 🔁 Quick Conversion Rules (Cheat Sheet)

- `+` with a string → `string concatenation`.
- `-`, `*`, `/`, `%` → operands coerced to `numbers`.
- `if(...)`, `while(...)`, `||`, `&&` → values coerced to `boolean` (truthy/falsy).
- `==` → performs type conversion (many special cases).
- `===` → compares `without coercion`.



