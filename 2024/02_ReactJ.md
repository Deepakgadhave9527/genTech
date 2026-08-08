

========================================================
## React Fragments

- React Fragments allow you to group multiple JSX elements without adding an extra DOM element.

- They are useful when a component needs to return multiple elements 
without wrapping them in a `<div>` or another HTML element. 
This avoids unnecessary markup and helps prevent layout or CSS styling issues.

- Since Fragments do not create extra DOM elements, 

they keep the DOM cleaner, reduce unnecessary nesting, and make the markup easier to maintain.

### React Fragments can be written using two syntaxes:

1. `<React.Fragment>...</React.Fragment>` (or `<Fragment>...</Fragment>` after importing `Fragment`)
   - Use this when you need to pass a `key` prop, such as when rendering a list using `map()`.

2. "<>...</>" → "the Fragment shorthand syntax" or "the empty tag syntax."
   - This is the shorthand syntax.
   - Use it when you do not need to pass any props, including `key`.

### Why are React Fragments used?

- Group multiple JSX elements without adding an extra DOM element.
- Avoid unnecessary wrapper elements like `<div>`.
- Keep the DOM clean and simple.
- Reduce unnecessary DOM nesting.
- Help prevent layout and CSS styling issues.
- Improve code readability and maintainability.

### Interview Answer

React Fragments allow us to group multiple JSX elements without adding an extra DOM element. 
They are used when a component needs to return multiple elements while keeping the DOM clean.
 Fragments help avoid unnecessary wrapper elements, reduce DOM nesting, 
 and prevent layout or CSS styling issues. When a `key` prop is required,
  we use `<React.Fragment>`, otherwise we can use the shorthand syntax `<>...</>`.


========================================================


✅ **When to use `<Fragment>` (with `key`)**:  
- **Inside `.map()`** when rendering a list.  
- You **must** pass a `key` prop because React needs to **identify** each item during updates (add, delete, change).  
- Example:
  ```jsx
  {items.map(item => (
    <Fragment key={item.id}>
      <h2>{item.title}</h2>
      <p>{item.description}</p>
    </Fragment>
  ))}
  ```

✅ **When to use `<>...</>` (shorthand Fragment)**:  
- **Outside** of `.map()`, when you are **just grouping** elements.  
- **No need** to pass a `key`.  
- Example:
  ```jsx
  function Page() {
    return (
      <>
        <h1>Title</h1>
        <p>Paragraph</p>
      </>
    );
  }
  ```

---

🔵 **Important Concept:**  
- In React, when rendering a list (like using `.map()`), each element **must** have a unique `key` prop.  
- The `key` helps React **identify** which items have changed, been added, or removed when updating the DOM.  
- This makes rendering **faster** and **more efficient**.

---

🔵 **Wrong Example** (❌ using `<>...</>` inside `.map()` without `key`):
```jsx
{items.map(item => (
  <>
    <h2>{item.title}</h2>
    <p>{item.description}</p>
  </>
))}
```
*(React will show a warning: "Each child in a list should have a unique 'key' prop.")*

---

🔵 **Correct Example** (✅ using `<Fragment key={}>` inside `.map()`):
```jsx
{items.map(item => (
  <Fragment key={item.id}>
    <h2>{item.title}</h2>
    <p>{item.description}</p>
  </Fragment>
))}
```

  ========================================================

 ### What are error boundaries in React?

-Error Boundaries are special React class components that catch JavaScript errors anywhere 
in their child component tree and log those errors.

- Error boundaries help prevent the entire React application from crashing because of a single component error.

 - When an error occurs, error boundaries display a fallback UI instead of the component tree that crashed.


Error boundaries use two lifecycle methods:

 `getDerivedStateFromError()` is method to update the state to indicate an error has occurred.

`componentDidCatch()` → Used for logging error details or sending error reports to monitoring services.
        
- Error boundaries can only be created using Class -based components in React.

