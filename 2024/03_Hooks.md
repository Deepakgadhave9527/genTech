

=====================================



#### Ref

With the help of **ref**, we can directly access and interact with a DOM element.

In React, a **ref (reference)** is an object that allows us to directly access a DOM element or store a mutable value.

* Refs are attached to React elements using the special **`ref`** attribute.

Refs are commonly used when you need to:

* Access a DOM element directly.
* Manage focus, text selection, or media playback.
* Trigger imperative actions on child components.
* Store a mutable value that does not cause a re-render when changed.
* Control media playback.
* Perform animations.
* Integrate with third-party DOM libraries.



========================================================

createRef()

**Class-Based Components**:

- createRef()` is primarily used in class base components to create ref .

- Use React.createRef() in the constructor.
- Access the ref using this.myRef.
- Attach the ref to an element in the render method.


```java

import React, { Component } from 'react';

class MyComponent extends Component {
  constructor(props) {
    super(props);
    // Create a ref
    this.myRef = React.createRef();
  }

  componentDidMount() {
    // Access the ref after the component mounts
    this.myRef.current.focus();
  }

  render() {
    return (
      <div>
        <input type="text" ref={this.myRef} />
      </div>
    );
  }
}

export default MyComponent;

```

-------------------------------------------
 ### `useRef()`

- Use the `useRef()` hook to create a ref in Functional Components
- Access the ref using myRef.current.
- Attach the ref to an element in the JSX.
- Use the useEffect hook for side effects.

-useRef() is used to create mutable object references that persist across renders without causing re-renders

  const myRef = useRef(initialValue);
  `

  ```javascript
  function MyComponent() {
      // Create a ref
      const myRef = useRef(null);

      useEffect(() => {
         // Access the ref after the component mounts
    myRef.current.focus();
          console.log(myRef.current); // Access DOM node
      }, []);

      return <div ref={myRef}>Hello, World!</div>;
  }
  ```
--------------------------------------------

Why is createRef() not recommended in functional components?

"createRef() is not recommended in functional components because it creates a new ref on every render ,previous ref is loss , whereas useRef() preserves the same ref object across  every renders."



- Class-based components use React.createRef() and this.myRef.
-Function-based components use the useRef hook.

Using createRef() inside a functional component is not recommended because 
it creates a new ref object on every render and does not preserve the previous value.
which resets the ref value each time. 

**`useRef()` returns a persistent ref object that remains the same across all renders 
and preserves its value throughout the components lifecycle.**









========================================================================
  ### What is useRef in React?

  ### `useRef()`

With the help of **ref**, we can directly access and interact with a DOM element.

  The useRef is a hook that allows to directly create a reference to the DOM element in the functional component.
- Use the `useRef()` hook to create a ref in Functional Components
- Access the ref using myRef.current.
- Attach the ref to an element in the JSX.
- Use the useEffect hook for side effects.

-useRef() is used to create mutable object references that persist across renders without causing re-renders


  ```javascript

    const myRef = useRef(initialValue);

  function MyComponent() {
      // Create a ref
      const myRef = useRef(null);

      useEffect(() => {
         // Access the ref after the component mounts
    myRef.current.focus();
          console.log(myRef.current); // Access DOM node
      }, []);

      return <div ref={myRef}>Hello, World!</div>;
  }
  ```



  The useRef returns a mutable ref object.
  Use useRef if you need to manage focus, text selection, trigger imperative animations or integrating third-party libraries.

============================================================

### forwardRef

### What is forwardRef in React?


– `forwardRef` in React function component
with help of forwardRef we can pass a ref from a parent component to a child component.

– This is useful when you want to access a **DOM element** from the child component in the parent component.

============================================================

### can forwardRef use in class base componet ?

– Functional components can directly handle refs using `React.useRef()`, but only for accessing **DOM elements within the same component**. To pass a ref from **parent to child**, `forwardRef()` must be used.

– **Class components** can directly handle refs using `React.createRef()`, and a parent component can interact with a **child class component instance** directly, **without using forwardRef**.


### Can forwardRef be used in class components?

No, forwardRef is designed specifically for functional components.

Class components automatically expose their instance, so a parent can create a ref to a class component and access its methods or properties directly.

Thus, forwardRef is not needed when dealing with class components.



============================================================

### can forwardRef is required after react 19 version?

In React 18 and below, we need forwardRef to pass refs to functional components.
But in React 19, React allows ref to be passed as a regular prop — so forwardRef is no longer required in many cases.


============================================================
### `useImperativeHandle()`

`useImperativeHandle()` is a React Hook used with `forwardRef()` to customize what a parent component can access through a ref.

It is useful when a child component needs to expose specific imperative methods, such as `focus()`, `reset()`, `open()`, or `close()`, instead of exposing the entire child component or DOM element.





