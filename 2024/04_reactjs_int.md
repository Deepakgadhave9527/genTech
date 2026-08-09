
===========================================================

### React Portal

With the help of a `React Portal`, we can render a React component's UI into a different DOM node
outside the normal parent element


means it outside the normal parent element we have normaly root elemet 

Even though the UI is rendered at a different location in the `DOM`, it is still part of the `same React component tree`. Therefore, React features such as `context, state, and event handling` continue to work normally.

React Portals are commonly used for `modals, tooltips, dropdowns, popups, and overlays`,

 especially when we need to avoid CSS issues caused by the parent element, such as `overflow: hidden`, `stacking contexts`, and `z-index` problems.

 positioning/layout constraints hierarchy` is necessary to avoid `styling or z-index issues`.




- It’s created using:

``jsx
ReactDOM.createPortal(child, container);
``

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

- React performs only one re-render instead of re-rendering of each individual state to update.

- thats  improving performance applications.

-Before React 18, React provides automatic batching only for event handlers

- From React 18, with createRoot, React provides automatic batching for updates from event handlers as well as asynchronous operations such as 
setTimeout, 
Promises, 
fetch callbacks, and 
async/await, resulting in fewer unnecessary renders.


=================================

### Conditional Rendering in ReactJS

`Conditional rendering in React means displaying different UI elements based on a condition.` 

React provides different ways to achieve conditional rendering:

- `if/else` → Checks a condition and renders different UI based on whether the condition is `true or false`.

- `Ternary operator (`? :`)` → Checks a condition and renders `one UI when true and another UI when false`.

- `Logical AND (`&&`)` → Renders the UI `only when the condition is true`; if the condition is false, nothing is rendered.


========================================================

### What are rule use hooks in react

There are 3 rules for hooks:

1]Hooks can only be called inside React function components.

2]Hooks can only be called at the top level of a component.

3]Hooks cannot be conditional.

========================================================

### StrictMode

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

We commonly add StrictMode at the root of the application so React can perform development-time checks on the entire component tree.

========================================================
### native browser event

A native browser event is an event created directly by the browser 

when something happens, like a click or key press.
It can be handled using browser APIs such as addEventListener().

Examples of `native browser events`:

click
keydown
keyup
input
change
submit
mouseover
scroll
focus
blur

For example, ``click`` is a native browser event:

```js
button.addEventListener("click", () => {
  console.log("Clicked!");
});
```

Here, ``click` = native browser event`.


`React wraps the native browser event and gives it to you as a Synthetic Event.`

========================================================
### synthetic events


-In React, `synthetic events` are a layer of abstraction over native browser events. 

- It means React does not give you the original browser event directly. 
- Instead, React wraps the browser event inside its own object called SyntheticEvent.

- They provide a `consistent interface` for handling events across different browsers

- Synthetic Events `offer additional features` to improve event handling, 

such as preventDefault() to prevent the browser's default behavior and stopPropagation() to stop the event from propagating to parent elements.

When you attach an event handler, like onClick to a React element, 
React passes a SyntheticEvent object to  handler function.

- This object contains information about the event, such as the target element, and provides methods like stopPropagation() and preventDefault() for controlling event behavior.





=========================== props children========================

### What is `props.children` in React?

- A parent component can pass any content to a child component, including `HTML elements, dynamically generated layouts, or other React components`.

- The child component can access this passed content through `props.children` 

- Any content placed between a component's opening and closing tags is automatically passed to that component as the `children` prop`.


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
``

Here, the `<h1>` and `<p>` elements inside `<Card>` are passed from the parent component and are available inside `Card` through `props.children`.


=========================== 

### Normal Props

Normal props are used to send `specific data or values` to a component.
We can send strings, numbers, objects, arrays, functions, etc. through named props.
We can also send `HTML elements or React components` as a prop value.
The receiving component accesses them using `props.propName`.
Example: `<User name="John" profile={<Profile />} />`

### `props.children`

`props.children` is used to send `content inside a component`.
We can send text, HTML elements, dynamically generated layouts, or other React components.
The content is written between the component's opening and closing tags.
The receiving component accesses this content using `props.children`.
Example: `<Card><h1>Hello</h1><Profile /></Card>` → both elements are `props.children`.
```
========================================================

### What is Babel in ReactJS?

- Babel is a JavaScript compiler used in React applications.

- It converts JSX code into regular JavaScript that browsers can understand.

- Babel converts modern JavaScript syntax into older, it like a browser-compatible JavaScript.


#### Why do we need Babel?
Browsers cannot understand JSX directly.
Older browsers may not support newer JavaScript features (ES6+).
Babel converts modern syntax into compatible JavaScript.


- It allows developers to use the latest JavaScript language features while maintaining browser compatibility.

==============================================================



### React Suspense

``Suspense` is a React feature that allows us to `show fallback UI while a component is waiting for something to load`, most commonly a `lazy-loaded component`.

```jsx
import { Suspense, lazy } from "react";

const Profile = lazy(() => import("./Profile"));

function App() {
  return (
    <Suspense fallback={<p>Loading...</p>}>
      <Profile />
    </Suspense>
  );
}
```

Here, while `Profile` is being loaded, React displays:

```text
Loading...
```

==============================================================


### Why do we use `return () => { ... }` in `useEffect()`?

- The function returned from `useEffect()` is called the `cleanup function`.
- React runs the cleanup `before the effect runs again when dependencies change`.
- React also runs the cleanup `when the component unmounts`.
- We use it to clean up resources created by the effect, such as `event listeners, timers, subscriptions, and connections`.
- This prevents `memory leaks and unwanted side effects`.

`Example:`

```jsx
useEffect(() => {
  const timer = setInterval(() => {
    console.log("Running");
  }, 1000);

  return () => {
    clearInterval(timer);
  };
}, []);
```

`Interview explanation:`

> “The function returned from `useEffect` is called the cleanup function. React executes it before re-running the effect when dependencies change and when the component unmounts. We use it to clean up resources such as timers, event listeners, and subscriptions.”



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