- because React provides special lifecycle methods like `componentDidCatch() and getDerivedStateFromError() `  which are available only in class components.

- Function components don’t support those error-handling lifecycle methods directly, so React can’t use them as error boundaries.

- You can wrap function components inside **class-based error boundaries** to catch errors during rendering.

- While function components cannot directly implement error boundaries, they can still utilize class-based error boundaries or external libraries to handle errors effectively.  

- Libraries like **`react-error-boundary`** provide hooks that enable error boundary behavior in function components.

- Function components can handle errors in **event handlers** or **asynchronous code** using `try-catch` blocks, but these won't catch rendering errors.



### **Errors Caught by Error Boundaries**
- **Render Phase**: Errors during component rendering.
- **Lifecycle Methods**: Errors in methods like componentDidMount, componentDidUpdate.
- **Constructors**: Errors in child component constructors.


### **Errors NOT Caught by Error Boundaries**
- **Event Handlers**: Use try-catch inside the handler.
- **Asynchronous Code**: Use try-catch or .catch() for Promises.
- **Server-Side Rendering (SSR)**: Handle SSR errors manually.
- **Errors in Error Boundary Itself**: Nest another error boundary if needed.

  -static getDerivedStateFromError() is a static method in a React class component that is
   invoked after an error has been thrown during rendering.

````javascript

  class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
          // Update state to indicate an error has occurred
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error("Error caught in Error Boundary:", error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
              // Fallback UI when an error occurs
      return <h1>Something went wrong.</h1>;
    }

    return this.props.children;
  }
}

static getDerivedStateFromError() → Updates the component state to indicate that an error has occurred and allows rendering of fallback UI.

-Function components cannot directly act as error boundaries because they do not support these error-handling lifecycle methods.

- That's because React uses special lifecycle methods (like componentDidCatch) that only work in class components—not in function components.



  ========================================================

  
  Function components cannot directly implement React Error Boundaries because they don't support
 lifecycle methods like getDerivedStateFromError() and componentDidCatch(). 
 However, 
 function components can be wrapped inside class-based Error Boundaries to catch rendering errors

========================================================

  ###  What is Lifting State Up in ReactJS?

React follows one-way data flow, from parent to child using props. To send data from a child to a parent, we use lifting state up. The parent keeps the state and passes a callback 

functions to the child. When an event occurs in the child, it calls the callback with the required data, and the parent updates its state.



  Lifting State Up is the process of moving state from a child component to its closest common parent component 
  so that multiple child components can share and update the same state.




  

 In React, when you "lift state up," the **child component** doesn't directly send the state to the **parent**. Instead, the parent passes a **callback function** (as a prop) to the child, and the child invokes this function when it needs to "send" or update state in the parent.

Here's how it works:

1. **Parent defines state and a callback functions:
   - The **parent component** defines the state and a function to update that state.
   - This function is passed down to the child component via **props**.

2. **Child component calls the parent's function**:
   - The **child component** receives the parent's callback function as a prop.
   - When the child needs to "send" data to the parent (e.g., when an event occurs like a button click or form submission), it calls the parent's function and passes the relevant data as an argument.


If parent component needs state of child component then it can be passed to parent component using the concept called 'lifting state up'.

The parent sends a callback function to the child component through props.

### Example:


// Parent Component
function ParentComponent() {
  const [childData, setChildData] = useState('');

  // Callback function to update the parent's state
  const handleDataFromChild = (data) => {
    setChildData(data);
  };

  return (
    <div>
      <h1>Parent Component</h1>
      <p>Data from Child: {childData}</p>
      {/* Pass the callback to the child */}
      <ChildComponent sendDataToParent={handleDataFromChild} />
    </div>
  );
}

