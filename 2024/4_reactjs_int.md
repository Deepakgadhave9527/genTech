
===========================================================

React Fiber

React Fiber is the new reconciliation algorithm in React 16 and later versions.
is the internal algorithm React uses to decide what needs to change in the UI and how those changes should be applied efficiently.
React Fiber is React's internal engine that makes rendering faster, smoother, and more responsive by breaking rendering work into small units and prioritizing updates.



It enhances the ability to update the user interface and manage component rendering more efficiently

- React Fiber is the new reconciliation engine in React 16 and later.
- It improves rendering performance and user experience.
- Breaks rendering work into units and spreads it out over multiple frames.
- Allows smoother animations and better handling of complex updates.
- Introduces features like error boundaries and async rendering.
- Enhances flexibility and robustness of React applications.


========================================================================

### 🔹 What is a React Portal?

- A React Portal provides a way to render children into a **DOM node outside the main parent component hierarchy**.

A React Portal provides a way to render children into a "DOM node outside the parent component's DOM hierarchy " while keeping them part of the same React component tree.

- It’s created using:

```jsx
ReactDOM.createPortal(child, container);
```

- **child**: The React element you want to render.
- **container**: The DOM node where you want the child to be rendered.

### Why Use Portals?
Normally, React components render inside their parent DOM node.

For components like modals, tooltips, dropdowns, popovers, and toast notifications, rendering outside the parent hierarchy helps avoid:

overflow: hidden clipping

z-index issues
positioning/layout constraints hierarchy** is necessary to avoid **styling or z-index issues**.

### 💡 What Problem Does It Solve?

- It solves **z-index**, **positioning**, and **layout** issues commonly faced in nested components.

### ✅ Portals Let You Do Exactly That

```jsx
ReactDOM.createPortal(
  <div className="modal">Modal Content</div>,
  document.getElementById("modal-root"),
);


### 🔍 Summary

- React Portals render children into a DOM node **outside the parent component’s DOM hierarchy**.
- Useful for **modals, tooltips, and overlays** that need to visually break out of their parent container.
- Ensures that elements are **part of the React component tree**.
- Allows elements to **benefit from React’s event handling and lifecycle features**.

========================================================

Automatic Batching

-Batching react 18 features  and its optimization technique

- In batching, multiple state updates are grouped, and those grouped state updates are updated in a single render. 

- React performs only one re-render instead of re-rendering after each individual state update.

- its improving performance.


Before React 18: Only updates inside React event handlers (such as onClick) were batched.

After React 18: Updates inside 
setTimeout, 
Promises (.then),
 fetch,
 and async/await are also automatically batched.


---------------------------------

in batching mutiple state are grouped and that grouped state are update into single render

Automatic Batching is a React optimization  group of multiple state updates are grouped (batched) together into a single re-render,
Instead of re-rendering after every setState or state updater call, React combines them and renders only once.

After React 18 (Automatic Batching)


React automatically batches updates everywhere, including:

setTimeout()
Promises (.then())
async/await
Native event handlers


=================================

### Conditional Rendering

Conditional rendering is the displaying different UI elements based on specific conditions.

### Example

In React:

javascript
function Greeting({ isLoggedIn }) {
return isLoggedIn ? <h1>Welcome back!</h1> : <h1>Please sign in.</h1>;
}

### Summary

- Purpose: Show different content based on conditions.
- How: Use conditional statements like `if` or the ternary operator within the render method.

========================================================

What are rule use hooks in react

Hook Rules
There are 3 rules for hooks:
Hooks can only be called inside React function components.
Hooks can only be called at the top level of a component.
Hooks cannot be conditional.

========================================================
```
StrictMode

- React StrictMode is a tool for identifying/highlighting potential problems in an application.

It only works in development mode.
It does not affect production builds.

- It helps identify unsafe lifecycles, deprecated APIs, and other potential problems.

- Unsafe lifecycle methods
- Legacy string refs
- Unexpected side effects
- Potential memory leaks
- Deprecated or obsolete APIs

- Like Fragment, StrictMode does not render any visible UI.
========================================================

-In React, **synthetic events** are a layer of abstraction over native browser events. 

It means React does not give you the original browser event directly. Instead, React wraps the browser event inside its own object called SyntheticEvent.

- They provide a **consistent interface** for handling events across different browsers

- offer **additional features** to improve event handling.

When you attach an event handler, like onClick, to a React element, React passes a SyntheticEvent object to your handler function. This object contains information about the event, such as the target element, and provides methods like stopPropagation() and preventDefault() for controlling event behavior.

--------------------------------------------------------------

**Synthetic Events in React**:

In React, **synthetic events** are a layer of abstraction over native browser events. 
They provide a **consistent interface** for handling events across different browsers

 and offer **additional features** to improve event handling.

You can attach event handlers, like **`onClick`**, to React elements, and React passes a **synthetic event object** to your handler function. This object contains information about the event, such as the **target element**, and provides methods like **`stopPropagation()`** and **`preventDefault()`** for controlling event behavior.

These methods allow you to **prevent the event from propagating** through the DOM or **prevent the default browser action** (like following a link or submitting a form).

