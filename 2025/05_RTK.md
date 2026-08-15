
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

======================================================================

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

