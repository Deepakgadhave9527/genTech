

---------------------------------------------------------------------------------
Q21. What are fragments? Why are fragments better than container divs?

react .fragment add group of multiple elements without adding an extra node in the Dom

React fragment uses two syntaxes

React fragments allow you to group multiple elements without adding an extra node to the DOM.

React fragments use two syntaxes:

1. `<Fragment> ... </Fragment>`: Use this when you need to pass a key prop, typically in list rendering inside a `map()` method.
2. `<> ... </>`: Use this shorthand syntax when you do not need to pass a key prop.


Avoid Extra DOM Nodes:

When you return multiple elements in a component's render method, they need to be wrapped in a parent element. Using Fragments prevents adding unnecessary extra DOM nodes (like <div> or <span>).


Improve Performance:

Since Fragments don't create extra DOM elements, it helps improve the rendering performance, especially in large applications.

  ---------------------------------------------------------------------------------

  Q22. What are error boundaries in React?

  - Error boundaries in React that catch JavaScript errors anywhere in their child component tree and log those errors.

- Error boundaries display a fallback UI instead of the component tree that crashed, helping to prevent the entire application from crashing due to a single error.

- Use `getDerivedStateFromError()` is method to update the state to indicate an error has occurred.
- Use `componentDidCatch()` to log error information.


  static getDerivedStateFromError() is a static method in a React class component that is
   invoked after an error has been thrown during rendering.

   -Use componentDidCatch() to log error information.



  class ErrorBoundary extends React.Component {
    constructor(props) {
      super(props);
      this.state = { hasError: false };
    }
  
    static getDerivedStateFromError(error) {
      // Update state to indicate an error has occurred
      return { hasError: true };
    }
  
    render() {
      if (this.state.hasError) {
        // Fallback UI when an error occurs
        return <h1>Something went wrong.</h1>;
      }
      return this.props.children;
    }
  }



### **Errors Caught by Error Boundaries**
- **Render Phase**: Errors during component rendering.
- **Lifecycle Methods**: Errors in methods like `componentDidMount`, `componentDidUpdate`.
- **Constructors**: Errors in child component constructors.


### **Errors NOT Caught by Error Boundaries**
- **Event Handlers**: Use `try-catch` inside the handler.
- **Asynchronous Code**: Use `try-catch` or `.catch()` for Promises.
- **Server-Side Rendering (SSR)**: Handle SSR errors manually.
- **Errors in Error Boundary Itself**: Nest another error boundary if needed.

  ---------------------------------------------------------------------------------


  Q25. What is Lifting State Up in ReactJS?


  If parent component needs state of child component then it can be passed to parent
  component using the concept called 'lifting state up'.



---------------------------------------------------------------------------------


Q_18. What is the significance of keys in React?

-A key is a unique identifies

-During the reconciliation process (when React compares the previous and current UI), keys help React determine which elements are added, removed, or changed.

-Keys help React identify which items have changed, are added, or are removed.
-Keys should be given to the elements inside the array to give the elements a stable identity.

  ---------------------------------------------------------------------------------

Q8. What is PureComponent?

-PureComponent which do not re-renders when the value of state and props has been updated with the same values.

-Pure Components restricts the re-rendering and give the higher performance of the Component

- Definition: A React base class that prevents unnecessary re-renders.
- Behavior: Does not re-render when state and props values are updated with the same values.
- Performance: Enhances performance by restricting re-rendering.

#### Characteristics
- Shallow Comparison: Uses shallow comparison of state and props in `shouldComponentUpdate`.
- Optimized Rendering: Only re-renders if state or props change.

#### React Re-Render Triggers
- setState: Called within the component.
- props Update: Props values are updated.
- this.forceUpdate(): Explicitly called to force a re-render.

### Example
   
import React, { PureComponent } from 'react';

