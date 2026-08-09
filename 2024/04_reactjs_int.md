
===========================================================

### React Portal

With the help of a `React Portal`, we can render a React component's UI into a different DOM node
outside the normal parent element


means it outside the normal parent element we have normaly root elemet 

Even though the UI is rendered at a different location in the `DOM`, it is still part of the `same React component tree`. Therefore, React features such as `context, state, and event handling` continue to work normally.

React Portals are commonly used for `modals, tooltips, dropdowns, popups, and overlays`,

 especially when we need to avoid CSS issues caused by the parent element, such as ``overflow: hidden``, `stacking contexts`, and ``z-index`` problems.

 positioning/layout constraints hierarchy` is necessary to avoid `styling or z-index issues`.




- It’s created using:

```jsx
ReactDOM.createPortal(child, container);
```

- `child`: The React element you want to render.
- `container`: The DOM node where you want the child to be rendered.


ReactDOM.createPortal(
  <div className="modal">Modal Content</div>,
  document.getElementById("modal-root"),
);

===========================================================

Automatic Batching

- Automatic Batching is a React 18 feature and a performance optimization technique.

- In batching mutiple state are grouped and that grouped state are update into single render

- React performs only one re-render instead of re-rendering after each individual state update.

- its improving performance.

-Before React 18, React mainly batched state updates inside React event handlers. 

- From React 18, with createRoot, React provides automatic batching for updates from event handlers as well as asynchronous operations such as 
setTimeout, 
Promises, 
fetch callbacks, and 
async/await, resulting in fewer unnecessary renders.


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

-In React, `synthetic events` are a layer of abstraction over native browser events. 

It means React does not give you the original browser event directly. Instead, React wraps the browser event inside its own object called SyntheticEvent.

- They provide a `consistent interface` for handling events across different browsers

- offer `additional features` to improve event handling.

When you attach an event handler, like onClick, to a React element, React passes a SyntheticEvent object to your handler function. This object contains information about the event, such as the target element, and provides methods like stopPropagation() and preventDefault() for controlling event behavior.

--------------------------------------------------------------

`Synthetic Events in React`:

In React, `synthetic events` are a layer of abstraction over native browser events. 
They provide a `consistent interface` for handling events across different browsers

 and offer `additional features` to improve event handling.

You can attach event handlers, like ``onClick``, to React elements, and React passes a `synthetic event object` to your handler function. This object contains information about the event, such as the `target element`, and provides methods like ``stopPropagation()`` and ``preventDefault()`` for controlling event behavior.

These methods allow you to `prevent the event from propagating` through the DOM or `prevent the default browser action` (like following a link or submitting a form).

- Synthetic events ensure consistent and efficient event handling in React components. -->


=========================== props children========================




### What is `props.children` in React?

* A parent component can pass any content to a child component, including `HTML elements, dynamically generated layouts, or other React components`.

* The child component can access this passed content through ``props.children`` and decide where and how to render it.

* ``children` is a special built-in prop provided by React. It allows components to receive other components or elements as data, similar to how we pass normal props like `name`, `value`, or `id`.`

* Any content placed between a component's opening and closing tags is automatically passed to that component as the ``children` prop`.

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

`Think of `props.children` as a placeholder that allows a component to wrap and display custom content provided by its parent.`

`It helps create reusable and flexible components, because the same component can display different content depending on what the parent passes.`

Interview summary:

> ``props.children` is a special React prop that contains the elements or components placed between a component's opening and closing tags. It allows a parent component to pass UI content to a child component, making components more reusable and flexible.`








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

==============================================================

### Suspense

- Suspense is a feature in React that allows you to handle loading states for asynchronous operations,
- such as dynamically loading components or data.
- It helps manage the user experience by showing fallback content while the main content is being loaded.

==============================================================

Here's why we use return () => { ... }:

Cleanup Function Definition: The return statement defines the cleanup function.
This function will be called when the component unmounts or before the effect runs again if any dependencies change.


==============================================================


what is routing in react js

In a single-page React Application,
routing refers to the process of navigating between different pages without triggering a full page reload.

React Router DOM is an npm package that enables you to implement dynamic routing in a web app.

===================================================================

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

`Code Optimization in React:`

Code optimization is the process of improving the performance of a React application by making the code more efficient and reducing unnecessary work.

It helps to:
- Reduce unnecessary re-renders.
- Improve application speed and responsiveness.
- Reduce memory usage.
- Improve overall user experience.

Common React optimization techniques:

- Use `React.memo` to prevent unnecessary re-renders of components.
- Use `useMemo` to memoize expensive calculations.
- Use `useCallback` to memoize functions and prevent unnecessary function recreations.
- Use `lazy loading` and `code splitting` to load only the required code.
- Avoid unnecessary state updates.
- Keep component state as local as possible.
- Use proper `keys` when rendering lists.
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
