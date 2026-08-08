
```javascript

    ---------------------- ### Additional Hooks:  ##------------------------------

   ### 01 useHistory

    - The useHistory hook gives you access to the history instance that you may use to navigate.

    - Provides access to the history prop in React Router
    - Refers to the history package dependency that the router uses
    - A primary use case would be for programmatic routing with functions, like push,goback replace, etc.

```


    02 useLocation

    Provides access to the location prop in React Router

    It is similar to window.location in the browser itself, but this is accessible everywhere as it represents the * Router
    state and location.
    A primary use case for this would be to access the query params or the complete route string.

    03 useParams

    Provides access to search parameters in the URL
    This was possible earlier only using match.params.

    Route paramater;
    the route paramater is value passed one component to another component
    while nevigating

    useParams() hook access the  route paramater;


    04 useRouteMatch

    Provides access to the match object
    If it is provided with no arguments, it returns the closest match in the component or its parents.
    A primary use case would be to construct nested paths.



    

================================================================
## `useLayoutEffect` vs `useEffect` (Theory – Interview Notes)

### **`useLayoutEffect`**

1. `useLayoutEffect` is a React Hook used to perform side effects that need to happen **before the browser paints (displays) the updated UI on the screen**.

2. It runs **after React updates the DOM** but **before the browser displays the UI** to the user.

3. Because it runs before the browser paints, it **blocks the browser from rendering** until the effect finishes.

4. It is mainly used when you need to **read, measure, or modify the DOM immediately** before the user sees it.

5. It helps prevent **visual flickering or layout shifts**, because changes are applied before the screen is updated.

6. Common use cases include:

   * Measuring an element's width or height.
   * Reading an element's position.
   * Scrolling to an element before it becomes visible.
   * Applying styles or layout adjustments synchronously.

7. Since it blocks painting, **heavy or time-consuming operations should be avoided**, as they can make the UI feel slow.

8. `useLayoutEffect` has the same syntax and dependency array as `useEffect`.

9. It also supports a **cleanup function**, which runs before the next execution or when the component unmounts.

10. Use `useLayoutEffect` **only when your effect depends on the layout or visual appearance of the page**.

---

# `useEffect`

1. `useEffect` is a React Hook used to perform **side effects** in a functional component.

2. It runs **after React updates the DOM and after the browser paints (displays) the updated UI**.

3. Since it runs after painting, it **does not block the browser from rendering**, making the UI more responsive.

4. It is the **default and recommended Hook** for handling most side effects.

5. Common use cases include:

   * Fetching data from an API.
   * Making HTTP requests.
   * Setting timers (`setTimeout`, `setInterval`).
   * Adding and removing event listeners.
   * Updating the document title.
   * Logging or analytics.

6. `useEffect` runs after every render by default, unless a dependency array is provided.

7. The dependency array controls **when the effect should execute**:

   * No dependency array → Runs after every render.
   * Empty dependency array (`[]`) → Runs only once after the initial render.
   * Dependencies provided (`[value]`) → Runs when any dependency changes.

8. It supports a **cleanup function**, which is used to remove event listeners, clear timers, cancel subscriptions, or perform other cleanup before the next effect or when the component unmounts.

9. Because it runs after the browser has displayed the UI, users may briefly notice visual changes if the effect modifies the layout.

10. **Use `useEffect` for almost all side effects**, and choose `useLayoutEffect` only when you must measure or synchronously update the DOM before the browser displays it.

### Interview Rule to Remember

* **`useEffect` → After DOM update and after browser paint (UI is visible).**
* **`useLayoutEffect` → After DOM update but before browser paint (UI is not yet visible).**
* **Use `useEffect` by default; use `useLayoutEffect` only for layout-related work.**


============================
============================================================

### why need forwardRef in function base ?