class MyComponent extends PureComponent {
  render() {
    // Render method implementation
  }
}
```

### Summary
- Use Case: Ideal for optimizing performance when updates depend only on state or props.
- Comparison: Automatically implements `shouldComponentUpdate` with a shallow comparison.


PureComponent (Class-based): Automatically implements shouldComponentUpdate() with shallow comparison for performance optimization.

React.memo (Function-based): A higher-order component for memoizing function components, providing similar performance optimizations as PureComponent.


---------------------------------------------------------------------------------
Q11. What do you understand by refs in React?


Refs are a feature provided by React to directly access and interact with DOM elements or React elements created in a component. 

They are used to manage focus, text selection, media playback, animations, and integrating with third-party libraries

- attached to React elements via the ref attribute.



Class-Based Components:

Use React.createRef() in the constructor.
Access the ref using this.myRef.
Attach the ref to an element in the render method.

Function-Based Components:

Use the useRef hook to create a ref.
Access the ref using myRef.current.
Attach the ref to an element in the JSX.

Use the useEffect hook for side effects.


Class-based components use React.createRef() and this.myRef.
Function-based components use the useRef hook.



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






import React, { useRef, useEffect } from 'react';

const MyComponent = () => {
  // Create a ref
  const myRef = useRef(null);

  useEffect(() => {
    // Access the ref after the component mounts
    myRef.current.focus();
  }, []);

  return (
    <div>
      <input type="text" ref={myRef} />
    </div>
  );
};

export default MyComponent;



When to Use Refs

Managing focus, text selection, or media playback.
Triggering imperative animations.
Integrating with third-party DOM libraries.


----------------------------------------------------------------------------



- Refs are used to access DOM nodes or React elements created by the render method.
- Refs are created using React.createRef() method and
- attached to React elements via the ref attribute.
- Refs are commonly assigned to an instance property when a component is constructed


When to Use Refs

Managing focus, text selection, or media playback.
Triggering imperative animations.
Integrating with third-party DOM libraries.

When not to use refs

Should not be used with functional components because they dont have instances.





---------------------------------------------------------------------------------



Q12 what is dom ?

-DOM: DOM stands for ‘Document Object Model’.
-It is a structured representation of the HTML elements
that are present in a webpage or web-app.
- JavaScript interacts with the DOM using the `document` object.  

- Includes element nodes, text nodes, and attribute nodes.  
- Enables adding, removing, or modifying elements and attributes dynamically.  
- Handles user interactions like clicks, key presses, and other events.  
- Provides methods for navigation (`parentNode`, `childNodes`) and modification (`setAttribute`, `appendChild`).  
- Allows real-time updates and interactivity in web pages.  



===============================================================================

**Virtual DOM (VDOM)**:

The Virtual DOM is a concept that used improve the efficiency of web page updates.

-ReactJS does not update the real DOM directly but it updates the Virtual DOM
Virtual DOM is compared to Real DOM; virtual dom  updates only that part has changed 


 It is a lightweight, in-memory representation of the actual DOM. 
 
 When a components state changes, React creates a new Virtual DOM tree and compares it to the previous one. The differences (or 'diffs') are computed, and only the changed parts are updated in the real DOM."


-Virtual DOM is about avoiding unnecessary update whole dom of rendering
This approach is time-efficient, leading to faster application performance.

===============================================================================

**Reconciliation**:
Reconciliation is the algorithm that React uses to update the UI. 
It works by comparing the current Virtual DOM tree to the updated one
and making the minimum number of changes necessary to bring the real DOM in line with the updated state.

Reconciliation is the algorithm that React uses to update the UI. 
It works by comparing the current Virtual DOM tree to the updated one and calculates the minimal changes required to synchronize the real DOM with the updated state."

**Optimization Techniques**:
1. **Tree Diffing**: React compares the current and updated Virtual DOM trees, identifying the minimal changes required.
2. **Batching**: React batches multiple changes into a single update, reducing the number of updates to both the Virtual DOM and the real DOM.


React's reconciliation


React's reconciliation is the process by which React updates the user interface efficiently when the component state or props change. Here’s a brief overview:

- **Virtual DOM**: React maintains a lightweight representation of the actual DOM called the Virtual DOM. When state or props change, React first updates the Virtual DOM.

- **Diffing Algorithm**: React uses a diffing algorithm to compare the new Virtual DOM with the previous version. It identifies changes by comparing nodes, minimizing the number of updates needed.

- **Re-rendering**: Once differences are identified, React determines the most efficient way to apply these changes to the actual DOM, updating only the parts that have changed.

- **Batch Updates**: React batches multiple updates together to improve performance and reduce the number of DOM manipulations.

In summary, React’s reconciliation process ensures that the UI updates efficiently and optimally by comparing and applying changes to the DOM based on the Virtual DOM.





---------------------------------------------------------------------------------



Q14. What is the difference between Real DOM and Virtual DOM?
Below are the main differences between Real DOM and Virtual DOM,

Real DOM Virtual DOM

Updates are slow -------------------- Updates are fast
DOM manipulation is very expensive. -------------------- DOM manipulation is very easy
You can update HTML directly. -------------------- You Can’t directly update HTML
It causes too much of memory wastage -------------------- There is no memory wastage
Creates a new DOM if element updates -------------------- It updates the JSX if element update


---------------------------------------------------------------------------------


Q15 is the Shadow DOM the same as the Virtual DOM?
-No, they are different.

-The Shadow DOM is a browser technology designed primarily for scoping variables and CSS in
web components.

-The virtual DOM is a concept implemented by libraries in JavaScript on top of browser APIs.

---------------------------------------------------------------------------------



Q15 is the Shadow DOM the same as the Virtual DOM?

-No, they are different.

-The Shadow DOM is a browser technology designed primarily for scoping variables and CSS in
web components.

- This is a browser technology designed primarily for encapsulating and scoping variables, DOM, and CSS within web components.
- It allows you to create self-contained components with their own DOM structure and styling, isolated from the rest of the document.


==============================================



Q23. What is lazy function in React?

Eager loading vs lazy loading

#1 Eager loading:-

-In case of eager loading, whole application gets initially(on first request )
-downloaded whether it is required or not.
-This will take more time to load the application initially

#2 Lazy loading:-

-In lazy loading the initial loading time of the application is reduced by spliting the code
-for spliting the code we can use using dynamic imports by React.lazy() method/function
-In lazy loading we can create  multiple bundle  instead of creating  single bundle
-Each bundle can be separately downloaded when required



#1 Static imports:-
import m from './module'


#2 Dynamic import :-
React.lazy();
const m = React.lazy(()=>import('./module'));




---------------------------------------------------------------------------------

Q. What are the different lifecycle methods in React?
<!-- 
-Each component in React has a lifecycle which you can monitor and manipulate during its three main phases.
-The three phases are: Mounting, Updating, and Unmounting. -->

-Each component in React has a lifecycle which has go to three main phase Mounting, Updating, and Unmounting.

#  
   A ] Mounting:
Mounting means putting elements into the DOM.
React has four built-in methods that gets called in mounting phase, in this order, when mounting a component:

1) constructor()
2) getDerivedStateFromProps()
3) render()
4) componentDidMount()

#1) constructor()

-We can set the initial state of the component inside this method.
-The constructor method is used to set the initial state and bind methods to the component.

2) get_Derived_State_From_Props()

- in this method React used to update a component's internal state based on changes in its props.
- It's invoked right before calling the `render` method.
- It returns an object to update the state or `null` if no update is needed.
- It takes two parameters: `nextProps` and `prevState`.


3) render()
The render() method is required, and
its the method that actually outputs the HTML to the DOM.


4) componentDidMount()
this method gets executed after mounting a component.
this method gets executed only once.
this method is used perform one time initialization operations like
fetching data from server, initializing a timer, etc.


```````````````````````````````````````````````````````````````````````````````````````````
# B] Updating:
-Updating is next phase in the React lifecycle
<!-- is when a component is updated. -->
-In updating phase, a mounted componented is modified.
-Updates in react are caused by changes in state or props.
-Update leads to re-rendering of the component.

