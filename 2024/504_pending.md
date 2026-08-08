webworker
webpack
flex-gird

================================================================================

================================================================================

Webpack

Webpack is a popular open-source module bundler for JavaScript applications.

It's primarily used in web development to bundle JavaScript files for usage in a browser,
It's managing dependencies and bundling various assets like JavaScript files, images,
and CSS into a single bundle,

Webpack's behavior is configured through a webpack.config.js file.
Plugins is used Webpack's functionality for tasks like optimization, asset management,
It's widely used in modern web development, often alongside frameworks like React, Vue.js, or Angular.

Here's a more refined version of your explanation with a bit more clarity and flow:

---

### **Webpack**:

**Webpack** is a popular **open-source module bundler** primarily used for **JavaScript applications** in modern web development.

- **Purpose**:  
  Webpack is used to **bundle JavaScript files** and other assets like **CSS**, **images**, and **fonts** into one or more output files that are optimized for use in a browser. This helps reduce the number of requests the browser needs to make, improving performance.

- **Managing Dependencies**:  
  Webpack analyzes the dependencies between different modules (JavaScript files, CSS, images) in your app and bundles them efficiently, ensuring that only the necessary files are loaded by the browser.

- **Configuration**:  
  Webpack’s behavior is controlled through a configuration file, typically named `webpack.config.js`. This file specifies how to handle different types of files, manage the bundling process, and define optimization strategies.

- **Loaders**:  
  Webpack uses **loaders** to process and transform files before bundling them. For example, **`babel-loader`** can be used to transpile modern JavaScript (ES6, JSX) into backward-compatible versions for older browsers.

- **Plugins**:  
  **Plugins** enhance Webpack's functionality by performing tasks like:
  - **Optimization**: Minimizing file sizes for faster load times (e.g., **TerserPlugin** for JavaScript minification).
  - **Asset Management**: Handling images, fonts, and other static resources.
  - **Code Splitting**: Breaking large bundles into smaller chunks to optimize loading (e.g., per route or feature).
  - **Generating HTML**: Injecting the final bundles into an HTML template (e.g., **HtmlWebpackPlugin**).

- **Use with Frameworks**:  
  Webpack is widely used alongside modern front-end frameworks like **React**, **Vue.js**, and **Angular**. It is an essential part of the development setup for many JavaScript applications.

### In Summary:

Webpack bundles your application’s assets and optimizes them for the browser, 
while **loaders** and **plugins** provide flexibility to handle various file types 
and enhance functionality. It is an essential tool in modern web development, 
particularly for single-page applications (SPAs) built with frameworks like React.

---

This version organizes the points more clearly and offers a bit more explanation about Webpack's core features and how it's used in real-world projects.

---

'**Webpack**:  
A **module bundler** for JavaScript applications, used to bundle JavaScript, CSS, images, and other assets into optimized files that are more efficient for browsers to load. It is commonly used in **React** and other modern JavaScript frameworks to improve performance and streamline development.

### Key Features of Webpack:

- **Module Bundling**:  
  Webpack analyzes your app's dependency graph (starting from an entry file like `index.js` or `app.js`), and bundles all modules (JavaScript, CSS, images, etc.) into a smaller number of optimized files for the browser.

- **Loaders**:  
  Loaders enable Webpack to process different types of files. For example:
  - **`babel-loader`** transpiles modern JavaScript (ES6, JSX) into older versions (like ES5) that can run on more browsers.
  - **`css-loader`** and **`style-loader`** process CSS files and inject them into the DOM.
  - **`file-loader`** or **`url-loader`** can manage assets like images or fonts.

- **Plugins**:  
  Plugins extend Webpack’s functionality and perform additional tasks like:
  - **Minification**: Reduce file sizes (e.g., **`TerserPlugin`** for JS minification).
  - **`HtmlWebpackPlugin`**: Generates an `index.html` file with injected script tags for the bundled JavaScript.
  - **`DefinePlugin`**: Replaces variables with specific values (e.g., setting environment variables).
  - **`MiniCssExtractPlugin`**: Extracts CSS into separate files for better caching.
- **Code Splitting**:  
  Webpack allows you to split your code into smaller chunks, improving the loading time of your application. This means the browser only loads the necessary code for the current page, instead of loading the entire application upfront.

