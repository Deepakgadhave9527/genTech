


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

- `useContext` does not provide built-in features like actions,
     reducers, or middleware for state management.

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

`Provider` is a React-Redux component that connects the Redux store to the React application.

Works:
- Makes the Redux store available to all React components.
- Allows components to use `useSelector()` and `useDispatch()`.

Example:

<Provider store={store}>
  <App />
</Provider>

-------------------------------------------------------------------------

# createSlice()

Definition:

createSlice is a Redux Toolkit function used to create a slice of Redux state. It combines the initial state, reducer functions, and automatically generated action creators in one place. 

It also uses Immer internally, which allows us to write simpler mutable-looking state updates while keeping Redux state immutable.


`createSlice()` is a Redux Toolkit function that creates a slice of the Redux state and automatically generates reducers and action creators.

Works:
- Creates the initial state.
- Creates reducer functions.
- Automatically creates action types and action creators.
- Reduces Redux boilerplate code.

Example:

const counterSlice = createSlice({
  name: "counter",

  initialState: { count: 0 },

  reducers: {
    increment: (state) => {
      state.count++;
    },
  },
});

# createSlice() Explanation (Redux Toolkit)

Before Redux Toolkit, you had to write:

- Action types
- Action creators
- Reducers separately

`createSlice()` combines all of them into one place.

Example: Counter Slice


## Without createSlice (Old Redux Style)

const INCREMENT = "INCREMENT";

function increment() {
  return {
    type: INCREMENT
  };
}

function reducer(state, action) {
  switch(action.type) {
    case INCREMENT:
      return state + 1;

    default:
      return state;
  }
}


This required writing a lot of extra code.


## Using createSlice()

import { createSlice } from "@reduxjs/toolkit";

const counterSlice = createSlice({

  name: "counter",

  initialState: {
    value: 0
  },

  reducers: {

    increment: (state) => {
      state.value += 1;
    },

    decrement: (state) => {
      state.value -= 1;
    }

  }

});


export const { increment, decrement } = counterSlice.actions;

export default counterSlice.reducer;


# What does each part mean?


## 1. name: "counter"
Definition:
The name of your slice.
It is used to create unique action types automatically.

Examples:

- user slice
- cart slice
- product slice


---

## 2. initialState
initialState: {
  value: 0
}

Definition:
The starting data or initial value of this slice.

Examples:

initialState: {
  username: "",
  isLoggedIn: false
}


---

## 3. reducers
reducers: {

  increment: (state) => {
    state.value += 1;
  }

}

Definition:
Reducers define how the state changes when an action is dispatched.


Example:

Current state:

value = 0


increment action happens


New state:

value = 1


---

## 4. Actions are created automatically


From this:

reducers: {

  increment: (state) => {
    state.value += 1;
  }

}


Redux Toolkit automatically creates:


{
  type: "counter/increment"
}


You do not need to manually create:

- Action types
- Action creators



# Why use createSlice()?

- Less boilerplate code
- Automatically creates actions
- Automatically creates reducers
- Easier to maintain
- Recommended Redux approach

======================================================================


# Middleware

Definition:
Middleware is a function that runs between dispatching an action and the reducer receiving it.

Works:
- Intercepts actions before they reach the reducer.
- Used for logging, API calls, async operations, and error handling.

Flow:

Component
    |
    ↓
dispatch(action)
    |
    ↓
Middleware
    |
    ↓
Reducer
    |
    ↓
Store Update


Examples of Middleware:

Redux Thunk:
Handles asynchronous actions like API requests.