// Child Component
function ChildComponent({ sendDataToParent }) {
  const [inputValue, setInputValue] = useState('');

  const handleInputChange = (e) => {
    setInputValue(e.target.value);
  };

  const sendData = () => {
    // Call the parent's function, passing the input data
    sendDataToParent(inputValue);
  };

  return (
    <div>
      <h2>Child Component</h2>
      <input type="text" value={inputValue} onChange={handleInputChange} />
      <button onClick={sendData}>Send Data to Parent</button>
    </div>
  );
}
```


========================================================


Q_18. What is the significance of keys in React?

- key is a unique identifier 
in the elements in a list.

- Keys help React know which items have changed, been added, or removed, 

- During the Reconciliation process, 
  React uses keys to compare the previous and current Virtual DOM and identify:

  * Added items
  * Removed items
  * Updated items
  * Reordered items

- This minimizes unnecessary re-rendering and improves performance.

- Keys should be unique among sibling elements, and it is recommended to use unique IDs instead of array indexes for dynamic lists.


so it can update the UI with minimal changes and maximum performance.





  ========================================================

Q8. What is PureComponent?

- PureComponent is a built-in classs component in React that 
automatically performs a shallow comparison of props and state to determine whether the component should re-render.

- If the new props or state are the same as the previous values, the component will not re-render.

- Pure Components restricts the re-rendering and give the higher performance of the Component



### Example
   
import React, { PureComponent } from 'react';

class MyComponent extends PureComponent {
  render() {
    // Render method implementation
  }
}
```


- It automatically implements the shouldComponentUpdate() lifecycle method with a shallow comparison of props and state.

========================================================


- In function-based components, there is no direct equivalent of `PureComponent`.
 However, similar performance optimization can be achieved using `React.memo`.

- `React.memo` is a higher-order component (HOC) that works 
with function components to prevent unnecessary re-renders.

- `React.memo` performs a shallow comparison of props. 
If the props remain unchanged, the component will not re-render.


========================================================


Q12 what is dom ?

-DOM: DOM stands for ‘Document Object Model’.
-It is a structured representation of the HTML elements
that are present in a webpage or web-app.
- JavaScript interacts with the DOM using the document object.  


allowing it to access, modify, add, or remove HTML elements,
 attributes, styles, and content dynamically without reloading the page.


- Includes element nodes, text nodes, and attribute nodes.  
- Enables adding, removing, or modifying elements and attributes dynamically.  
- Handles user interactions like clicks, key presses, and other events.  
- Provides methods for navigation (parentNode, childNodes) and modification (setAttribute, appendChild).  
- Allows real-time updates and interactivity in web pages.  



=======================================
**Virtual DOM (VDOM)**:

- Virtual DOM  is a lightweight, in-memory representation of the actual DOM. 

- In React, when a component's state or props change, React does not directly update the Real DOM immediately.

-When a component's state or props change, React creates a new Virtual DOM tree and compares it with the previous Virtual DOM tree. 
This process is called diffing

-React identifies the differences between the old and new Virtual DOM and updates only the changed parts in the Real DOM. instead of updating the entire DOM.

-This process is called reconciliation, 


-VDOM is avoids unnecessary re-rendering of the entire dom/ui  

- This improves the rendering performance of the application.


=========================================================


Q23. What is lazy function in React?

Eager loading vs lazy loading

#1 Eager loading:-

-In case of eager loading, whole application gets initially(on first request )
-downloaded whether it is required or not.
-This will take more time to load the application initially


### Lazy Loading

- Lazy loading is a technique used to optimize the performance of an application by reducing  ts initial loading time through code splitting.

- Code splitting can be achieved using dynamic `import()` along with `React.lazy()` to load components only when they are needed.

- In lazy loading, the application code is split into multiple JavaScript bundles instead of a single bundle.

- Each bundle is downloaded only when it is required, which reduces the initial bundle size and improves page load performance.



#1 Static imports:-
import m from './module'


#2 Dynamic import :-
React.lazy();
const m = React.lazy(()=>import('./module'));









# ===========================================

# React Lifecycle Methods

