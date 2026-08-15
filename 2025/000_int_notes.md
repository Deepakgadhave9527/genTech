



webworker
webpack
flex-gird




========================================================================

### `Webpack`:

`Webpack` is a popular `open-source module bundler` primarily used for `JavaScript applications` in modern web development.

- `Purpose`:  
  Webpack is used to `bundle JavaScript files` and other assets like `CSS`, `images`, and `fonts` into one or more output files that are optimized for use in a browser. This helps reduce the number of requests the browser needs to make, improving performance.

- `Managing Dependencies`:  
  Webpack analyzes the dependencies between different modules (JavaScript files, CSS, images) in your app and bundles them efficiently, ensuring that only the necessary files are loaded by the browser.

- `Configuration`:  
  Webpack’s behavior is controlled through a configuration file, typically named `webpack.config.js`. This file specifies how to handle different types of files, manage the bundling process, and define optimization strategies.

- `Loaders`:  
  Webpack uses `loaders` to process and transform files before bundling them. For example, ``babel-loader`` can be used to transpile modern JavaScript (ES6, JSX) into backward-compatible versions for older browsers.

- `Plugins`:  
  `Plugins` enhance Webpack's functionality by performing tasks like:
  - `Optimization`: Minimizing file sizes for faster load times (e.g., `TerserPlugin` for JavaScript minification).
  - `Asset Management`: Handling images, fonts, and other static resources.
  - `Code Splitting`: Breaking large bundles into smaller chunks to optimize loading (e.g., per route or feature).
  - `Generating HTML`: Injecting the final bundles into an HTML template (e.g., `HtmlWebpackPlugin`).

- `Use with Frameworks`:  
  Webpack is widely used alongside modern front-end frameworks like `React`, `Vue.js`, and `Angular`. It is an essential part of the development setup for many JavaScript applications.

### In Summary:

Webpack bundles your application’s assets and optimizes them for the browser, 
while `loaders` and `plugins` provide flexibility to handle various file types 
and enhance functionality. It is an essential tool in modern web development, 
particularly for single-page applications (SPAs) built with frameworks like React.

---

This version organizes the points more clearly and offers a bit more explanation about Webpack's core features and how it's used in real-world projects.

====================================================================================

'`Webpack`:  
A `module bundler` for JavaScript applications, used to bundle JavaScript, CSS, images, and other assets into optimized files that are more efficient for browsers to load. It is commonly used in `React` and other modern JavaScript frameworks to improve performance and streamline development.

### Key Features of Webpack:

- `Module Bundling`:  
  Webpack analyzes your app's dependency graph (starting from an entry file like `index.js` or `app.js`), and bundles all modules (JavaScript, CSS, images, etc.) into a smaller number of optimized files for the browser.

- `Loaders`:  
  Loaders enable Webpack to process different types of files. For example:
  - ``babel-loader`` transpiles modern JavaScript (ES6, JSX) into older versions (like ES5) that can run on more browsers.
  - ``css-loader`` and ``style-loader`` process CSS files and inject them into the DOM.
  - ``file-loader`` or ``url-loader`` can manage assets like images or fonts.

- `Plugins`:  
  Plugins extend Webpack’s functionality and perform additional tasks like:
  - `Minification`: Reduce file sizes (e.g., ``TerserPlugin`` for JS minification).
  - ``HtmlWebpackPlugin``: Generates an `index.html` file with injected script tags for the bundled JavaScript.
  - ``DefinePlugin``: Replaces variables with specific values (e.g., setting environment variables).
  - ``MiniCssExtractPlugin``: Extracts CSS into separate files for better caching.
- `Code Splitting`:  
  Webpack allows you to split your code into smaller chunks, improving the loading time of your application. This means the browser only loads the necessary code for the current page, instead of loading the entire application upfront.

- `Hot Module Replacement (HMR)`:  
  HMR allows you to replace modules (e.g., JavaScript, CSS) in the browser without a full page reload. This makes for a faster development cycle and a smoother experience when building React apps.

- `DevServer`:  
  The ``webpack-dev-server`` provides a local server for development. It watches your files for changes, automatically reloads the page, and supports `Hot Module Replacement (HMR)` for instant updates without reloading the entire page.

- `Tree Shaking`:  
  Webpack performs `tree shaking` to eliminate unused code from the final bundle, further optimizing the app and reducing its size.