Logger Middleware:
Logs actions and state changes.
```

====================================================================
### Middleware
Redux middleware is a function that intercepts dispatched actions before they reach the reducers. 
It allows you to perform additional processing, such as handling asynchronous operations (e.g., API calls), logging, or other side effects.

By keeping business logic separate from UI components, middleware makes applications more scalable, maintainable, and easier to test.

Common Redux middleware includes Redux Thunk, Redux Saga, and Redux Logger.




Whenever you send an action using dispatch(), middleware receives that action first. It can perform extra work such as API calls, logging, authentication, or validation. After completing that work, it forwards the action to the reducer, which then updates the Redux state.


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


========================================================

In React applications, asynchronous operations like making API calls or handling side effects can be managed effectively using middleware.
Middleware allows developers to intercept certain actions, perform asynchronous tasks,
and then dispatch new actions with the results once the tasks are complete.

Middleware, in the context of web development,

- acts as a bridge between different components of an application, providing a layer of processing and functionality.
- It intercepts incoming requests, performs specific actions, and then passes the modified request to the next middleware or the final destination

=========================================================
# Redux floder structure

src
│
├── app
│   └── store.js
│
├── features
│   └── counter
│       └── counterSlice.js
│
├── components
│   └── Counter.jsx
│
├── App.js
└── main.js
```
```
# Redux Toolkit Flow

1. User performs an action (click button)

↓

2. Component calls dispatch(action)

↓

3. Action creator creates action object

↓

4. Reducer receives (state, action)

↓

5. Reducer updates state and returns new state

↓

6. Store updates

↓

7. useSelector gets updated state

↓

8. UI re-renders automatically


# Slice

import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  count: 0,
};

const counterSlice = createSlice({
  name: "counter",

  initialState,

  reducers: {

    increment: (state) => {
      state.count++;
    },

    decrement: (state) => {
      state.count--;
    },

    incrementByAmount: (state, action) => {
      state.count += action.payload;
    },

  },
});


export const {
  increment,
  decrement,
  incrementByAmount,
} = counterSlice.actions;


export default counterSlice.reducer;


# Store

import { configureStore } from "@reduxjs/toolkit";
import counterReducer from "./counterSlice";


const store = configureStore({

  reducer: {
    counter: counterReducer,
  },

});


export default store;


# Provider

import { Provider } from "react-redux";
import store from "./store";
import App from "./App";


function Root() {

  return (

    <Provider store={store}>
      <App />
    </Provider>

  );

}


export default Root;


# useSelector

import { useSelector } from "react-redux";


const count = useSelector(
  (state) => state.counter.count
);


# useDispatch

import { useDispatch } from "react-redux";
import { increment } from "./counterSlice";


const dispatch = useDispatch();


dispatch(increment());


# Counter Component

import { useSelector, useDispatch } from "react-redux";
import { increment, decrement } from "./counterSlice";


function Counter() {

  const count = useSelector(
    (state) => state.counter.count
  );


  const dispatch = useDispatch();


  return (

    <div>

      <h1>{count}</h1>


      <button onClick={() => dispatch(increment())}>
        Increment
      </button>


      <button onClick={() => dispatch(decrement())}>
        Decrement
      </button>


    </div>

  );

}


export default Counter;



```
```
======================================================================

# Difference Between Props and Redux

Props are used in React to pass data from a parent component to a child component. They follow a one-way data flow Parent → Child 
and are useful for communication between closely related components. However, when the application becomes large and many components need the same data, passing props can lead to prop drilling. 

Redux solves this problem by storing shared application data in a centralized store. Components can directly access and update this data using hooks like useSelector and useDispatch. 

So, props are mainly used for component-to-component communication, while Redux is used for managing global application state."


### Props

1. Props are used to pass data from a parent component to a child component.

2. Props are part of React itself.

3. Data flow is one direction only:

Parent → Child

4. Props are mainly used for communication between components.

5. Props cannot be directly modified by the child component.

6. Props are suitable when data is needed by only a few components.

7. Too much passing of props through many components can create prop drilling.

## Redux

1. Redux is a state management library used to manage global application state.

2. Redux stores data in a central store.

3. Any component can access the store without passing data through props.

4. Redux follows a predictable data flow using:

- Action
- Reducer
- Store

5. Redux is useful when multiple components need the same data.

6. Redux helps avoid prop drilling.

---

# Redux Interview Definition

Redux is a predictable state management library for JavaScript applications. It stores the entire application state in a single store. Components dispatch actions to describe what happened, reducers update the state based on those actions, and the updated state is automatically reflected in the UI. Redux Toolkit is the recommended way to write Redux because it simplifies Redux development and reduces boilerplate code.





  

  




=================================================================
React State vs Redux State


### React State (useState)

1. React State is used to manage local component data.

2. React State belongs to a specific component.

3. Only that component and its child components can access the state.

4. React State is managed using React hooks like:
- useState()
- useReducer()

5. React State is simple and suitable for small or component-specific changes.

6. When state changes, only the related component and its child components re-render.

7. React State is not shared globally between unrelated components.


Example:

import { useState } from "react";


function Counter() {

  const [count, setCount] = useState(0);


  return (

    <div>

      <h1>{count}</h1>


      <button onClick={() => setCount(count + 1)}>
        Increment
      </button>

    </div>

  );

}




### Redux State

1. Redux State is used to manage global application data.

2. Redux State is stored in a central Redux Store.

3. Multiple components can access the same state from the Redux Store.

4. Components read Redux state using:

useSelector()


5. Components update Redux state by dispatching actions using:

dispatch()


6. Redux state updates happen through:

- Action
- Reducer
- Store


7. Redux is suitable for large applications where many components need shared data.

8. Multiple components can automatically update when the Redux state changes.

9. Redux helps avoid prop drilling by providing a centralized store.


Example:

const count = useSelector(
   state => state.counter.count
);





  
  ### React State vs. Redux State

  #### React State:
  - Scope: Local to a component; each component manages its own state.
  - Usage: Best for state specific to a single component or a small part of the component tree.
  - Initialization: Use useState hook in functional components or this.state in class components.
  - Updating State: Use setState method or function; updates are asynchronous and can be batched.
  - Complexity: Ideal for simple, component-specific state; less boilerplate and easier setup.
  
  #### Redux State:
  - Scope: Global, managed by a centralized store; shared across the entire application.
  - Usage: Suitable for state that needs to be shared across multiple components or large parts of the app.
  - Initialization: Set up in a Redux store using reducers and initial state values; typically use createStore.
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
 
  




===================================================================


## Redux (Traditional Redux)

1. Redux is a predictable state management library used to manage and share application state across different components.

2. Requires more boilerplate code because you have to create actions, action types, reducers, and the store separately.

3. Actions, reducers, and the store are written in separate files, which increases the amount of code.

4. Uses `createStore()` to create the Redux store. (In modern Redux, `configureStore()` from Redux Toolkit is recommended.)

5. Asynchronous operations require middleware such as Redux Thunk or Redux Saga because Redux can only handle synchronous actions by default.

6. Middleware must be installed and configured manually using `applyMiddleware()`.

7. State updates are handled by reducers, which receive the current state and an action, then return a new updated state.

8. More setup and configuration are required, making Redux harder for beginners and larger applications.

---

## Redux Toolkit (RTK)

1. Redux Toolkit (RTK) is the official and recommended way to write Redux applications.

2. Reduces boilerplate code by providing built-in functions that simplify Redux development.

3. Uses `createSlice()` to create the initial state, reducers, action creators, and action types in a single place.

4. Uses `configureStore()` to create the Redux store with recommended default settings.

5. Redux Thunk is included by default, so you can perform asynchronous operations (such as API calls) without installing additional middleware.

6. Supports `createAsyncThunk()`, which simplifies writing asynchronous logic like fetching data from an API.

7. Automatically configures useful middleware and development tools, reducing manual configuration.

8. Makes Redux code easier to read, write, maintain, and scale, so it is the preferred choice for modern React applications.

---

# Key Differences

| Redux | Redux Toolkit |
|--------|---------------|
| More boilerplate code | Less boilerplate code |
| Uses `createStore()` | Uses `configureStore()` |
| Actions and reducers are written separately | `createSlice()` creates actions and reducers together |
| Middleware like Redux Thunk must be installed manually | Redux Thunk is included by default |
| Async operations require manual setup | `createAsyncThunk()` simplifies async operations |
| More configuration required | Minimal configuration required |
| Better for learning Redux fundamentals | Recommended for modern React applications |
```