Each React classs component has a lifecycle consisting of three main phases: Mounting, Updating, and Unmounting.

# A] Mounting Phase

The Mounting phase occurs when a component is created and inserted into the DOM.

React has four built-in methods that gets called in mounting phase, in this order, when mounting a component:

1. `constructor()`
2. `static getDerivedStateFromProps()`
3. `render()`
4. `componentDidMount()`

## 1) `constructor()`

- The constructor is the first lifecycle method that is called when a component is created.
- It is used to initialize the component's state and bind event handler methods.
- `super(props)` must be called before accessing `this` inside the constructor.
- The constructor is executed only once during the component's lifecycle.

---

## 2) `static getDerivedStateFromProps(props, state)`

getDerivedStateFromProps() is a static lifecycle method in React classs components that is used to update the component's state based on changes in props.

It is called before the render() method, both during initial rendering and when new props are received.
It takes props and state as parameters and returns an object to update the state or returns null if no update is required.

- It is a static lifecycle method.
- It is called before every render during both the mounting and updating phases.
- It is used to update the component's state based on changes in props, if required.
- It takes two parameters: `props` and `state`.
- It returns an object to update the state or `null` if no update is required.
- Since it is a static method, it does not have access to `this`.

---

## 3) `render()`

- It is responsible for displaying the component on the screen.

- The `render()` method is the only required lifecycle method in a classs component.
- It returns JSX that React renders to the UI.
- It should be a pure function and should not perform side effects such as API calls or updating the state directly.

---

## 4) `componentDidMount()`

- This method is called immediately after the component is mounted (inserted into the DOM).
- It is executed only once during the component's lifecycle.
- It is commonly used for:
  - Fetching data from an API.
  - Setting up timers.
  - Adding event listeners.
  - Initializing third-party libraries.
  - Performing DOM manipulations.

---

# B] Updating Phase

The Updating phase occurs when a component's state or props change.

Updates cause the component to re-render.

React calls the following lifecycle methods in this order:

1. `static getDerivedStateFromProps()`
2. `shouldComponentUpdate()`
3. `render()`
4. `getSnapshotBeforeUpdate()`
5. `componentDidUpdate()`

---

## 1) `static getDerivedStateFromProps(props, state)`

- Called before every render during the updating phase.
- Used to update the state based on changes in props.
- Returns an updated state object or `null`.

---

## 2) `shouldComponentUpdate(nextProps, nextState)`

-this method controls the rerenderings of the component.

- It returns a Boolean value.
- If it returns `true`, the component re-renders.
- If it returns `false`, the component does not re-render.
- It is mainly used for performance optimization by preventing unnecessary re-renders.

---

## 3) `render()`

- React calls the `render()` method to generate the updated UI.
- It returns the updated JSX.

---

## 4) `getSnapshotBeforeUpdate(prevProps, prevState)`

- This method is called immediately before React updates the Real DOM.
- It is used to capture information from the DOM before it is updated.
- It commonly stores values such as the scroll position.
- The value returned by this method is passed as the third parameter (`snapshot`) to `componentDidUpdate()`.




4] getSnapshotBeforeUpdate(prevProps, prevState)

This method gets executed just after the `render()` method and immediately before updating the DOM.

This method is used to capture previous values from the DOM, such as the scroll position or other information that needs to be preserved before the update.

The value returned by this method is available as the third parameter (`snapshot`) in the `componentDidUpdate()` method.



---

## 5) `componentDidUpdate(prevProps, prevState, snapshot)`

This method will get executed after updating the dom.
If you want to perform any operation after updating the application then write
that code here.

- This method is called immediately after the component has been updated in the DOM.
- It receives `prevProps`, `prevState`, and the `snapshot` returned by `getSnapshotBeforeUpdate()`.
- It is commonly used for:
  - Making API calls based on prop or state changes.
  - Updating the DOM.
  - Performing operations after a component update.

---

# C] Unmounting Phase

The Unmounting phase occurs when a component is removed from the DOM.