====================================================================================

### How Webpack Works in a React App:

1. `Entry Point`:  
   Webpack starts from the entry file (typically `src/index.js` or `src/index.tsx` for React apps). From here, it builds a dependency graph, including all the files and modules your app uses (JavaScript, CSS, images, etc.).

2. `Babel Transpilation`:  
   Webpack uses `Babel` (configured with the `babel-loader`) to transpile JSX and ES6+ code into browser-compatible JavaScript (ES5). This is necessary for React apps because browsers do not natively understand JSX syntax or modern JavaScript features.

3. `Bundling`:  
   After transforming the modules,
    Webpack bundles them into optimized output 
    files (usually in the `dist/` folder). 
    These files can be JavaScript bundles, CSS, or other types of assets.

4. `Optimization`:  
   In `production mode`, Webpack performs various optimizations:
   - `Minification`: It minifies JavaScript, removing whitespace and shortening variable names to reduce the file size.
   - `Code Splitting`: Webpack breaks the application into smaller chunks, loaded on-demand (e.g., per route or feature).
   - `Tree Shaking`: Eliminates unused code from libraries to ensure that only the necessary code is included in the final bundle.

5. `Output`:  
   The final result is a set of optimized files (JavaScript, CSS, HTML) ready for deployment. These files are typically served from a web server, and Webpack ensures they are as small as possible for quick load times.


====================================================================================
### React-Specific Usage of Webpack:

- `JSX Handling`:  
  Webpack works with `Babel` to transpile JSX (React's syntax for rendering UI) into JavaScript that browsers can understand. This happens through the `babel-loader` in Webpack's configuration.

- `Styling`:  
  In React, Webpack can bundle your stylesheets (CSS, SCSS, etc.) using loaders like ``css-loader`` and ``style-loader`` or by extracting them into separate files for better caching and performance with ``MiniCssExtractPlugin``.

- `Asset Handling`:  
  Webpack can also manage and optimize images, fonts, and other static assets. With ``file-loader`` or ``url-loader``, assets can be bundled or referenced as URLs, ensuring they are included in the final build.

### Webpack Setup for React:

While configuring Webpack from scratch can be complex, `Create React App (CRA)` abstracts away much of the configuration and provides a pre-configured Webpack setup. With CRA, you don’t need to manually configure Webpack for most use cases, making it easier to get started with React development.

However, if you need more control over the build process, you can `eject` from CRA or manually configure Webpack. A typical custom Webpack configuration for React might look like this:

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

- `Webpack` is a key tool in modern React development, responsible for bundling, optimizing,
 and transforming assets to ensure the app performs efficiently in production.
- It enables `module bundling`, `code splitting`, `asset management`,
 and `dev server` features for a smooth development workflow.
- While configuring Webpack can be complex, tools like `Create React App` simplify
 it for you, and you can always customize the setup as needed.

This should give you a deeper, more thorough understanding of Webpack in the context of React development, while remaining interview-friendly!

========================


why typescript is used in react

TypeScript provides a type system that allows developers to catch type-related errors at compile time rather than at runtime. This feature makes it easier to write and maintain high-quality code. For example, in a React component, TypeScript can help catch errors related to the props and state of the component



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





===========================================================================



A framework is a set of pre-written code that provides a structure for developing software applications. 

A library, on the other hand, is a collection of pre-written code that can be used to perform specific tasks.





- Interceptors are a powerful feature provided by HTTP client libraries such as Axios that allow us to intercept and manipulate HTTP requests or responses before they are handled by the application.

- There are mainly two types of interceptors:
  - Request Interceptor
  - Response Interceptor

- Request Interceptor:
  - Runs before the request is sent.
  - Used to:
    - Add authentication tokens.
    - Modify request headers.
    - Add common parameters.
    - Log requests.
    - Add request IDs or other common configurations.

    import axios from "axios";

// Create Axios instance

const api = axios.create({
  baseURL: "https://jsonplaceholder.typicode.com",
});

// ================================
// REQUEST INTERCEPTOR
// ================================

api.interceptors.request.use(
  (config) => {

    // 1. Add Authentication Token
    const token = "my-demo-token";

    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }


    // 2. Modify Request Headers
    config.headers["Content-Type"] = "application/json";
    config.headers["X-App-Name"] = "My React App";


    // 3. Add Common Parameters
    config.params = {
      ...config.params,
      userId: 1,
    };


    // 4. Log Request
    console.log("========== REQUEST ==========");
    console.log("Method:", config.method?.toUpperCase());
    console.log("URL:", config.baseURL + config.url);
    console.log("Headers:", config.headers);
    console.log("Params:", config.params);


    // 5. Add Request ID
    config.headers["X-Request-ID"] = crypto.randomUUID();

    console.log("Request ID:", config.headers["X-Request-ID"]);
    console.log("=============================");


    // IMPORTANT: return config
    return config;
  },

  (error) => {
    return Promise.reject(error);
  }
);


