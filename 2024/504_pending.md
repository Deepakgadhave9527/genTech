webworker
webpack
flex-gird


//========== Constructor function =========================================


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





========================== Prototype ==================================
### Prototype:-
```java
- Prototypes in javaScript objects iinherit properties and method from one another.
- Every object in JavaScript has a prototype,
 -Every JavaScript object has an internal link to another object called its prototype.

#### Why do we need prototypes?

We need prototypes because JavaScript creates a shared method only once and stores it in the constructors prototype. Every object created from that constructor uses this single shared method instead of creating duplicate copies for each object. This improves memory efficiency because only one function exists in memory, even though many objects can call it. When an object tries to access a method, JavaScript first searches the object itself. If the method isn't found, it automatically searches the object's prototype. This lookup process is called the prototype chain.








There are two main ways to set the prototype of an object:

1. By using `__proto__`
   - The `__proto__` property can be used to directly set the prototype of an object.
   let animal = { eats: true };
   let rabbit = { jumps: true };
   rabbit.__proto__ = animal; // Setting the prototype
   console.log(rabbit.eats); // Output: true
   

2. By using `Object.setPrototypeOf()`
   - The `Object.setPrototypeOf(obj, prototype)` method sets the prototype of `obj` to `prototype`.
   let animal = { eats: true };
   let rabbit = { jumps: true };
   Object.setPrototypeOf(rabbit, animal); // Setting the prototype
   console.log(rabbit.eats); // Output: true



--------------------------------------------------------





### Types of Prototypes in JavaScript


Object Prototype
Function Prototype
Prototype Chain

1. Object Prototype

-Every JavaScript object has an internal link to another object called its prototype.
                     
  -This prototype object can also have its own prototype, creating a prototype chain.
   - Every object has a prototype, from which it inherits properties and methods.
   - Access via `Object.getPrototypeOf(obj)` or `obj.__proto__`.

   let obj = {};
   console.log(obj.__proto__); // Output: {}
   

2. Function Prototype
   - Functions have a `prototype` property used when creating objects with `new`.
   - Example:
       function Person(name) {
         this.name = name;
     }
     Person.prototype.greet = function() {
         console.log('Hello, ' + this.name);
     };
     let alice = new Person('Alice');
     alice.greet(); // Output: Hello, Alice
     

3. Prototype Chain
   If a property or method is not found on an object, JavaScript looks for it up the prototype chain until it either finds it or reaches the end (null).

   - Objects inherit properties and methods from their prototype, forming a chain.
   - Example:
       let animal = { eats: true };
     let rabbit = { jumps: true };
     rabbit.__proto__ = animal;
     console.log(rabbit.eats); // Output: true


     
======================= Prototype vs __proto__ ==================================


### prototype:

-To define methods and properties that should be shared by all objects created from a constructor function.
When creating objects using the new keyword.

- Defines properties and methods for constructor functions.
- Exists only on functions (constructor functions).
- Used for inheritance in object creation with new.

### __proto__:

- Accesses or sets the prototype of individual objects.
- Exists on all objects.
-Used to access or set the prototype of an individual object.

prototype is used to define properties and methods for constructor functions.
prototype exists only on functions (specifically, constructor functions).

__proto__ is used to access or set the prototype of an individual object.
__proto__ exists on all objects.


========================================================================
 difference between `__proto__` and `Object.setPrototypeOf()` 

### By using `__proto__`
- Introduced in early JavaScript implementations (pre-ES3).
 - Legacy, deprecated, and slower.
  - Still supported for backward compatibility.
  - Simple but not suitable for modern applications.


### By using `Object.setPrototypeOf()`
- Introduced in ECMAScript 2015 (ES6).
-  `Object.setPrototypeOf()`:
  - Modern, standardized, and better optimized.
  - Recommended for modern JavaScript and production environments. 