React calls the following lifecycle method:

## `componentWillUnmount()`

- This method is called only once before the component is removed from the DOM.
- It is used to clean up resources and prevent memory leaks.
- Common cleanup tasks include:
  - Clearing timers.
  - Removing event listeners.
  - Canceling API requests.
  - Closing WebSocket or other network connections.

---

# Lifecycle Order

### Mounting

1. `constructor()`
2. `static getDerivedStateFromProps()`
3. `render()`
4. `componentDidMount()`

### Updating

1. `static getDerivedStateFromProps()`
2. `shouldComponentUpdate()`
3. `render()`
4. `getSnapshotBeforeUpdate()`
5. `componentDidUpdate()`

### Unmounting

1. componentWillUnmount()

---

## Interview Summary

React lifecycle methods are special methods available in classs components that are automatically called during different phases of a component's lifecycle. The lifecycle consists of three phases: Mounting, Updating, and Unmounting. These methods are used to initialize state, render the UI, handle updates, perform side effects such as API calls, and clean up resources before the component is removed from the DOM.

Note: Lifecycle methods are available only in classs components. In function components, similar lifecycle behavior is achieved using the \*\*`useEffect()` Hook.


# ===================================================================

# Q10. What are Controlled and Uncontrolled Components in React?

## Controlled Component:

1. Form data is handled by a **React component**.
2. The input's value is controlled by **React state (`useState`)**.
3. Updates to the input are done via the **`onChange`** event handler.
4. **Validation is easier because React controls the form state.**
5. React handles the form’s data, making it easy to validate or modify.
6. **React state is the single source of truth.**

---

## Uncontrolled Component:

1. Form data is handled by the **DOM itself**.
2. The input's value is managed by the **DOM**.
3. It accepts its current value using a **ref (`useRef`)**.
4. **Validation is possible, but it is less convenient because React doesn't control the input state.**
5. It’s simpler for scenarios where you don’t need to track state continuously.
6. **The DOM is the single source of truth.**

=================================================

What is JSX and how JSX can help applications in React.js?

JSX (JavaScript XML) is a syntax extension for JavaScript  xml
that allows developers to write HTML-like code inside JavaScript.

React converts JSX into regular JavaScript using tools like Babel 
before it is executed in the browser.

It makes UI code more readable, easier to maintain, 
and helps create dynamic user interfaces by combining JavaScript logic 
and markup in a single file.

 **React.createElement()** is automatically used during JSX conversion.  
- Since React 17, **JSX no longer requires importing React** due to the new JSX transform.  



========================================================


## Q4. What are the differences between Functional Components and Class Components?

### A) Functional Components

1. Functional components are **JavaScript functions** that accept `props` as arguments and return JSX.

2.  Functional Components created using **regular functions** or **arrow functions**.

3. Functionbase Components manage state using **hooks** like `useState`, `useReducer`, and more advanced hooks like `useContext`.  

4. They handle lifecycle behavior using **`useEffect()`** instead of classs lifecycle methods.

5. Functionbase Components use **`useRef()`** to create and manage references to DOM elements.

6. They **do not use the `this` keyword**.

7. Functionbase Components return JSX **directly** without requiring a `render()` method.

8. Cannot implement error boundaries directly; must wrap them with a classs component.


9. They are simpler, more concise, and easier to read and maintain.

10. Functional components with Hooks are the **recommended approach** for modern React development.

11. Earlier, functional components were called **stateless components**, but after the introduction of Hooks, they can also manage state.

---

### B) Class Components

1. Class components are created using the **ES6 `class` syntax** and extend `React.Component`.

2. They manage state using **`this.state`**.

3. They update state using the **`this.setState()`** method.

4. They use lifecycle methods such as **`componentDidMount()`**, **`componentDidUpdate()`**, and **`componentWillUnmount()`**.

5. They use **`React.createRef()`** to create references.