### Interview Answer (2 lines)

> Redux is a state management library that requires manual setup for actions, reducers, store, and middleware. Redux Toolkit is the official Redux package that simplifies Redux development by reducing boilerplate and providing built-in features like `configureStore()`, `createSlice()`, and Redux Thunk.

===================================================================




Redux vs Redux Toolkit
### Redux:


### Redux Toolkit:




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


========

# Redux vs Redux Toolkit

### 1. Redux

* Redux is a state management library for JavaScript applications.
* It helps manage global application state.
* In traditional Redux, we have to write action types, action creators, reducers, and store configuration manually.
* It requires more boilerplate code.
* Suitable for understanding Redux concepts, but can become verbose in large applications.

In traditional Redux, Redux cannot handle asynchronous operations by itself. You must install middleware such as Redux Thunk or Redux Saga.


Example (Traditional Redux):

```javascript
// Action Type
const INCREMENT = "INCREMENT";

// Action Creator
const increment = () => ({
  type: INCREMENT,
});

// Reducer
const counterReducer = (state = { count: 0 }, action) => {
  switch (action.type) {
    case INCREMENT:
      return {
        ...state,
        count: state.count + 1,
      };

    default:
      return state;
  }
};
```

---

### 2. Redux Toolkit (RTK)

* Redux Toolkit is the official, recommended way to write Redux.
* It is built on top of Redux.
* It reduces boilerplate code.
* It automatically creates action creators and action types.
* It provides `configureStore()`, `createSlice()`, and `createAsyncThunk()`.
* It uses Immer internally, so we can write mutation-like code safely.