// ================================
// API CALL
// ================================

async function getPosts() {
  try {
    const response = await api.get("/posts");

    console.log("Response:", response.data);

  } catch (error) {
    console.error("API Error:", error);
  }
}

getPosts();


```

- Response Interceptor:
  - Runs after a response is received.
  - Used to:
    - Transform response data.
    - Handle errors globally.
    - Log responses.
    - Handle 401 Unauthorized errors.
    - Refresh expired authentication tokens.
    - Retry the original request when appropriate.

    import axios from "axios";

// ========================================
// CREATE AXIOS INSTANCE
// ========================================

const api = axios.create({
  baseURL: "https://jsonplaceholder.typicode.com",
});


// ========================================
// RESPONSE INTERCEPTOR
// ========================================

api.interceptors.response.use(

  // ======================================
  // SUCCESS RESPONSE
  // ======================================

  (response) => {

    // 1. Log Response
    console.log("========== RESPONSE ==========");
    console.log("Status:", response.status);
    console.log("URL:", response.config.url);
    console.log("Data:", response.data);
    console.log("==============================");


    // 2. Transform Response Data
    // Example: Return only response.data
    return response.data;
  },


  // ======================================
  // ERROR RESPONSE
  // ======================================

  async (error) => {

    // 3. Log Response Error
    console.error("========== RESPONSE ERROR ==========");
    console.error("Status:", error.response?.status);
    console.error("URL:", error.config?.url);
    console.error("Message:", error.message);
    console.error("====================================");


    // 4. Handle 401 Unauthorized
    if (error.response?.status === 401) {

      console.log("User is unauthorized");

      // 5. Refresh Expired Authentication Token
      try {

        console.log("Refreshing authentication token...");

        // In a real application:
        //
        // const refreshResponse = await axios.post(
        //   "/auth/refresh",
        //   {
        //     refreshToken: localStorage.getItem("refreshToken")
        //   }
        // );
        //
        // const newToken = refreshResponse.data.accessToken;

        const newToken = "new-demo-token";


        // Update token
        localStorage.setItem("accessToken", newToken);


        // 6. Retry Original Request
        const originalRequest = error.config;

        originalRequest.headers.Authorization =
          `Bearer ${newToken}`;

        console.log("Retrying original request...");

        return api(originalRequest);

      } catch (refreshError) {

        console.error("Token refresh failed");

        // Redirect user to login
        // window.location.href = "/login";

        return Promise.reject(refreshError);
      }
    }


    // 7. Handle Other Errors Globally

    if (error.response?.status === 404) {
      console.error("Resource not found");
    }

    if (error.response?.status === 500) {
      console.error("Internal server error");
    }


    // Pass error to the calling code
    return Promise.reject(error);
  }
);


// ========================================
// API CALL
// ========================================

async function getPosts() {

  try {

    const posts = await api.get("/posts");

    console.log("Posts received:", posts);

  } catch (error) {

    console.error("Final API Error:", error);
  }
}

getPosts();

- In React.js applications:
  - Interceptors help us avoid repeating common API logic in every component.
  - They allow us to centralize request and response handling.
  - This makes the code clean, reusable, and maintainable.

- Important point:
  - Interceptors are not a native JavaScript feature.
  - The Fetch API does not provide built-in Axios-style interceptors.
  - Libraries such as Axios provide interceptor functionality.
  - With Fetch, we can create our own wrapper function to achieve similar behavior.

- Real-world example:
  - Request → Add JWT token → Send API request.
  - Response → Check status → If 401, refresh token → Retry request or redirect to login.

- In short:
  - Request Interceptor → Before API request.
  - Response Interceptor → After API response.
  - Main purpose → Centralize common API logic.









====

==================================================
IMPORTANT DIFFERENCE:
align-items vs align-content
==================================================

align-items:

    Aligns ITEMS within a flex line.

align-content:

    Aligns MULTIPLE FLEX LINES within the container.


Example:

.container {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    align-content: space-between;
}


==================================================
MOST IMPORTANT INTERVIEW CONCEPT
==================================================

Question:
What is the difference between justify-content and align-items?

Answer:

justify-content → Aligns items along the MAIN AXIS.

align-items → Aligns items along the CROSS AXIS.


For:

flex-direction: row;

justify-content → Horizontal
align-items      → Vertical


For:

flex-direction: column;

justify-content → Vertical
align-items      → Horizontal


==================================================
EASY WAY TO REMEMBER
==================================================

justify-content
    ↓
MAIN AXIS

align-items
    ↓
CROSS AXIS

align-content
    ↓
MULTIPLE FLEX LINES


==================================================
COMMON INTERVIEW QUESTIONS
==================================================

Q1. What is Flexbox?

Answer:
Flexbox is a one-dimensional CSS layout system used to arrange and align elements in rows or columns.

--------------------------------------------------

Q2. How do you enable Flexbox?

Answer:

.container {
    display: flex;
}

--------------------------------------------------

Q3. What are the six important flex container properties?

Answer:

1. flex-direction
2. flex-wrap
3. flex-flow
4. justify-content
5. align-items
6. align-content

--------------------------------------------------

Q4. What is the default value of flex-direction?

Answer:

row

--------------------------------------------------

Q5. What is the default value of flex-wrap?

Answer:

nowrap

--------------------------------------------------

Q6. What is the default value of justify-content?

Answer:

flex-start

--------------------------------------------------

Q7. What is the default value of align-items?

Answer:

stretch

--------------------------------------------------

Q8. What is the default value of align-content?

Answer:

stretch

--------------------------------------------------

Q9. What is the difference between row and column?

Answer:

row:
Items are arranged horizontally.

column:
Items are arranged vertically.

--------------------------------------------------

Q10. What is the difference between justify-content and align-items?

Answer:

justify-content → Main axis
align-items      → Cross axis

--------------------------------------------------

Q11. What is the difference between align-items and align-content?

Answer:

align-items:
Aligns individual flex items within a flex line.

align-content:
Aligns multiple flex lines within the flex container.

--------------------------------------------------

Q12. Does align-content work with a single flex line?

Answer:

Generally no. align-content is useful when there are multiple flex lines,
usually created using flex-wrap: wrap.

--------------------------------------------------

Q13. What is flex-flow?

Answer:

flex-flow is shorthand for flex-direction and flex-wrap.

Example:

flex-flow: row wrap;


==================================================
ONE-LINE REVISION
==================================================

flex-direction → Direction
flex-wrap       → Wrap or not
flex-flow       → Direction + Wrap
justify-content → Main axis
align-items     → Cross axis
align-content   → Multiple flex lines


==================================================
INTERVIEW GOLDEN RULE
==================================================

DO NOT MEMORIZE:

justify-content = horizontal
align-items = vertical

Instead, remember:

justify-content = MAIN AXIS
align-items = CROSS AXIS

The direction of the main axis depends on flex-direction.




----------------------------
 
Code optimization

Code optimization in React.js involves improving the efficiency, performance,
and overall quality of your codebase without changing its functionality.

It includes techniques such as minimizing unnecessary re-renders,
reducing bundle size, optimizing network requests, managing state efficiently,
enhancing code readability, and maintaining code maintainability.

1. React.StrictMode:

- Use React.StrictMode to detect potential issues in your codebase during development.
  -It helps identify unsafe lifecycles, deprecated APIs, and other potential problems.

2. Memoization:
   Memoization is a technique used to optimize expensive computations by caching the results.
   React provides a useMemo hook for memoizing values.

import React, { useMemo } from 'react';

const Component = ({ data }) => {
const processedData = useMemo(() => {
// Expensive computation
return data.map(item => item \* 2);
}, [data]);

    return (
      <div>
        {processedData.map((item, index) => (
          <div key={index}>{item}</div>
        ))}
      </div>
    );

};

3. Code Splitting:
   Splitting your code into smaller chunks allows lazy-loading components when needed,
   reducing the initial bundle size and speeding up the initial load time.

import React, { lazy, Suspense } from 'react';

const LazyComponent = lazy(() => import('./LazyComponent'));

const App = () => (
<Suspense fallback={<div>Loading...</div>}>
<LazyComponent />
</Suspense>
);

4. Avoid Inline Styles:

- Inline styles can clutter your components and make maintenance difficult.
  -Prefer using CSS classes or styled-components for better separation of concerns and easier styling management.

5. Debouncing and Throttling:

- Debouncing and throttling are code optimization techniques that help improve performance by
  controlling the rate at which functions are executed in response to frequent events.
- Debouncing function is excuated after specif delay perdia passes since las time function invokde
  while throttling limits the number of times the function can be called over a certain period.



========================================================================


========================== ES6 features ==================================

Below is the list of top ES6 features every JavaScript developer should know,


1. let and const:
2. Arrow Functions:
3. Template Literals:
4. Destructuring Assignment:
5. Default Parameters:
6. Rest and Spread Operators:
7. Classes:
8. Modules:
9. Promises:
10. Symbol:
11. Iterators and Generators:
12. Map and Set:
13. WeakMap and WeakSet:
14. Enhanced Object Literals:
15. Object.assign():
16. String Methods:
17. Number Methods:
18. Math Methods:
19. New Data Structures:
20. For…of Loop:


Default parameters
Spread and Rest syntaxes (…)
let and const
promise
Destructuring assignment
Arrow function expressions
Classes

Template literals (Template strings)
Tagged Templates
Object.assign() and Object.is()

1. let and const
   ```javascript
   let x = 10;
   const y = 20;
   x = 15; // Allowed
   // y = 25; // Error: Assignment to constant variable
   ```

2. Arrow Functions
   ```javascript
   const add = (a, b) => a + b;
   console.log(add(2, 3)); // 5
   ```

3. `Template Literals`
   ```javascript
   const name = 'World';
   const greeting = `Hello, ${name}!`;
   console.log(greeting); // Hello, World!
   ```

4. `Destructuring Assignment`
   ```javascript
   const [a, b] = [1, 2];
   const { name, age } = { name: 'Alice', age: 30 };
   console.log(a, b); // 1 2
   console.log(name, age); // Alice 30
   ```

5. `Default Parameters`
   ```javascript
   function greet(name = 'Guest') {
     return `Hello, ${name}!`;
   }
   console.log(greet()); // Hello, Guest!
   console.log(greet('John')); // Hello, John!
   ```

6. `Rest and Spread Operators`
   - `Rest Operator`:
     ```javascript
     function sum(...numbers) {
       return numbers.reduce((acc, num) => acc + num, 0);
     }
     console.log(sum(1, 2, 3, 4)); // 10
     ```
   - `Spread Operator`:
     ```javascript
     const arr = [1, 2, 3];
     const newArr = [0, ...arr, 4];
     console.log(newArr); // [0, 1, 2, 3, 4]
     ```

7. `Classes`
   ```javascript
   class Person {
     constructor(name) {
       this.name = name;
     }
     greet() {
       return `Hello, ${this.name}!`;
     }
   }
   const john = new Person('John');
   console.log(john.greet()); // Hello, John!
   ```

8. `Modules`
   - `Export`:
     ```javascript
     // module.js
     export const pi = 3.14;
     export function add(a, b) {
       return a + b;
     }
     ```
   - `Import`:
     ```javascript
     // main.js
     import { pi, add } from './module.js';
     console.log(pi); // 3.14
     console.log(add(2, 3)); // 5
     ```

9. `Promises`
   ```javascript
   const myPromise = new Promise((resolve, reject) => {
     setTimeout(() => resolve('Done!'), 1000);
   });

   myPromise.then(result => console.log(result)); // Done!
   ```

10. `Symbol`
    ```javascript
    const sym1 = Symbol('description');
    const sym2 = Symbol('description');
    console.log(sym1 === sym2); // false
    ```

11. `Iterators and Generators`
    ```javascript
    function* generator() {
      yield 1;
      yield 2;
      yield 3;
    }
    const gen = generator();
    console.log(gen.next().value); // 1
    console.log(gen.next().value); // 2
    ```

12. `Map and Set`
    - `Map`:
      ```javascript
      const map = new Map();
      map.set('key1', 'value1');
      console.log(map.get('key1')); // value1
      ```
    - `Set`:
      ```javascript
      const set = new Set([1, 2, 3]);
      set.add(4);
      console.log(set.has(2)); // true
      ```

13. `WeakMap and WeakSet`
    - `WeakMap`:
      ```javascript
      const weakMap = new WeakMap();
      const obj = {};
      weakMap.set(obj, 'value');
      console.log(weakMap.get(obj)); // value
      ```
    - `WeakSet`:
      ```javascript
      const weakSet = new WeakSet();
      const obj = {};
      weakSet.add(obj);
      console.log(weakSet.has(obj)); // true
      ```

14. `Enhanced Object Literals`
    ```javascript
    const name = 'Alice';
    const person = {
      name,
      greet() {
        return `Hello, ${this.name}!`;
      }
    };
    console.log(person.greet()); // Hello, Alice!
    ```

15. `Object.assign()`
    ```javascript
    const target = { a: 1 };
    const source = { b: 2 };
    Object.assign(target, source);
    console.log(target); // { a: 1, b: 2 }
    ```

16. `String Methods`
    ```javascript
    const str = 'Hello, World!';
    console.log(str.includes('World')); // true
    console.log(str.startsWith('Hello')); // true
    console.log(str.endsWith('!')); // true
    ```

17. `Number Methods`
    ```javascript
    console.log(Number.isNaN(NaN)); // true
    console.log(Number.isFinite(123)); // true
    ```

18. `Math Methods`
    ```javascript
    console.log(Math.pow(2, 3)); // 8
    console.log(Math.trunc(4.9)); // 4
    ```

19. `For…of Loop`
    ```javascript
    const iterable = [10, 20, 30];
    for (const value of iterable) {
      console.log(value); // 10, 20, 30
    }
    ```

20. `Tagged Templates`
    ```javascript
    function tag(strings, ...values) {
      return strings.reduce((acc, str, i) => acc + str + (values[i] || ''), '');
    }
    const name = 'World';
    const message = tag`Hello, ${name}!`;
    console.log(message); // Hello, World!
    ```

These examples demonstrate how each ES6 feature can be used in practice.




==========================================================

Fiber solves this by allowing React to:

* Break rendering work into smaller units.
* Pause and resume rendering.
* Prioritize more important updates (like user input).
* Keep the UI responsive.

### 1. Fiber Node

A Fiber is a JavaScript object that represents a unit of work for a React component.

Each Fiber contains information such as:

* Component type
* Props
* State
* Parent, child, and sibling references
* Effects or work that need to be performed during updates

### 2. Reconciliation

Reconciliation is React's process of determining what needs to change when the UI is updated.

Fiber provides the data structure and architecture that allow React to efficiently perform this reconciliation and determine the necessary DOM updates.

### 3. Scheduling

Fiber allows React to schedule and prioritize updates.

For example:

`High priority:`

* Typing in an input
* Button clicks
* User interactions

`Lower priority:`

* Loading or rendering a large list
* Background rendering
* Non-urgent updates

This helps prevent less important work from blocking user interactions.

### 4. Render Phase and Commit Phase

React Fiber mainly works through two phases: the `render phase` and the `commit phase`.

During the `render phase`, React creates or updates the work-in-progress Fiber tree, performs reconciliation, and determines what changes need to be made. This phase can be interrupted, restarted, or abandoned.

During the `commit phase`, React applies the calculated changes to the actual DOM and performs the required commit-related side effects. The commit phase is not interruptible because React needs to apply the final UI changes consistently.

### 5. Current and Work-in-Progress Fiber Trees

React maintains a `current Fiber tree` and a `work-in-progress Fiber tree`.

The current tree represents what is currently committed and displayed on the screen, while the work-in-progress tree represents the changes React is preparing.

Once the work is successfully committed, the work-in-progress tree becomes the new current tree.

### 6. Simple Explanation

In simple words, Fiber allows React to break rendering work into smaller pieces, prioritize important work, and perform rendering more efficiently.

Fiber is also the architectural foundation for modern React capabilities such as `concurrent rendering, transitions, and Suspense`.`