#### useImperativeHandle()

useImperativeHandle() is used with forwardRef() `if we want child component to control what the parent can access through the ref.`

It is useful when a child needs to expose specific imperative methods such as focus, reset, open, or close.





============================================================
## useLayoutEffect

- useLayoutEffect is a React Hook perform side effects

- useLayoutEffect runs synchronously after DOM updates but before the browser paints the UI.

It is useful when you need to:

Read layout measurements from the DOM.
Make immediate DOM changes.
Prevent visual flickering or layout shifts.


Example
useLayoutEffect(() => {
  const height = ref.current.offsetHeight;
  console.log("Height:", height);
}, []);




It is used when you need to read layout measurements or update the DOM immediately to prevent visual flickering or layout shifts.



============================================================

- The useLayoutEffect hook and  useEffect is similarly  but differs in its execution timing. 

- While useEffect runs asynchronously after the browser has painted the screen, 

- useEffect it suitable for tasks like data fetching, setting up event listeners, or updating state based on props


useLayoutEffect = runs before user sees the screen

useEffect = runs after user sees the screen


================================================================

### 04 React.memo

- `React.memo` is a higher-order component.
- It is used to optimize the performance of functional components by memoizing them.
- It is used to prevent unnecessary re-renders of functional components when their props have not changed.

- React compares the current props with the previous props.
- If the component receives the same props as the previous render, React skips re-rendering that component.
- If there’s no change, React reuses the previously rendered result.
- If props change, the component re-renders normally.
- This prevents unnecessary re-renders.

**Useful when:**

- Component is heavy (complex UI, large calculations).
- Props rarely change.
- Parent re-renders often, but child’s props remain the same.

- If you add a child component inside a parent component, and you are not passing any props to the child, then:

Without React.memo, the child will re-render whenever the parent re-renders.

- With React.memo, since there are no props, React will skip the child’s re-render when the parent re-renders.

========================================================================
### What does memoizing mean?

Memoization is a technique where the result of a function call is cached (stored), so if the same inputs occur again, the cached result is returned immediately instead of recalculating.



========================================================================


### useMemo

- The useMemo hook is used to memoize the result of a calculation

- useMemo is used to avoid re-running an expensive calculation when a component re-renders. 

- When the parent sends new props or the component's state changes, the component may re-render.
- Without useMemo, the expensive calculation runs again.

- With useMemo, the cached result is returned until its dependencies change.

- It can improve performance by avoiding unnecessary expensive calculations during component re-renders.


“By calculation, I mean any expensive operation such as filtering, sorting, searching, parsing,

### Common Use Cases of `useMemo`

* **Expensive calculations**
* **Filtering large lists**
* **Sorting large lists**
* **Complex data transformations**
* **Maintaining stable object/array references**
* **Memoizing Context Provider values**

```js
const memoziationOfResult = useMemo(()=>{},[])
```

`useMemo` does not prevent a component from re-rendering. 
`React.memo` can prevent a component from re-rendering when its props have not changed.
`useMemo` only prevents an expensive calculation from running again unnecessarily.


========================================================================
- The useMemo hook is used to memoize the result of a calculation
- It recalculates the value only when its dependencies change; otherwise, it returns the cached value

It is mainly useful for expensive calculations or data transformations, such as filtering, sorting, searching, parsing, or complex calculations.



-------------------------------------------------------------

### **useCallback**

useCallback hooke memoizes a function and returns the same function reference until its dependencies change.

useCallback can prevent unnecessary child component re-renders when a function is passed as a prop to a child wrapped with React.memo, which can improve application performance.

Mainly to prevent unnecessary re-renders when passing functions to memoized child components or when a function is a dependency of useEffect.



### 1. Passing a function to a child component (Most Common) ✅

### 2. When a function is a dependency of `useEffect`

### 3. When a function is a dependency of another Hook

### 4. Expensive event handlers

## When NOT to use `useCallback`




========================================================================

### 03 useeffect()

    -useEffect() is a React Hook introduced in React 16.8 version.
    -useEffect() is a React hook used to handle side effects in functional components
    -It works like componentDidMount, componentDidUpdate, and componentWillUnmount combined.
    -It replaces lifecycle methods from class components, keeping the logic cleaner and more reusable.
    -It allows functional components to perform side effects, such as:
             1)Fetching data from APIs
             2)Setting up subscriptions or event listeners
             3)Interacting with the DOM
             4)Managing timers or intervals

## ✅ 1. `useEffect(() => { ... }, [])`

**Equivalent to:** `componentDidMount`
**Runs:** **Once** after the **initial render**

- Fetching data when the component loads
- Setting up a subscription
- Initializing a timer

```jsx
useEffect(() => {
  console.log("Component mounted");
  fetchData();
}, []);
```