6. They use the **`this` keyword** to access state, props, and methods.

7. They require a **`render()`** method to return JSX.

8. They **can implement Error Boundaries** using methods like `componentDidCatch()`.

9. They are generally more verbose and require more code than functional components.

10. They are commonly found in **older (legacy) React applications**, although they are still supported.

11. Class components are often referred to as **stateful components** because they manage state using `this.state`.







========================================================


Q4. What are the differences between a classs component and functional component?



### **Functional Components**  
- JavaScript functions that accept `props` as arguments and return React elements.  
-  Functional Components Created using **arrow functions** or **regular function_syntax to define the component.  

- Functionbase Components manage state using **hooks** like `useState`, `useReducer`, and more advanced hooks like `useContext`.  
- Lifecycle methods are handled via **hooks** like `useEffect`, allowing you to replicate `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount`.  

- Refs are managed using the `useRef` hook, allowing access to DOM elements or component instances.

- Cannot implement error boundaries directly; must wrap them with a classs component.

- JSX is returned directly from the function_body without needing a `render()` method.  
-React lifecycle methods cannot be used in functional components.
Functional component is also called as a stateless component.

- Functional components with hooks are preferred, providing a modern approach to managing component behavior and state.  
- Generally better performance as there is less overhead compared to class components.  
- Functional components are more concise, making the code easier to read and maintain.  

---

### **Class Components**  
- Components created using ES6 **class_syntax**, extending `React.Component` or `PureComponent` for optimizations.  
- State is managed using `this.state` and updated using the `setState()` method, allowing more complex state logic.  

- Class components have built-in lifecycle methods such as `componentDidMount`, `shouldComponentUpdate`, `componentWillUnmount`, and `componentDidUpdate`.  

- Refs are managed using `React.createRef()`, which provides direct access to DOM nodes or_class component instances.  

- Requires a `render()` method to return JSX, ensuring that components always return UI when rendered.  

- Class components can implement **error boundaries** to catch JavaScript errors anywhere in their child component tree using `componentDidCatch`.  

- While functional components with hooks are now preferred, _class components are still widely used in older React codebases and libraries. 

- _Class components can implement **shouldComponentUpdate** or extend `PureComponent` to prevent unnecessary re-renders.  

React _class component is called as a state-full component.





========================================================
## **Q5. What is the difference between State and Props in React?**

### **State**

1. State Managed **within** the component **managed within a component**.
2. State is **mutable**, meaning its value can be updated.
3. In **_class components**, state is updated using **`setState()`**.
4. In **functional components**, state is managed using the **`useState()`** hook.
5. Updating the state causes the component to **re-render**.
6. State is used to manage **component-specific (internal) data**, such as form inputs, counters, toggle buttons, and UI state.
7. State is **owned and controlled by the component** itself.
8. State can be **passed to child components through props** when needed.
9. State updates may be **asynchronous** (React may batch multiple updates for better performance).



### **Props**

1. Props (short for **Properties**) are used to **pass data or functions from a parent component to a child component**.
2. Props are **immutable (read-only)** in the child component.
3. Props **cannot be modified** by the child component.
4. Props are **controlled by the parent component**.
5. When the parent passes updated props, the child component **automatically re-renders** with the new values.
6. Props are used for **communication between components**.
7. Props help make components **reusable and configurable**.
8. Props can contain **data, objects, arrays, functions (callback functions), or even JSX elements**.



### **How State and Props Work Together**

1. The parent component stores data in **state**.
2. The parent passes that state to child components using **props**.
3. When the parent's state changes, React re-renders the parent component.
4. The child receives the updated props and automatically re-renders.



### **Mutable vs Immutable**

1. **Mutable** means the value **can be changed or updated** (State).
2. **Immutable** means the value **cannot be changed by the component that receives it** (Props).




========================================================

Q15 is the Shadow DOM the same as the Virtual DOM?

-No, they are different.

