


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



======================================================================

# Difference Between Props and Redux

Props are used in React to pass data from a parent component to a child component. They follow a one-way data flow Parent → Child 

and are useful for communication between closely related components. However, when the application becomes large and many components need the same data, passing props can lead to prop drilling. 

Redux solves this problem by storing shared application data in a centralized store. Components can directly access and update this data using hooks like useSelector and useDispatch. 

So, props are mainly used for component-to-component communication, while Redux is used for managing global application state."



=================================================================
React State vs Redux State


`State:` React State is used to manage in local component. It is mainly accessed by that component and its child components, and State can be managed using hooks like `useState()` and `useReducer()`. It is simple and suitable for small or component-specific changes. When the state changes, the related component and its children can re-render. React State is not directly shared between unrelated components.

`Redux:` Redux State is used to manage global application data in a centralized Redux Store. Multiple components can access the same state using `useSelector()` and update it by dispatching actions with `dispatch()`. Redux updates follow the `Action → Reducer → Store` flow. It is useful for large applications where many components need shared data and helps avoid prop drilling by providing a centralized state.

 
===============================================================
``js
Redux is a state management library used to manage global application state.


### Redux (Traditional Redux):

- In traditional Redux, we requires more boilerplate and configuration.

- Actions, action types, reducers, and store configuration are often maintained separately, which can result in more code and files.

- We Uses `createStore()` to create the Redux store.

- In traditional Redux,`middleware installed and configured manually` using `applyMiddlewar()`. 
- For asynchronous operations such as API calls, middleware like `Redux Thunk or Redux Saga` is required because Redux handles synchronous actions by default.   

 -----------------

### `Redux Toolkit (RTK):`

- Redux Toolkit is the official and recommended way to use Redux. 

-  we Uses `configureStore()` to create the Redux store.

- Uses `createSlice()` to create the initial state, reducers, action creators, and action types in a single place.

- main advantage regarding middleware is that configureStore() automatically sets up recommended middleware, including Redux Thunk by default, 

-so no separate installation or applyMiddleware() configuration is normally required. RTK also provides createAsyncThunk() to make asynchronous operations like API calls easier to write and manage. 

- Therefore, RTK simplifies middleware configuration and reduces boilerplate compared to traditional Redux

======================================================================
 
 React useContext 

 - useContext hook is used to create common data that can be accessed throughout 
  the component hierarchy without passing the props down manually to each level.

 -useContext is a React Hook used to consume values from the Context API.
 
 - It helps share data between components without prop drilling.

 First, we create a context using createContext().
 Then we provide the value using Context.Provider.
 Finally, we access the value in any child component using useContext(ContextName).

 Common Uses:
 ✔ Theme (Dark/Light Mode)
 ✔ User Information
 ✔ Authentication
 ✔ Language
 ✔ Global Settings


======================================================================
  
 1. Create Context

import { createContext } from "react";

export const ThemeContext = createContext("Default Value");


 2. Provide Context

import { ThemeContext } from "./ThemeContext";

function App() {
  const theme = "Dark";

  return (
    <ThemeContext.Provider value={theme}>
      <Component />
    </ThemeContext.Provider>
  );
}


 3. Consume Context using useContext (Recommended)

import { useContext } from "react";
import { ThemeContext } from "./ThemeContext";

function Component() {
  const theme = useContext(ThemeContext);

  return <h1>{theme}</h1>;
}


// 4. Consume Context using Consumer (Older Method)

import { ThemeContext } from "./ThemeContext";

function Component() {
  return (
    <ThemeContext.Consumer>
      {(theme) => <h1>{theme}</h1>}
    </ThemeContext.Consumer>
  );
}



======================================================================




useContext vs Redux

useContext

- useContext hook is used to create common data that can be accessed throughout the component hierarchy without passing the props down manually to each level.

- It helps share data between components without prop drilling.

- we create a context using createContext().
 Then we provide the value using Context.Provider.
 Finally, we access the value in any child component using useContext(ContextName).

- When the Provider's value changes, all components consuming that Context re-render.

- `useContext` does not provide built-in features like actions, reducers, or middleware for state management.

- Async operations need to be handled separately using tools like `useEffect`, async functions, or custom hooks.

- Best suited for simple or global data such as Theme, Authentication, Language, User Preferences, etc.

 Common Uses:
 ✔ Theme (Dark/Light Mode)
 ✔ User Information
 ✔ Authentication
 ✔ Language
 ✔ Global Settings



Redux

- Redux is a predictable state container for JavaScript applications.
- Redux is a state management library used to manage and share application state.
- There is a central store that holds the entire state of the application.
- Each component can access the stored state without having to pass props from
 one component to another (avoids prop drilling).