- Synthetic events ensure consistent and efficient event handling in React components. -->

========================================================

**Code Optimization in React:**

Code optimization is the process of improving the performance of a React application by making the code more efficient and reducing unnecessary work.

It helps to:
- Reduce unnecessary re-renders.
- Improve application speed and responsiveness.
- Reduce memory usage.
- Improve overall user experience.

Common React optimization techniques:

- Use **React.memo** to prevent unnecessary re-renders of components.
- Use **useMemo** to memoize expensive calculations.
- Use **useCallback** to memoize functions and prevent unnecessary function recreations.
- Use **lazy loading** and **code splitting** to load only the required code.
- Avoid unnecessary state updates.
- Keep component state as local as possible.
- Use proper **keys** when rendering lists.
- Optimize large lists using techniques like virtualization.



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

================================== props.children ==============================================




### What is `props.children` in React?

* A parent component can pass any content to a child component, including **HTML elements, dynamically generated layouts, or other React components**.

* The child component can access this passed content through **`props.children`** and decide where and how to render it.

* **`children` is a special built-in prop provided by React. It allows components to receive other components or elements as data, similar to how we pass normal props like `name`, `value`, or `id`.**

* Any content placed between a component's opening and closing tags is automatically passed to that component as the **`children` prop**.

Example:

```jsx
function Card(props) {
  return (
    <div className="card">
      {props.children}
    </div>
  );
}

function App() {
  return (
    <Card>
      <h1>Hello React</h1>
      <p>This content is passed as children.</p>
    </Card>
  );
}
```

Here, the `<h1>` and `<p>` elements inside `<Card>` are passed from the parent component and are available inside `Card` through `props.children`.

**Think of `props.children` as a placeholder that allows a component to wrap and display custom content provided by its parent.**

**It helps create reusable and flexible components, because the same component can display different content depending on what the parent passes.**

Interview summary:

> **`props.children` is a special React prop that contains the elements or components placed between a component's opening and closing tags. It allows a parent component to pass UI content to a child component, making components more reusable and flexible.**








---------------------------------------------------------------

- A parent component can easily pass any necessary content, including dynamically generated layout features or other components,
  to its child component

- child component can then access this content through props.children and render it accordingly.

- Children is a prop (this.props.children) that allows you to pass components as data to other components, just like any other prop you use. Component tree put between component's opening and closing tag will be passed to that component as children prop.

const Layout = (props) => {
return (
<div className="layout">
<header>Header Section</header>
<main>{props.children}</main>
<footer>Footer Section</footer>
</div>
);
};

const App = () => {
const generateContent = () => {
return <p>This is dynamically generated content!</p>;
};

    return (
      <Layout>
        <h1>Main Title</h1>
        {generateContent()}
        <p>Some additional content.</p>
      </Layout>
    );

};

<!--
using props.children.

parent component can easily pass whatever is necessary to its child, even generated layout features or other component
props.children its access the that content  and  to render whatever content is passed to it. -->

========================================================

Babel

- Babel is a JavaScript compiler that converts modern JavaScript code and JSX into older JavaScript code that browsers can understand.

React developers write code using JSX and modern JavaScript features, but browsers do not directly understand JSX. Babel transforms that code into regular JavaScript.

its give allowing developers to use the latest language features while maintaining browser compatibility.

#### Why do we need Babel?
Browsers cannot understand JSX directly.
Older browsers may not support newer JavaScript features (ES6+).
Babel converts modern syntax into compatible JavaScript.
================================
### Middleware
Redux middleware is a function that intercepts dispatched actions before they reach the reducers. 
It allows you to perform additional processing, such as handling asynchronous operations (e.g., API calls), logging, or other side effects.

By keeping business logic separate from UI components, middleware makes applications more scalable, maintainable, and easier to test.

Common Redux middleware includes Redux Thunk, Redux Saga, and Redux Logger.




Whenever you send an action using dispatch(), middleware receives that action first. It can perform extra work such as API calls, logging, authentication, or validation. After completing that work, it forwards the action to the reducer, which then updates the Redux state.


==============================================================


What are PropTypes?
PropTypes is a type-checking library included with React.
It allows you to specify the expected types for props that a component should receive, providing runtime type validation.

npm install prop-types

========================================================================
React Fiber

React Fiber is React's reconciliation algorithm introduced in React 16. 

It is React's internal rendering engine that determines what changes need to be made to the UI and updates them efficiently.


It improves rendering by breaking work into small units, prioritizing important updates, and allowing rendering to be paused and resumed. This results in better performance, a more responsive UI, and support for features like Concurrent Rendering.

========================================================================

### Suspense

- Suspense is a feature in React that allows you to handle loading states for asynchronous operations,
- such as dynamically loading components or data.
- It helps manage the user experience by showing fallback content while the main content is being loaded.

================================================================================

Here's why we use return () => { ... }:

Cleanup Function Definition: The return statement defines the cleanup function.
This function will be called when the component unmounts or before the effect runs again if any dependencies change.

================================================================================

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

========================================================================

