

======================================
Webpack

Webpack is a module bundler for JavaScript and other web assets. It analyzes the dependencies between modules, processes them according to its configuration, and produces one or more bundles that can be served to the browser.

Webpack can handle JavaScript, CSS, images, fonts, and other assets through appropriate loaders or built-in asset modules.

Its behavior is configured using webpack.config.js, where we can define things such as the entry point, output, loaders, plugins, and optimization settings.

Loaders allow Webpack to process files before they are included in the bundle. For example, babel-loader can use Babel to transpile modern JavaScript or JSX, while CSS-related loaders can process CSS.

Webpack also provides code splitting, caching, minification, and other optimization techniques to improve application loading performance.

It is commonly used with applications built using technologies such as React, Vue, and Angular.




Webpack is used to `bundle JavaScript files` and other assets like `CSS`, `images`, and `fonts` to use in a browser. 

This helps reduce the number of requests the browser needs to make, improving performance.

It's managing dependencies and bundling various assets like JavaScript files, images,and CSS into a single bundle,

 Webpack's behavior is configured through a webpack.config.js file, This file specifies how to handle different types of files, manage the bundling process, and define optimization strategies.

 Webpack uses `loaders` to process and transform files before bundling them. 

Loaders enable Webpack to process different types of files. For example:
  - ``babel-loader`` transpiles modern JavaScript (ES6, JSX) into older versions (like ES5) that can run on more browsers.
  - ``css-loader`` and ``style-loader`` process CSS files and inject them into the DOM.
  - ``file-loader`` or ``url-loader`` can manage assets like images or fonts.


======================================

WeakMap is a stores of key-value pairs where keys must be objects. 
It keeps weak references to those objects, so when an object is no longer used, 
its entry is automatically removed by the garbage collector. 
It's useful for storing private data or object metadata without causing memory leaks.

WeakSet is similar, but it stores only objects instead of key-value pairs. 
Like WeakMap, objects are automatically removed when they are no longer referenced elsewhere.



================================================================================

- ``package.json``:
  - `Project Metadata`: Includes essential information such as the project’s name, version, description, author, and license.

  - `Dependencies`: Lists the libraries and packages that the project depends on, with version ranges (e.g., `"^18.0.0"` allows for minor updates).
  - `Scripts`: Defines command-line scripts for various tasks like starting the app, building it, or running tests (e.g., `npm run start`).

  - `Configurations`: Can include settings for tools and libraries used in the project, such as Babel or ESLint.

- ``package-lock.json``:
  - `Exact Versions`: Records the precise versions of all dependencies and sub-dependencies installed, ensuring consistency.

  - `Dependency Tree`: Captures the complete hierarchy of dependencies, including nested dependencies, to match the exact installed versions.

  - `Consistent Installations`: Ensures that the same versions are installed

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

`Purpose`: HOCs are used to abstract and reuse logic in a single place, which can then be applied to multiple components. 
They allow for code reusability, manipulation of props, and handling state in a consistent manner.


With help of HoC You can do many tasks
Code Reusability
Props manipulation
State manipulation



-According to the official website,
-Higher-Order Components are not part of the React API.
-but They are pattern that emerges from Reacts compositional nature.