Example:

```javascript
import { createSlice } from "@reduxjs/toolkit";

const counterSlice = createSlice({
  name: "counter",

  initialState: {
    count: 0,
  },

  reducers: {
    increment: (state) => {
      state.count++;
    },
  },
});

export const { increment } = counterSlice.actions;

export default counterSlice.reducer;
```

---

## 3. Store Creation

### Redux

```javascript
import { createStore } from "redux";

const store = createStore(counterReducer);
```

---

### Redux Toolkit

```javascript
import { configureStore } from "@reduxjs/toolkit";

const store = configureStore({
  reducer: {
    counter: counterReducer,
  },
});
```

---

## 4. Actions

### Redux

You create actions manually.

```javascript
const increment = () => ({
  type: "INCREMENT",
});
```

---

### Redux Toolkit

`createSlice()` automatically creates actions.

```javascript
dispatch(increment());
```

Internally it creates:

```javascript
{
  type: "counter/increment",
}
```

---

## 5. Reducers

### Redux

Uses `switch` statements.

```javascript
switch (action.type) {
  case "INCREMENT":
    return {
      ...state,
      count: state.count + 1,
    };

  default:
    return state;
}
```

---

### Redux Toolkit

Reducers are written directly inside `createSlice()`.

```javascript
increment: (state) => {
  state.count++;
}
```

---

## 6. State Updates

### Redux

Must update state immutably.

```javascript
return {
  ...state,
  count: state.count + 1,
};
```

---

### Redux Toolkit

Mutation-like syntax is allowed because of Immer.

```javascript
state.count++;
```

---

## 7. Boilerplate

### Redux

You create:

* Action Types
* Action Creators
* Reducers
* Store

Separately.

---

### Redux Toolkit

Everything is managed in one slice.

```text
createSlice()

↓

State

Reducers

Actions
```

---

## 8. Which One Should You Use?

* Use Redux Toolkit for new React projects.
* Traditional Redux is mainly useful for understanding the core concepts or maintaining older codebases.

---

# Interview Answer (1 Minute)

> "Redux is a state management library used to manage global application state. Traditional Redux requires writing action types, action creators, reducers, and store configuration separately, which results in a lot of boilerplate code. Redux Toolkit is the official and recommended way to use Redux. It simplifies Redux by providing APIs like `createSlice()` and `configureStore()`, automatically generates action creators and action types, and uses Immer internally for immutable state updates. In modern React applications, Redux Toolkit is preferred because it is simpler, cleaner, and requires less code."

---

## Quick Revision

```text
Redux
↓
- State management library
- More boilerplate
- Manual actions
- Manual reducers
- createStore()
- switch-case
- Immutable updates manually

Redux Toolkit
↓
- Official Redux package
- Less boilerplate
- createSlice()
- configureStore()
- Auto-generated actions
- Uses Immer
- Recommended for modern React apps
```