- Redux provides powerful debugging tools like Redux DevTools, which help track state changes and actions.
- Redux provides a structured way to manage complex state updates using actions and reducers.
- Redux supports async operations using middleware like Redux Thunk and Redux Saga.

Redux is better suited for large-scale applications where many components 
need to share and update complex state.

----------------------------------------------------------------------------

I use useContext for sharing simple global data like theme, language, authentication, or user preferences. 
For complex state that is shared across many components, changes frequently, 
or requires async operations—such as products, shopping carts, orders, or dashboard data—I use Redux.
In production applications, it's common to use both: useContext for lightweight global settings
 and Redux for application state management."

======================================================================
 
1] predictable state means you can easily understand how and why the state changed.


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
### what is routing in react js


Routing in React.js is the process of displaying different components or pages based on the URL in the browser. 

RR allows users to navigate between different parts of a React application without entire reloading the page.

This provides a faster and smoother user experience because only the required component is updated instead of loading the whole webpage again. 

React Router DOM is an npm package that enables dynamic routing in React applications.


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





======================================================================

# Q. What is Redux?

- Redux is a predictable state container for JavaScript applications.
- Redux is a state management library used to manage and share application state.
- There is a central store that holds the entire state of the application.
- Each component can access the stored state without having to pass props from one component to another (avoids prop drilling).
- There are three main building blocks: Actions, Reducers, and Store.
- Redux follows a one-way data flow: Component → Dispatch Action → Reducer → Store Updates → UI Re-renders.
- Redux Toolkit (RTK) is the official and recommended way to write Redux code.

---

# 1] Action

- An Action is a plain JavaScript object that describes what happened in the application.

- Actions are used to send information/data from the application to the Redux store.
- Every action must have a `type` property that describes the event/action.
- `payload` is optional and contains additional data required to update the state.

- Actions are dispatched using the `dispatch()` method.

type is a property of an action that describes what action/event happened. 
The type tells the reducer what happened or which action to perform.

payload is a property of an action that contains the data/information needed to update the state.

Example:

```js
{
  type: "counter/increment",
  payload: 1
}
```

Actions are dispatched using:

```js
dispatch(action);
```

Example:

```js
dispatch(increment());
dispatch(incrementByAmount(5));
```

----------------------------------------------------------------------------

# 2] Reducer

A Reducer is a pure function that takes the current state and an action, then returns a new state without modifying the existing one.

const initialState = {
  count: 0,
};

function counterReducer(state = initialState, action) {
  switch (action.type) {

    case "counter/increment":
      return {
        ...state,
        count: state.count + 1,
      };

    case "counter/decrement":
      return {
        ...state,
        count: state.count - 1,
      };

    case "counter/incrementByAmount":
      return {
        ...state,
        count: state.count + action.payload,
      };

    default:
      return state;
  }
}

- The action describes what happened.
- The reducer decides how to update the state.
- Reducers should not directly mutate the state.


- Redux Toolkit uses Immer internally, so code like `state.count++` is safe and actually creates an immutable update.

Example:

```js
increment: (state) => {
  state.count++;
}
```

-------------------------------------------------------------------------


# 3] Store

- A Store is an object that holds the entire state tree of the application.
- There is only one store in a Redux application.
- The store is responsible for storing the application state and managing state updates.
- When creating a store using `configureStore()`, we need to provide the reducer because the reducer contains the logic for updating the state.
- The store imports the reducer and uses it to update the state when an action is dispatched.

- Components access the Redux store using `Provider`, `useSelector()`, and `useDispatch()`.

### Store Methods

- `getState()` → Returns the current state of the store.
- `dispatch()` → Sends an action to the reducer to update the state.
- `subscribe()` → Adds a listener that runs whenever the state changes.
- `unsubscribe()` → Removes the listener.


- React components using `useSelector()` automatically re-render when the selected state changes.


Example:

```js
import { configureStore } from "@reduxjs/toolkit";
import counterReducer from "./counterSlice";

const store = configureStore({
  reducer: {
    counter: counterReducer,
  },
});

export default store;

======================================================================
# useSelector()

`useSelector()` is a React-Redux hook used to read/access data from the Redux store inside a React component.


Example:

const count = useSelector((state) => state.counter.count);

-------------------------------------------------------------------------

# useDispatch()

`useDispatch()` is a React-Redux hook used to dispatch (send) actions from a React component to the Redux store.

useDispatch() → Send actions that update data in the store (through reducers)

Works:
- Sends actions to the Redux store.
- The reducer receives the action and updates the state based on that action.

Example:

const dispatch = useDispatch();

dispatch(increment());

-------------------------------------------------------------------------

# "Provider"

`Provider` is a React-Redux component that `connects the Redux store to the React application`.

Works:
- Makes the Redux store available to all React components.
- Allows components to use `useSelector()` and `useDispatch()`.

Example:

<Provider store={store}>
  <App />
</Provider>
```