-The Shadow DOM is a browser technology designed primarily for scoping variables and  encapsulating HTML, CSS, and JavaScript in Web Components.

-Virtual DOM optimizes UI updates -used by JavaScript libraries like React to efficiently update the UI.






==========================================


# React Reconciliation

React uses the reconciliation algorithm to update the UI.


React does not directly update the Real DOM every time a change happens. Instead, it:

1. Creates a new Virtual DOM when the component re-renders.
2. Compares it with the previous Virtual DOM.
3. Finds the differences (changes).
4. Updates only the required parts of the Real DOM.

This comparison process between the previous Virtual DOM and the new Virtual DOM is called **Reconciliation**.

Reconciliation helps React improve performance by avoiding unnecessary DOM updates.


 React uses a diffing algorithm to identify the differences between the two Virtual DOM trees and updates only the changed parts of the real DOM.

 
# React Reconciliation

React uses the reconciliation algorithm to update the UI.


React does not directly update the Real DOM every time a change happens. Instead, it:

1. Creates a new Virtual DOM when the component re-renders.
2. Compares it with the previous Virtual DOM.
3. Finds the differences (changes).
4. Updates only the required parts of the Real DOM.

This comparison process between the previous Virtual DOM and the new Virtual DOM is called **Reconciliation**.

Reconciliation helps React improve performance by avoiding unnecessary DOM updates.

React uses a Diffing Algorithm during reconciliation to identify the differences between the two Virtual DOM trees and update only the required parts of the Real DOM.


-------------

React uses a **diffing algorithm** to identify what has changed between two Virtual DOM trees.

When state or props change:

1. Component re-renders.
2. React creates a new Virtual DOM tree.
3. React compares the new Virtual DOM with the old Virtual DOM.
4. React identifies the differences.
5. React updates only the changed elements in the Real DOM.

## Optimization Techniques:

1. **Tree Diffing:** React compares the current and updated Virtual DOM trees and identifies the minimum changes required.

2. **Batching:** React groups multiple updates into a single update process, reducing unnecessary updates to the Virtual DOM and Real DOM.

React uses the **Fiber architecture** to manage the reconciliation process.

Fiber allows React to pause and resume work, break work into smaller units, and improve responsiveness in large applications (especially in React 16+).

This enables **concurrent rendering**, allowing React to prepare updates without blocking the main thread.


-Reconciliation is the algorithm that React uses to update the UI. 




========================================================



Q14. What is the difference between Real DOM and Virtual DOM?
Below are the main differences between Real DOM and Virtual DOM,

Real DOM Virtual DOM

Updates are slow -------------------- Updates are fast
DOM manipulation is very expensive. -------------------- DOM manipulation is very easy
You can update HTML directly. -------------------- You Can’t directly update HTML
It causes too much of memory wastage -------------------- There is no memory wastage
Creates a new DOM if element updates -------------------- It updates the JSX if element update

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  


========================================================
Q What is ReactDOM?

- Package: ReactDOM is a package that provides DOM-specific methods.
- Usage: Used at the top level of a web app to manage DOM elements efficiently.

 ReactDOM.render() Function
- Purpose: Renders a single React Component or multiple components wrapped in a parent component or a div element.
- Efficiency: Utilizes Reacts efficient methods for updating the DOM, such as changing only a subtree and using efficient diff algorithms.
- Return Value: Returns a reference to the component or null if a stateless component was rendered.


======================================================

  


  You are right. Some important points were missing. Here is a more complete **interview-ready answer** in numbered list format.

# Q4. What are the differences between Functional Components and _Class Components?

## A) Functional Components:

1. Functional components are **JavaScript functions** that accept `props` as arguments and return React elements (JSX).

2. They are created using **regular function syntax** or **arrow function syntax**.

3. They manage state using **React Hooks** like `useState()` and `useReducer()`.

4. They share and consume data using Hooks like **`useContext()`**.