Why only once?

- Because the **dependency array is empty**, React knows this effect doesn’t depend on any state or props.
- So it only runs **after the first render**, like `componentDidMount`.

## ✅ 2. `useEffect(() => { ... }, [dep])`

**Equivalent to:** `componentDidUpdate` (but for specific dependencies)

- After **initial render**
- Then **every time `dep` changes**

- Responding to changes in props or state
- Making API calls when a user selects something

```jsx
useEffect(() => {
  console.log("User ID changed:", userId);
  fetchUserDetails(userId);
}, [userId]);
```

### 🔄 Why controlled?

- React tracks `userId`, and only reruns the effect **when `userId` changes**.

---

## ✅ 3. `useEffect(() => { return () => { ... } }, [])`

**Equivalent to:** `componentWillUnmount`
**Runs:**

- The **cleanup function** runs when the component is about to unmount.

- Cleaning up event listeners
- Stopping intervals/timers
- Closing sockets or subscriptions

```jsx
useEffect(() => {
  const id = setInterval(() => console.log("Tick"), 1000);

  return () => {
    clearInterval(id); // Cleanup when unmounting
  };
}, []);
```

---

## ✅ 4. `useEffect(() => { ... })` (no dependency array)

- The effect will run after every render of the component.
- This includes the initial render as well as all subsequent re-renders caused by state or props changes.
- React will call the effect function every time the component updates.
- This behavior is similar to combining `componentDidMount` and `componentDidUpdate` from class components.
- In other words, whenever the component renders for any reason — whether due to state updates, prop changes, or parent re-renders — the code inside the effect will execute.

```jsx
useEffect(() => {
  console.log("Component rendered");
});
```

- This can cause **performance issues** if heavy logic is inside.
- Prefer using `[deps]` to control when it runs.

      The purpose of the useEffect hook is to allow you to perform side effects in a functional components.
      React useEffect hook is a function that gets executed for 3 different React component lifecycles.
      Those lifecycles are componentDidMount, componentDidUpdate, and componentWillUnmount lifecycles.

      Examples of side effects you will typically perform in a React application
      are: data fetching, and manually changing the DOM in React components.  setting up a subscription

      {/*
        useEffect(() => {
      // Mounting

      return () => {
          // Cleanup function
      }

  }, [Updating])

}



==============================================================

  What are Hooks?

- Hooks are a feature introduced in React 16.8.
- Hooks allow us to use state and other React features in functional components without writing a class component.

- React Hooks, such as useState, allow functional components to create and manage local state.

- Hooks also allow us to use React lifecycle-related features (such as component mount, update, and unmount) in functional components using `useEffect`.

- Hooks do not work inside class components. They can only be used in functional components.
- Most React Hooks start with the `use` prefix, such as `useState`, `useEffect`, and `useContext`.


==============================================================

### 01 useState()

-useState, allow functional components to create and manage local state.

-useState() is a React Hook used to add state to functional components.

-It returns an array with two elements:

1.The current state value.
2.A function to update that state.

## const [state,setState]=React.useState(0)


================================================================

### 02 `useReducer()`

- `useReducer()` is a React Hook used to manage complex state logic inside functional components.

- It is an alternative to `useState()` when:

  - State updates depend on previous state.
  - Multiple related state variables need to be updated together.
  - The state logic is more complicated or requires multiple conditions.

- Syntax:

  ```javascript
  const [state, dispatch] = useReducer(reducer, initialState);
  ```

- It takes two arguments:

  1. `reducer`: a function that takes the current state and an action, and returns the new state.
  2. `initialState`: the initial value of the state.

- The `dispatch` function is used to send actions to the reducer.

- `useReducer()` is useful for managing form states, complex calculations, and state machines.

```javascript
const INITIAL_STATE = {
  title: "",
  description: "",
  price: 0,
  category: "",
  tags: [],
  quantity: 0,
  comments: "",
};

const reducerFunction = (state, action) => {
  switch (action.type) {
    case "Change_Input":
      return {
        ...state,
        [action.payload.name]: action.payload.value,
      };
    case "Add_Tags":
      return {
        ...state,
        tags: [...state.tags, ...action.payload],
      };
    case "Increment":
      return {
        ...state,
        quantity: state.quantity + 1,
      };
    case "Decrement":
      return {
        ...state,
        quantity: state.quantity - 1,
      };
    case "Remove_Tag":
      return {
        ...state,
        tags: state.tags.filter((tag) => tag !== action.payload),
      };
    default:
      return state;
  }
};

const [state, dispatch] = useReducer(reducerFunction, INITIAL_STATE);

const OnHandleChange = (e) => {
  const { name, value } = e.target;
  dispatch({
    type: "Change_Input",
    payload: { name, value },
  });
};
```