React has five built-in methods that gets called, in this order, when a component is updated:

1)getDerivedStateFromProps()
2)shouldComponentUpdate()
3)render()
4)getSnapshotBeforeUpdate()
5)componentDidUpdate()



2)shouldComponentUpdate()
-this method controls the rerenderings of the component.
-this method returns boolean value.
-this method is return true when component rerender
-if return false then component will not rerender



4)getSnapshotBeforeUpdate(prevProps, prevState)
This method gets executed just after the render() method and before updating
the DOM.
This method is used hold some previous values like previous state and previous
props.
The value returned by this method will be availble as third parameter in
componentDidUpdate() method

5) componentDidUpdate(prevProps, prevState)
This method will get executed after updating the dom.
If you want to perform any operation after updating the application then write
that code here.

````````````````````````````````````````````````````````````````````````````````````
# C ] Unmounting:

componentWillUnmount. This method will get executed when a component is being removed from the DOM:
componentWillUnmount()
<!-- 
    1)componentWillUnmount()
  
    This method will get executed only once before removing the component from DOM.
    This method is used to perform resource releasing/cleaning operations like
    clear timer, close connections, etc. -->




===========================================================================

Q10. What are controlled and uncontrolled components in React?


-In a controlled component, form data is handled by a React component.
- In an uncontrolled component, form data is handled by the DOM, and refs are used to access that data.


## Controlled Component:

- In Controlled Component current values accepts throug call back like onchange
-Data is controlled by the  react component.
-It allows validation control.
-It has better control over the form elements and data.

## uncontrolled component:

-It accepts its current value as a ref.
-data is controlled by the DOM itself.
-It does not allow validation control.
-It has limited control over the form elements and data.






---------------------------------------------------------------
Q2. What is JSX and how JSX can help applications in React.js?

-JSX stands for JavaScript XML
-JSX is a html like syntax.

-jSX allows us to write HTML elements in JavaScript and

-place them in the DOM without any createElement() or appendChild() methods.

- JSX converts HTML tags into react elements. by calling React.createElement(),
-this will be done by the babel.

- If you write JSX in a file then React package must be imported





------------------------------------------------------------------  ------------------------------------------------------------------
### What is React.js?

- JavaScript library for building fast, interactive user interfaces for web and mobile apps.
- Creates reusable UI components.
- Enables large web applications to update data without reloading the page.
- Supports creation of Single Page Applications (SPA).
- Focuses on developing User Interfaces (UI) to improve app speed.
- Utilizes a virtual DOM to enhance performance.
- Virtual DOM is faster than the regular DOM.
- Usable on both client and server-side, and with other frameworks.
- Created by Jordan Walke, a software engineer at Facebook.




---------------------------------------------------------------------------------
Q What is ReactDOM?

- Package: ReactDOM is a package that provides DOM-specific methods.
- Usage: Used at the top level of a web app to manage DOM elements efficiently.

 ReactDOM.render() Function
- Purpose: Renders a single React Component or multiple components wrapped in a parent component or a div element.
- Efficiency: Utilizes React's efficient methods for updating the DOM, such as changing only a subtree and using efficient diff algorithms.
- Return Value: Returns a reference to the component or null if a stateless component was rendered.





---------------------------------------------------------------------------------

Q4. What are the differences between a class component and functional component?

Functional Components


-A Functional components are basic JavaScript functions that accepts props as an argument and
returns a React element.
-You can created function component by usign arrow function or regular function keyword.

- Functional components Sometimes referred to as stateless components as they simply accept data
and display them in some form;


-In case of function component state can be maintained by using useState() hook.

-React lifecycle methods cannot be used in functional components.
-so There is no render method used in functional components.


-Functional Components mainly focuses on the UI of the application, not on the behavior.


Class Components

-Class-based Components uses ES6 class syntax
-Class components extend from React.Component.

-All class based components are child classes for the Reactjs Component of class
-Class components Sometimes called Stateful components because they implement logic and state.

-In case of class component local state can be maintained using 'state' property
-React lifecycle methods can be used inside class components

-Class-based components can have refs to mangining DOM nodes.
-We pass props down to class components and access them with this.props.

-In case of class component local state can be maintained using 'state' property
-update the state using the setState() method.

<!-- Class-based components can use shouldComponentUpdate() and PureComponent() performance optimisation techniques. -->


<!-- 

-functional components, we can use hooks (useState) to manage state.
-Hooks can only be used in functional components, not in-class components.

-Functional components can accept and use props.
-Functional components should be favored if you do not need to make use of React state.
-Functional components arrow functions but we can also be created with the regular function keyword. 

-->







---------------------------------------------------------------------------------

Q5. What is the difference between state and props?


State

-state is maintained data inside a component.

-In case of class component local state can be maintained using 'state' property
-update the state using the setState() method.

-In case of function component state can be maintained by using useState() hook.

-If a child component need the state of parent component then that state can be passed
using props.

-State changes can be asynchronous.
-State is mutable.
-State holds information about the components.
-State cannot make components reusable.
-The State is internal and controlled by the React Component itself.



<!-- -It is local or owned by that specific component.
-The component itself will
-State cannot be accessed by child components.
-Stateless components cannot have State.
-States can be used for rendering dynamic changes with the component. -->


Props

-props is object used to pass data from parent component to child component
-props are read-only in the child component that receives them.

-Props are immutable.
-Props are used to communicate between components.

-Props make components reusable.
-Props are external and controlled by whatever renders the component.


-Props allow you to pass data from one component to other components as an argument.
-Props can be accessed by the child component.

-Stateless component can have Props.

<!---
-callback functions can also be passed, which can be 
-executed inside the child to initiate an update.
-Props are read-only.
 -->


---------------------------------------------------------------------------------

Q6. How would you create Higher Order Components (HOCs) in React.js?



An HOC is a function that accepts a component as its argument and returns a new component with some added functionality