5. They handle lifecycle behavior using the **`useEffect()` Hook**, which can replace lifecycle methods like `componentDidMount()`, `componentDidUpdate()`, and `componentWillUnmount()`.

6. They manage references to DOM elements using the **`useRef()` Hook**.

7. They do not use the **`this` keyword** to access props, state, or methods.

8. They return JSX directly from the function body and do not require a **`render()` method**.

9. They cannot create **Error Boundaries directly**; Error Boundaries are implemented using _class components.

10. They are simpler, shorter, and easier to read and maintain.

11. They require less code compared to _class components.

12. They are the recommended approach for creating new React applications.

13. Earlier, functional components were called **stateless components**, but after Hooks were introduced, they can manage state and are not limited to stateless behavior.

14. They use optimization Hooks like **`useMemo()`** and **`useCallback()`** to improve performance when required.

15. Functional components are generally preferred because they provide a cleaner and more modern approach to React development.

---

## B) _Class Components:

1. _Class components are created using **ES6 _class syntax**.

2. They extend **`React.Component`** or **`React.PureComponent`**.

3. They manage state using **`this.state`**.

4. They update state using the **`this.setState()`** method.

5. They use built-in lifecycle methods like:

   * `componentDidMount()`
   * `componentDidUpdate()`
   * `componentWillUnmount()`

6. They use **`React.createRef()`** to access DOM elements or component instances.

7. They use the **`this` keyword** to access props, state, and component methods.

8. They require a **`render()` method** to return JSX.

9. They can implement **Error Boundaries** using lifecycle methods like `componentDidCatch()`.

10. They can optimize performance using:

* `shouldComponentUpdate()`
* `React.PureComponent`

11. They often require **method binding** to maintain the correct value of `this`.

12. They are more verbose and require more boilerplate code compared to functional components.

13. They are mostly used in older React applications and legacy codebases.

14. _Class components are often called **stateful components** because they manage state using `this.state`.

15. Modern React development generally prefers functional components with Hooks over _class components.

This version includes the missing points like **props, hooks, context, refs, error boundaries, optimization, `this` keyword, method binding, and legacy usage**.





============================




-By updating only the required parts instead of re-rendering the entire DOM, React reduces unnecessary DOM operations and improves application performance.


===============

Virtual DOM (VDOM):

- The Virtual DOM is a lightweight, in-memory representation of the actual DOM.

- In React, when a component's state or props change, React does not directly update the Real DOM immediately.

- First, React creates a new Virtual DOM tree based on the updated state or props.

- React then compares the new Virtual DOM tree with the previous Virtual DOM tree.

- This comparison process is called diffing.

- During diffing, React identifies what has changed between the old Virtual DOM and the new Virtual DOM.

- After identifying the changes, React decides the most efficient way to update the UI.

- This process is called reconciliation.

- React then updates only the changed parts in the Real DOM instead of updating the entire DOM.

- Because React updates only the required parts, it reduces unnecessary DOM operations.

- This improves the rendering performance of the application.




 ========================================================

Differentiate between stateful and stateless components?


Functional Component or Stateless component

Functional component is like pure function_in JavaScript.
Functional component is also called as a stateless component.
The functional component only receives props from parent component and return you JSX elements.
The functional component does n’t play with any lifecycle methods of React and doesn’t play with the component state...


_Class component or state-full component

React _class component is called as a state-full component.
Stateful component plays with all life cycle methods of React.
This component will modify state.

------

When would you use a stateless component
When you just need to present the props
When you do not need a state, or any internal variables
When creating element does not need to be interactive
When you want reusable code

When would you use a stateful component?

When building element that accepts user input or element that is interactive on page
When dependent on state for rendering, such as, fetching data before rendering
When dependent on any data that cannot be passed down as props





========================================================
q19. What are React components?


-Components are the building blocks of any React app and a typical React app will have many of these.

-A React component can be either stateful or stateless.
-Stateful components are of the _class type,
-while stateless components are of the function_type.