Functional components do not expose instances by default. This means if a parent tries to attach a ref, it won’t work — the parent won’t be able to access any internal DOM element or logic inside the functional component. Using `forwardRef` allows functional components to receive a ref from a parent and forward it to a child DOM element or another component. This enables use cases like:
– focusing an input,
– scrolling to an element, and
– measuring a DOM node from the parent.

Class components do expose their instance automatically. When a parent uses a ref, it can access the class instance directly. This allows:
– calling methods defined in the class, and
– accessing internal properties.


forwardRef is allows the parent component to directly access a DOM element or custom method inside a functional child component.





















































































































































@@@@@@@@@@@@@@@@@@@@@@@@@@@@@===================@@@@@@@@@@@@@@@@@@@@@@@@@

## **React Hooks Overview**

Hooks are a feature introduced in React 16.8 that allow you to use state and other React features without writing a class. They typically start with the `use` keyword. Hooks are used within functional components and enable handling local component state, lifecycle features, and more.

### **Basic Hooks**

1. **useState**

   - **Purpose:** Maintains local state in a functional component.
   - **Syntax:**
     ```javascript
     const [state, setState] = React.useState(initialState);
     ```
   - **Example:**

     ```javascript
     import React, { useState } from "react";

     function Counter() {
       const [count, setCount] = useState(0);

       return (
         <div>
           <p>You clicked {count} times</p>
           <button onClick={() => setCount(count + 1)}>Click me</button>
         </div>
       );
     }
     ```

2. **useReducer**

   - **Purpose:** Manages complex state logic and dependencies on previous state.
   - **Syntax:**
     ```javascript
     const [state, dispatch] = useReducer(reducer, initialState);
     ```
   - **Example:**

     ```javascript
     import React, { useReducer } from "react";

     const INITIAL_STATE = { count: 0 };

     function reducer(state, action) {
       switch (action.type) {
         case "increment":
           return { count: state.count + 1 };
         case "decrement":
           return { count: state.count - 1 };
         default:
           throw new Error();
       }
     }

     function Counter() {
       const [state, dispatch] = useReducer(reducer, INITIAL_STATE);

       return (
         <div>
           <p>Count: {state.count}</p>
           <button onClick={() => dispatch({ type: "increment" })}>
             Increment
           </button>
           <button onClick={() => dispatch({ type: "decrement" })}>
             Decrement
           </button>
         </div>
       );
     }
     ```

3. **useContext**

   - **Purpose:** Allows sharing of values between components without passing props manually.
   - **Syntax:**
     ```javascript
     const Context = React.createContext(defaultValue);
     ```
   - **Example:**

     ```javascript
     import React, { createContext, useContext } from "react";

     const ThemeContext = createContext("light");

     function ThemedComponent() {
       const theme = useContext(ThemeContext);
       return <div>The current theme is {theme}</div>;
     }

     function App() {
       return (
         <ThemeContext.Provider value="dark">
           <ThemedComponent />
         </ThemeContext.Provider>
       );
     }
     ```

4. **useEffect**

   - **Purpose:** Handles side effects in functional components. It replaces lifecycle methods like `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount`.
   - **Syntax:**
     ```javascript
     useEffect(() => {
       // Side effect logic here
       return () => {
         // Cleanup logic here
       };
     }, [dependencies]);
     ```
   - **Example:**

     ```javascript
     import React, { useState, useEffect } from "react";

     function Example() {
       const [count, setCount] = useState(0);

       useEffect(() => {
         document.title = `You clicked ${count} times`;

         return () => {
           document.title = "React App";
         };
       }, [count]);

       return (
         <div>
           <p>You clicked {count} times</p>
           <button onClick={() => setCount(count + 1)}>Click me</button>
         </div>
       );
     }
     ```

### **Additional Hooks**