## State Management with `useState`

### Declaration and Behavior

- **Declaration**: State variables in functional components are declared using `const`:
  ```javascript
  const [count, setCount] = useState(0);
  ```
- **Const Keyword**: The `const` keyword ensures that the references to `count` and `setCount` do not change, but this does not mean that the state value itself cannot change. The state value managed by React can change.
- **State Updates**: When `setCount` is called, React schedules an update. The state is maintained internally by React and persists across re-renders, meaning that the state variable is not recreated from scratch but retrieved from React's internal state management system.

### Explanation

- **Re-renders**: During a re-render, the functional component is executed again, creating a new scope. However, React maintains the state between renders by associating state values with the component instance, ensuring that the same state variable is accessed and updated consistently.

================================================================================

### Why the UI Doesn't Reflect Changes Without useState

:

- **Without `useState`**: React doesn’t track changes to regular variables, so it doesn’t know to re-render the component. As a result, the UI remains static and doesn’t reflect changes to those variables.
- **With `useState`**: The hook is essential for managing state in functional components. It triggers a re-render whenever the state changes, ensuring the UI updates accordingly. React’s reconciliation algorithm then updates the DOM based on these state changes.

================================================================================
How does useState change even when it's a const?

The `const` keyword ensures that the references to the state variable and the state updater function do not change, but the state value itself can change.

- The `useState` hook allows state management in functional components by returning an array with the current state value and a function to update it.
- Although these values are typically destructured into constants (`const`), the state value is internally managed by React.

- The `const` keyword ensures that the references to the state variable (e.g., `count`) and the state updater function (e.g., `setCount`) do not change, but the state value itself can change.

- When the updater function is called, React schedules a component update and stores the new state value.

- During the next render, `useState` provides the updated state value, ensuring the component always uses the latest state.

- When a component rerenders, the function component is executed again, creating a new scope.
- React maintains the state between renders by associating the state values with the component instance, ensuring the same state variable is accessed and updated consistently.
- Thus, the state can change despite being declared with `const`.

===========================================================================
what is routing in react js

In a single-page React Application,
routing refers to the process of navigating between different pages without triggering a full page reload.

React Router DOM is an npm package that enables you to implement dynamic routing in a web app.

===========================================================================

use multiple <Routes> components and include both routing components (RootRouter and RootRouter2) in your App component, is not the recommended approach.

Multiple <Routes> Components: Using multiple <Routes> components can lead to routing conflicts and unpredictable behavior. React Router is designed to handle routing with a single <Routes> component.

### Absolute Paths

Absolute paths are full paths starting from the root of the application

Absolute paths start from the root of the application and are prefixed with a leading slash (/). They are used to navigate to routes from anywhere within the application.

<Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
      </Routes>
    </Router>

Use a leading slash (/) with the <Link> component when you want to navigate to an absolute path from the root of the application.

<Link to="/about">About</Link>

### Relative Paths

Relative paths are used within nested routes.

Relative paths are used within nested routes.
They do not use a leading slash and are relative to the current route's parent.
<Router>
<Routes>
<Route path="/" element={<Home />} />
<Route path="/dashboard" element={<Dashboard />}>
<Route path="profile" element={<UserProfile />} />
<Route path="settings" element={<Settings />} />
</Route>
</Routes>
</Router>

Do not use a leading slash when you want to navigate to a path relative to the current route.

<Link to="profile">Profile</Link>

When you see the error about absolute paths in nested routes, it usually means that you’ve defined a child route path as an absolute path, which is not allowed. Nested routes must use relative paths.



========================================================

In React applications, asynchronous operations like making API calls or handling side effects can be managed effectively using middleware.
Middleware allows developers to intercept certain actions, perform asynchronous tasks,
and then dispatch new actions with the results once the tasks are complete.

Middleware, in the context of web development,

- acts as a bridge between different components of an application, providing a layer of processing and functionality.
- It intercepts incoming requests, performs specific actions, and then passes the modified request to the next middleware or the final destination

================================================================================

### Why middleware is required in React?

- Middleware is commonly used in React applications to:
  - Manage side effects, handle asynchronous actions,
    and facilitate communication between components and the application’s state management system (like Redux).
- Middleware allows you to manage these side effects without cluttering your components with complex logic.
  - It helps separate business logic from UI logic, making the code more maintainable.
  - Improves code reusability by handling common tasks in middleware, reducing the need for repeating logic.

- For example, in Redux, middleware like redux-thunk or redux-saga is used to handle asynchronous actions (like API calls) in a more structured manner:
  - It organizes side effects outside of components, improving readability and maintainability.

- Middleware is required in React applications, particularly when using state management libraries like Redux, to handle asynchronous operations and side effects effectively.

### Middleware allows developers to:

- Intercept Actions: Middleware can intercept actions dispatched to the store before they reach the reducers.
- Perform Asynchronous Tasks: Middleware can handle asynchronous operations, such as making API calls, within the action dispatching process.
- Dispatch New Actions: After completing the asynchronous tasks, middleware can dispatch new actions\*\* with the results of these tasks to update the store.

=========================================================