- **Hot Module Replacement (HMR)**:  
  HMR allows you to replace modules (e.g., JavaScript, CSS) in the browser without a full page reload. This makes for a faster development cycle and a smoother experience when building React apps.

- **DevServer**:  
  The **`webpack-dev-server`** provides a local server for development. It watches your files for changes, automatically reloads the page, and supports **Hot Module Replacement (HMR)** for instant updates without reloading the entire page.

- **Tree Shaking**:  
  Webpack performs **tree shaking** to eliminate unused code from the final bundle, further optimizing the app and reducing its size.

### How Webpack Works in a React App:

1. **Entry Point**:  
   Webpack starts from the entry file (typically `src/index.js` or `src/index.tsx` for React apps). From here, it builds a dependency graph, including all the files and modules your app uses (JavaScript, CSS, images, etc.).

2. **Babel Transpilation**:  
   Webpack uses **Babel** (configured with the `babel-loader`) to transpile JSX and ES6+ code into browser-compatible JavaScript (ES5). This is necessary for React apps because browsers do not natively understand JSX syntax or modern JavaScript features.

3. **Bundling**:  
   After transforming the modules,
    Webpack bundles them into optimized output 
    files (usually in the `dist/` folder). 
    These files can be JavaScript bundles, CSS, or other types of assets.

4. **Optimization**:  
   In **production mode**, Webpack performs various optimizations:
   - **Minification**: It minifies JavaScript, removing whitespace and shortening variable names to reduce the file size.
   - **Code Splitting**: Webpack breaks the application into smaller chunks, loaded on-demand (e.g., per route or feature).
   - **Tree Shaking**: Eliminates unused code from libraries to ensure that only the necessary code is included in the final bundle.

5. **Output**:  
   The final result is a set of optimized files (JavaScript, CSS, HTML) ready for deployment. These files are typically served from a web server, and Webpack ensures they are as small as possible for quick load times.

### React-Specific Usage of Webpack:

- **JSX Handling**:  
  Webpack works with **Babel** to transpile JSX (React's syntax for rendering UI) into JavaScript that browsers can understand. This happens through the `babel-loader` in Webpack's configuration.

- **Styling**:  
  In React, Webpack can bundle your stylesheets (CSS, SCSS, etc.) using loaders like **`css-loader`** and **`style-loader`** or by extracting them into separate files for better caching and performance with **`MiniCssExtractPlugin`**.

- **Asset Handling**:  
  Webpack can also manage and optimize images, fonts, and other static assets. With **`file-loader`** or **`url-loader`**, assets can be bundled or referenced as URLs, ensuring they are included in the final build.

### Webpack Setup for React:

While configuring Webpack from scratch can be complex, **Create React App (CRA)** abstracts away much of the configuration and provides a pre-configured Webpack setup. With CRA, you don’t need to manually configure Webpack for most use cases, making it easier to get started with React development.

However, if you need more control over the build process, you can **eject** from CRA or manually configure Webpack. A typical custom Webpack configuration for React might look like this:

```js
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  entry: "./src/index.js", // Main entry point for the app
  output: {
    filename: "bundle.js", // Output filename for the JavaScript bundle
    path: path.resolve(__dirname, "dist"), // Output directory
  },
  module: {
    rules: [
      {
        test: /\.js$/, // Process JavaScript files with Babel
        exclude: /node_modules/,
        use: "babel-loader",
      },
      {
        test: /\.css$/, // Process CSS files
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.(png|jpg|gif)$/i, // Handle image assets
        use: ["file-loader"],
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "./public/index.html", // Generate HTML with injected scripts
    }),
  ],
  devServer: {
    contentBase: path.join(__dirname, "dist"),
    port: 9000, // Development server on port 9000
  },
  mode: "development", // Development mode (production optimizations are automatic in prod mode)
};
```

### Conclusion:

- **Webpack** is a key tool in modern React development, responsible for bundling, optimizing,
 and transforming assets to ensure the app performs efficiently in production.
- It enables **module bundling**, **code splitting**, **asset management**,
 and **dev server** features for a smooth development workflow.
- While configuring Webpack can be complex, tools like **Create React App** simplify
 it for you, and you can always customize the setup as needed.

This should give you a deeper, more thorough understanding of Webpack in the context of React development, while remaining interview-friendly!

========================


why typescript is used in react

TypeScript provides a type system that allows developers to catch type-related errors at compile time rather than at runtime. This feature makes it easier to write and maintain high-quality code. For example, in a React component, TypeScript can help catch errors related to the props and state of the component

================================================================================

- **`package.json`**:
  - **Project Metadata**: Includes essential information such as the project’s name, version, description, author, and license.

  - **Dependencies**: Lists the libraries and packages that the project depends on, with version ranges (e.g., `"^18.0.0"` allows for minor updates).
  - **Scripts**: Defines command-line scripts for various tasks like starting the app, building it, or running tests (e.g., `npm run start`).

  - **Configurations**: Can include settings for tools and libraries used in the project, such as Babel or ESLint.

- **`package-lock.json`**:
  - **Exact Versions**: Records the precise versions of all dependencies and sub-dependencies installed, ensuring consistency.

  - **Dependency Tree**: Captures the complete hierarchy of dependencies, including nested dependencies, to match the exact installed versions.

  - **Consistent Installations**: Ensures that the same versions are installed

========================================================================

### Dependencies

- Essential packages for running the application in production.
- The `dependencies` property lists the packages required for the project to operate in a production or deployment environment.
- When you run `npm install`, the packages listed in the `dependencies` section are installed.

  npm i <package_name>

- Example packages: Express, React, lodash.

### DevDependencies

- Packages needed only during development and testing, not required for production deployment.

- The `devDependencies` property lists packages used during development, such as testing frameworks, build tools, and development utilities.

- These packages are not necessary for running the application in a production environment but are helpful for development and testing.

  npm i <package_name> --save-dev

- Example packages: Mocha, Webpack, Babel.

dependencies` includes packages needed for the application to run in a production environment,

while `devDependencies` includes packages required during development and testing but are not necessary for the production deployment.



========================================================

 ### Higher Order Components (HOCs)

-In React, Higher Order Component is an advanced technique for reusing component logic.

An HOC is a function_that accepts a component as its argument and returns a new component with some added functionality

**Purpose**: HOCs are used to abstract and reuse logic in a single place, which can then be applied to multiple components. 
They allow for code reusability, manipulation of props, and handling state in a consistent manner.


With help of HoC You can do many tasks
Code Reusability
Props manipulation
State manipulation



-According to the official website,
-Higher-Order Components are not part of the React API.
-but They are pattern that emerges from Reacts compositional nature.

==========================================

### Axios

- Popular Promise-based HTTP client for making AJAX requests in the browser and Node.js.
- Interceptors for request and response handling.
- Automatic transformation of JSON data.
- Support for browser and Node.js environments.
- Ability to cancel requests.
- CSRF protection by default.
- Error handling with meaningful error messages.
- Interceptors provide global request/response handling.

### Fetch

- Modern API for making network requests in the browser, built into modern browsers (ES6 feature).
- Promise-based API.
- Streamlined API surface compared to XMLHttpRequest (XHR).
- No third-party dependencies.
- Support for streaming responses.

### Use Axios If:

- You need built-in support for interceptors, request cancellation, or automatic JSON parsing.
- Cross-browser compatibility is important, including older browsers.
- You prefer simplified error handling and configuration.

### Use Fetch If:

- You want to avoid additional dependencies and rely on native browser APIs.
- Performance and bundle size are critical, especially in modern environments.
- You are comfortable handling request/response interception and additional error handling manually.

This format highlights the specific reasons and scenarios where Axios or Fetch would be preferred based on their capabilities and characteristics.

==============================================
Interceptors

Interceptors are a powerful feature provided by libraries such as Axios or HTML5 Fetch api 
that allow you to intercept and manipulate HTTP requests or responses globally 
before they are handled by your application. 
In the context of React.js, interceptors can be used to perform tasks such as adding authentication headers, logging requests, modifying responses, or handling errors.

==============================================

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



================================================================================


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




================================================================================

compare Flexbox and CSS Grid across various aspects:

1.  ##Layout Model ##:
 - Flexbox: One-dimensional layout model.
 - CSS Grid: Two-dimensional layout system.

2.  ##Axis Control ##:
 - Flexbox: Controls layout along a single axis (either horizontally or vertically).
 - CSS Grid: Organizes content in rows and columns simultaneously.

3.  ##Suitability ##:
 - Flexbox: Best for smaller-scale layouts and components.
 - CSS Grid: Ideal for larger-scale layouts that are not linear in design.


7.  ##Usage ##:
- Flexbox: Commonly used for navigation menus, card layouts, and aligning content within containers.
- CSS Grid: Frequently used for complex page layouts, responsive grids, and magazine-style layouts.


4.  ##Alignment and Distribution ##:
 - Flexbox: Offers fine-tuning of alignment and space distribution between items.
 - CSS Grid: Provides precise control over layout and placement of items.

5.  ##Flexibility ##:
 - Flexbox: Works well for layouts with dynamic content and varying screen sizes.
 - CSS Grid: Offers flexibility with flexible widths and two-dimensional layout capabilities.

6.  ##Item Management ##:
 - Flexbox: Uses a parent-child relationship (Flex Container and Flex Item) to adjust item dimensions.
 - CSS Grid: Supports both implicit and explicit content placement, with built-in automation for extending line items.

In summary, Flexbox is well-suited for simpler layouts and alignment tasks, while CSS Grid excels in creating complex layouts with precise control over rows and columns. Both layout models have their strengths and are often used together to create highly customized and responsive web designs.

================================================



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


================================================

In JavaScript, objects and functions are reference types.
 When a new object is created, it gets a new reference, 
 so two objects with the same values are considered different 
 if their references are different.

When a function is assigned to another variable,
 only the reference is copied. 
 Both variables point to the same function object,
  so the type remains "function" and the references are equal.


========================================================================


- A common use case for the `bind` method in JavaScript 
is to maintain the correct context (`this`) when passing methods as callbacks or event handlers.
- In JavaScript, the value of `this` 
can change depending on how a function is called.
- For instance, when a method is used as an event handler, 
`this` usually refers to the element that triggered the event, not the object that owns the method.
- By using `bind`, you can create a new function where `this` is explicitly set to the desired context, ensuring that the method behaves correctly regardless of how it's called.

- This is particularly useful in scenarios such as object-oriented programming and event handling, where preserving the context is crucial for the method's functionality.
- `bind` can also be used to preset initial arguments, allowing partial application of functions.



### 1. Plain JavaScript Event Handling with `bind`



Interview Answer:

> In JavaScript, the value of `this` depends on how a function is called, which can lead to unexpected behavior when passing methods as callbacks or event handlers. The `bind` method fixes this by creating a new function with `this` explicitly set to the desired object. This ensures the method retains the correct context regardless of how or where it’s called, which is especially useful in event handling and object-oriented programming.

```javascript

const user = {
  name: 'John',
  sayHello: function(greeting) {
    console.log(greeting + ', ' + this.name);
  }
};

const button = document.getElementById('myBtn');

// Without bind - `this` refers to button, not user
button.addEventListener('click', user.sayHello); // this.name is undefined

// With bind - `this` fixed to `user`
button.addEventListener('click', user.sayHello.bind(user, 'Hello')); 
// Output on click: "Hello, John"
```


In summary:
- `bind` creates a new function for later use, while `call` and `apply` execute the function immediately.
- `call` takes arguments individually, whereas `apply` takes arguments as an array.

------------------------------------------------------------------------------

### 2. React Class Component Event Handler with `bind`



React.js Interview Answer:

> In React class components, event handler methods lose their class instance context (`this`) when passed as callbacks. Using `bind` in the constructor or inline fixes this by explicitly setting `this` to the component instance. This ensures methods can access component state and props correctly during events, preventing common bugs related to `this` being `undefined` or incorrect.


```jsx
import React from 'react';

class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };

    // Bind the event handler to fix 'this' context
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    // Accessing this.state and this.setState works because of bind
    this.setState({ count: this.state.count + 1 });
    console.log('Count is:', this.state.count + 1);
  }

  render() {
    return (
      <button onClick={this.handleClick}>
        Click me ({this.state.count})
      </button>
    );
  }
}

export default MyComponent;

```



In React class components, event handler methods don’t automatically bind `this` to the component instance. To fix that, we usually bind methods to `this` so they work correctly when called, especially as event handlers.

The most efficient way to bind is in the constructor, where the binding happens once when the component is created. This avoids creating new functions on every render, improving performance and preventing unnecessary re-renders.

Alternatively, using arrow functions as class properties automatically binds `this` and offers cleaner syntax, which is common in modern React code.

Binding inside `render()` is discouraged because it creates a new function every time the component re-renders, which hurts performance.













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


