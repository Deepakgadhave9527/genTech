


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