1. **useCallback**

   - **Purpose:** Memoizes a callback function to prevent unnecessary re-renders.
   - **Syntax:**
     ```javascript
     const memoizedCallback = useCallback(() => {
       // Callback logic here
     }, [dependencies]);
     ```
   - **Example:**

     ```javascript
     import React, { useCallback, useState } from "react";

     function ChildComponent({ onClick }) {
       return <button onClick={onClick}>Click me</button>;
     }

     function ParentComponent() {
       const [count, setCount] = useState(0);

       const handleClick = useCallback(() => {
         setCount(count + 1);
       }, [count]);

       return (
         <div>
           <p>Count: {count}</p>
           <ChildComponent onClick={handleClick} />
         </div>
       );
     }
     ```

2. **useMemo**

   - **Purpose:** Memoizes a value to avoid expensive calculations on every render.
   - **Syntax:**
     ```javascript
     const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);
     ```
   - **Example:**

     ```javascript
     import React, { useMemo, useState } from "react";

     function computeExpensiveValue(a, b) {
       // Expensive computation
       return a + b;
     }

     function Example() {
       const [a, setA] = useState(1);
       const [b, setB] = useState(2);

       const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);

       return (
         <div>
           <p>Computed Value: {memoizedValue}</p>
           <button onClick={() => setA(a + 1)}>Increment A</button>
           <button onClick={() => setB(b + 1)}>Increment B</button>
         </div>
       );
     }
     ```

3. **useRef**

   - **Purpose:** Provides a way to access and manage DOM elements directly.
   - **Syntax:**
     ```javascript
     const ref = useRef(initialValue);
     ```
   - **Example:**

     ```javascript
     import React, { useRef } from "react";

     function FocusInput() {
       const inputRef = useRef(null);

       const focusInput = () => {
         inputRef.current.focus();
       };

       return (
         <div>
           <input ref={inputRef} type="text" />
           <button onClick={focusInput}>Focus Input</button>
         </div>
       );
     }
     ```

4. **useImperativeHandle**

   - **Purpose:** Customizes the instance value that is exposed to parent components when using `ref`.
   - **Syntax:**
     ```javascript
     useImperativeHandle(ref, () => ({
       // Custom instance values
     }));
     ```
   - **Example:**

     ```javascript
     import React, { useImperativeHandle, forwardRef, useRef } from "react";

     const CustomInput = forwardRef((props, ref) => {
       const inputRef = useRef(null);

       useImperativeHandle(ref, () => ({
         focus: () => {
           inputRef.current.focus();
         },
       }));

       return <input ref={inputRef} />;
     });

     function App() {
       const ref = useRef(null);

       const focusInput = () => {
         ref.current.focus();
       };

       return (
         <div>
           <CustomInput ref={ref} />
           <button onClick={focusInput}>Focus Input</button>
         </div>
       );
     }
     ```

### **React.memo**

- **Purpose:** Memoizes a component to prevent unnecessary re-renders if its props haven’t changed.
- **Syntax:**

  ```javascript
  const MemoizedComponent = React.memo(Component);
  ```

- **Example:**

  ```javascript
  import React from "react";

  function ExpensiveComponent({ data }) {
    // Expensive calculations
    return <div>{data}</div>;
  }

  export default React.memo(ExpensiveComponent);
  ```

### **Custom Hooks**

- **Purpose:** Allows sharing of stateful logic between components.
- **Syntax:**
  ```javascript
  function useCustomHook() {
    // Custom hook logic
  }
  ```
- **Example:**

  ```javascript
  import { useState, useEffect } from "react";

  function useWindowWidth() {
    const [windowWidth, setWindowWidth] = useState(window.innerWidth);

    useEffect(() => {
      const handleResize = () => setWindowWidth(window.innerWidth);

      window.addEventListener("resize", handleResize);

      return () => {
        window.removeEventListener("resize", handleResize);
      };
    }, []);

    return windowWidth;
  }

  function Component() {
    const windowWidth = useWindowWidth();

    return <div>Window width is {windowWidth}</div>;
  }
  ```

---

These examples provide a comprehensive overview of how to use various React Hooks effectively in your functional components.