==========

# Redux Interview Questions and Answers

## 1. What is Redux?
Redux is a state management library used to manage and share application state in a single, centralized store. It makes state updates predictable using actions and reducers.

## 2. Why do we use Redux?
Redux is used to:
- Manage shared application state
- Avoid prop drilling
- Make state updates predictable
- Simplify debugging and testing

## 3. What is a Store?
A Store is the central object in Redux that holds the entire application's state.

## 4. What is an Action?
An Action is a plain JavaScript object that describes what happened. It contains a `type` property and can also include a `payload`.

Example:
{
  type: "ADD_TODO",
  payload: "Learn Redux"
}

## 5. What is a Reducer?
A Reducer is a pure function that takes the current state and an action, then returns a new state without modifying the existing one.

## 6. What is Dispatch?
`dispatch()` is a function used to send actions to the Redux store, triggering state updates.

Example:
dispatch(addTodo("Learn Redux"));

## 7. What is useSelector?
`useSelector` is a React-Redux hook used to read data from the Redux store.

Example:
const todos = useSelector(state => state.todos);

## 8. What is useDispatch?
`useDispatch` is a React-Redux hook that provides access to the `dispatch()` function.

Example:
const dispatch = useDispatch();

## 9. What is Redux Toolkit (RTK)?
Redux Toolkit is the official and recommended way to write Redux code. It reduces boilerplate and provides utilities such as:
- configureStore()
- createSlice()
- createAsyncThunk()

## 10. What is createSlice()?
`createSlice()` automatically creates:
- Initial state
- Reducers
- Action creators

This keeps Redux code shorter and easier to maintain.

## 11. What is configureStore()?
`configureStore()` creates the Redux store with sensible defaults, including:
- Redux DevTools support
- Middleware configuration
- Easier setup

## 12. Explain the Redux Data Flow.
User Action
    ↓
dispatch()
    ↓
Action
    ↓
Reducer
    ↓
Store Updates
    ↓
UI Re-renders

## 13. What is Prop Drilling?
Prop drilling is passing data through multiple intermediate components just to reach a deeply nested component. Redux avoids this by allowing components to access shared state directly from the store.

## 14. What is a Payload?
A Payload is the data carried inside an action.

Example:
{
  type: "UPDATE_NAME",
  payload: "John"
}

## 15. Can Redux replace useState?
No. `useState` is best for local component state, while Redux is designed for state that needs to be shared across multiple components.

## 16. What is the difference between Redux and Context API?

Redux:
- Designed for complex global state
- Uses actions and reducers
- Better for large applications
- Excellent debugging with DevTools

Context API:
- Designed for sharing simple global data
- Directly provides values
- Better for small applications
- Limited debugging

## 17. What is a Pure Function?
A pure function:
- Returns the same output for the same input.
- Has no side effects.
- Does not modify the original state.

Reducers must always be pure functions.

## 18. Why should state be immutable in Redux?
Immutability:
- Makes changes predictable.
- Enables efficient UI updates.
- Supports features like time-travel debugging.

## 19. What is createAsyncThunk()?
`createAsyncThunk()` simplifies handling asynchronous operations such as API requests by automatically generating:
- pending
- fulfilled
- rejected

action types.

## 20. What middleware is commonly used in Redux?
Middleware intercepts actions before they reach reducers.

Common middleware:
- redux-thunk (included by default with Redux Toolkit)
- redux-logger

# Quick Revision (One-Liners)

- Redux → State management library.
- Store → Holds application state.
- Action → Describes what happened.
- Reducer → Returns the new state.
- Dispatch → Sends actions to the store.
- Payload → Data inside an action.
- useSelector → Reads state.
- useDispatch → Dispatches actions.
- Redux Toolkit → Simplifies Redux development.
- createSlice → Creates reducers and actions.
- configureStore → Creates the Redux store.
- createAsyncThunk → Handles asynchronous actions.
- Prop Drilling → Passing props through many components unnecessarily.
- Immutable State → Never modify state directly; always return a new state.
- Redux Flow → UI → Dispatch → Action → Reducer → Store → UI.