-In React, Higher Order Component is an advanced technique for reusing component logic.
-In higher-order component function that takes a component and returns a new component.

We want an abstraction that allows us to define this logic in a single place and share it across many components. This is where higher-order components 

-According to the official website,
-Higher-Order Components are not part of the React API.
-but They are pattern that emerges from React's compositional nature.


-it is a function which accepts another function as an argument.
-higher-order component converts a component into another component.

With help of HoC You can do many tasks
Code Reusability
Props manipulation
State manipulation




### Higher-Order Components (HOCs) in React

- **Definition**: A Higher-Order Component (HOC) is an advanced React pattern used for reusing component logic. It is a function that takes a component as its argument and returns a new component with additional functionality.

- **Purpose**: HOCs are used to abstract and reuse logic in a single place, which can then be applied to multiple components. They allow for code reusability, manipulation of props, and handling state in a consistent manner.

- **How HOCs Work**: 
  - **Function Signature**: An HOC is a function that accepts a component (often called `WrappedComponent`) and returns a new component with enhanced behavior.
  - **Return Value**: The new component usually includes additional props or logic and renders the original component.

- **Example Usage**:
  - **Code Reusability**: Share common logic such as authentication checks, data fetching, or logging across different components.
  - **Props Manipulation**: Add, modify, or filter props before passing them to the wrapped component.
  - **State Management**: Manage state or lifecycle methods in a centralized manner and pass relevant state or handlers as props.

- **React API**: HOCs are not a formal part of the React API; rather, they are a pattern that emerges from React's compositional nature. They leverage the ability to compose components and add functionality in a reusable way.


### Summary

- **Definition**: HOCs are functions that take a component and return a new component with enhanced functionality.
- **Use Cases**: Code reusability, props manipulation, and state handling.
- **Pattern**: They are a pattern rather than a built-in part of React's API.

Your understanding is correct, and you’ve captured the key concepts of HOCs effectively.





-->---------------------------------------------------------------------------------



Q16: What is prop drilling and how can you avoid it?


- In Prop drilling there is a need to pass data through props from a component to hierarchy component that is
deeply nested.


-To pass data between such components, we pass props from a source component, and keep passing the prop to the next
component in the hierarchy till we reach the deeply nested component.




 -->---------------------------------------------------------------------------------

Q17. Differentiate between stateful and stateless components?


Functional Component or Stateless component

Functional component is like pure function in JavaScript.
Functional component is also called as a stateless component.
The functional component only receives props from parent component and return you JSX elements.
The functional component does n’t play with any lifecycle methods of React and doesn’t play with the component state...


Class component or state-full component

React class component is called as a state-full component.
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





---------------------------------------------------------------------------------
q19. What are React components?


-Components are the building blocks of any React app and a typical React app will have many of these.

-A React component can be either stateful or stateless.
-Stateful components are of the class type,
-while stateless components are of the function type.





---------------------------------------------------------------------------------
Q what is redux ?

- Redux is a predictable state container for JavaScript applications.
- Redux is a state management tool

-There is a central store that holds the entire state of the application.
-Each component can access the stored state without having to send down props from one component to another.

-There are three building parts: actions, store, and reducers.

1]Action
-Action is static information about the event that initiates a state change.
-Actions are payloads of information that send data from our application to our store

<!-- 
Action is static information about the event that initiates a state change.
When you update your state with Redux,
you always start with an action.
Actions are in the form of Javascript objects, containing a type and an optional payload.
Actions are sent using the store.dispatch() method.
Actions are created via an action creator. -->



2] Reducers
In Redux, a reducer is a pure function that takes an action and the previous state of the application and returns the
new state

The action describes what happened and it is the reducer's job to return the new state based on that action.

3]Store

- A Store is an object that holds the whole state tree of your application.
- There is only be a single store in a Redux app,
- Whenever a store is created in Redux, you need to specify the reducer.

getState() returns the current state of the store

dispatch() This dispatches an action. It is the only way to update the application state

subscribe() This method subscribes a change listener to the state

unsubscribe() It’s useful when you no longer want to call your listener method when the state changes

<!-- Whenever the store is updated, it will update the React components subscribed to it -->

npm i @reduxjs/toolkit
npm i react-redux

//slice

import { createSlice } from "@reduxjs/toolkit";

const createSliceName =createSlice({
name:"",
initaiState:[],
reducers:{
nameOfEvent :(state,action){
return {...state}
}
}
})


export default createSlice.reducer
export const selector =(state)=>state
export const {nameOfEveent} =createSliceName.actions

//store

import { configureStore } from "@reduxjs/toolkit";

const store =configureStore({
reducer:{
counter:nameOfSlice
}
})


//app.js
import {Provider} from "react-redux"
import store from "./store"

<Provider store={store}>
  <App />
</Provider>

store acccess karna or store ko actions dispatch
when need to pass the

================================================================================

Redux Overview:
- It  state management tool for JavaScript applications.
- Utilizes a central store to hold the entire application state.
- Components can access stored state without prop drilling.

Key Building Parts:
1. Actions:
   - Define events initiating state changes.
   - Represented as JavaScript objects with a type and optional payload.
   - Sent using store.dispatch() method.
   - Created via action creators, which are functions returning action objects.


// Example of an action creator
const incrementCounter = (amount) => {
  return {
    type: 'INCREMENT_COUNTER',
    payload: amount
  };
};

// Dispatching the action
store.dispatch(incrementCounter(5));

2. Reducers:
   - Pure functions taking current state and action to produce a new state.
   - Based on the reduce function in JavaScript.
   - Specify how application state changes in response to dispatched actions.


// Example of a reducer
const counterReducer = (state = 0, action) => {
  switch (action.type) {
    case 'INCREMENT_COUNTER':
      return state + action.payload;
    default:
      return state;
  }
};

3. Store:
   - Object holding the entire state tree of the application.
   - Responsible for storing, reading, and updating state.
   - Updates trigger re-renders in React components subscribed to it.


// Example of creating a Redux store
import { createStore } from 'redux';

const store = createStore(counterReducer);

Redux Workflow:
- Dispatch: Method triggering actions with type and payload to reducers.
- Subscribe: Method used to subscribe to state updates from the store (store.subscribe()).
- Provider: Component providing the store data to its wrapped components.
- Connect: Function facilitating communication with the provider.
- Middleware: Used to extend Redux with custom functionality, often for dispatching asynchronous functions.

Benefits of Redux (Additional Points):
- Predictable Data Flow:
  - Redux enforces a unidirectional data flow, making it easier to understand how data changes in the application over time.
- Developer Tools:
  - Redux comes with a set of developer tools like Redux DevTools, which allow developers to inspect the state and actions, track changes, and debug the application efficiently.

These additional points provide more insight into the benefits and usage of Redux in JavaScript applications, along with code examples to illustrate their implementation. Let me know if you need further explanation or assistance!


  ---------------------------------------------------------------------------------

  
  ### React State vs. Redux State

  #### React State:
  - Scope: Local to a component; each component manages its own state.
  - Usage: Best for state specific to a single component or a small part of the component tree.
  - Initialization: Use `useState` hook in functional components or `this.state` in class components.
  - Updating State: Use `setState` method or function; updates are asynchronous and can be batched.
  - Complexity: Ideal for simple, component-specific state; less boilerplate and easier setup.
  
  #### Redux State:
  - Scope: Global, managed by a centralized store; shared across the entire application.
  - Usage: Suitable for state that needs to be shared across multiple components or large parts of the app.
  - Initialization: Set up in a Redux store using reducers and initial state values; typically use `createStore`.
  - Updating State: State updated through actions and reducers; updates can be managed asynchronously with middleware like Redux Thunk or Redux Saga.
  - Complexity: Involves more setup and boilerplate; provides a structured, predictable way to manage complex state interactions.
  
  ### Key Differences:
  - React State:
    - Local to components.
    - Simple and less setup.
    - Ideal for small, localized state.
  
  - Redux State:
    - Global and centralized.
    - More setup and boilerplate.
    - Ideal for complex, shared state management.
  
  ### Choosing Between Them:
  - React State: Suitable for small to medium-sized applications with localized state needs.
  - Redux State: Best for large applications with complex state requirements and the need for sharing state across many components.
 
  ---------------------------------------------------------------------------------
-If a child component need the state of parent component then that state can be passed
using props.

-If parent component needs state of child component then it can be passed to parent
component using the concept called 'lifting state up'.




================================================================================

Redux vs Redux Toolkit

### Redux:

- Core library for state management.
- Involves writing significant boilerplate.
- Requires manual handling of immutability.
- Asynchronous logic typically requires middleware.

### Redux Toolkit:

- Provides utility functions to simplify Redux usage.
- Reduces boilerplate significantly.
- Offers built-in immutability helpers.
- Built-in support for handling asynchronous logic.

- Seamless integration with Redux DevTools Extension.





  