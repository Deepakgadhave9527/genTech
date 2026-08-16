
==========

# React Reconciliation

React uses the reconciliation algorithm to update the UI.


React does not directly update the Real DOM every time a change happens. Instead, it:

1. Creates a new Virtual DOM when the component re-renders.
2. Compares it with the previous Virtual DOM.
3. Finds the differences (changes).
4. Updates only the required parts of the Real DOM.

This comparison process between the previous Virtual DOM and the new Virtual DOM is called `Reconciliation`.

Reconciliation helps React improve performance by avoiding unnecessary DOM updates.


 React uses a diffing algorithm to identify the differences between the two Virtual DOM trees and updates only the changed parts of the real DOM.

 
# React Reconciliation

React uses the reconciliation algorithm to update the UI.


React does not directly update the Real DOM every time a change happens. Instead, it:

1. Creates a new Virtual DOM when the component re-renders.
2. Compares it with the previous Virtual DOM.
3. Finds the differences (changes).
4. Updates only the required parts of the Real DOM.

This comparison process between the previous Virtual DOM and the new Virtual DOM is called `Reconciliation`.

Reconciliation helps React improve performance by avoiding unnecessary DOM updates.

React uses a Diffing Algorithm during reconciliation to identify the differences between the two Virtual DOM trees and update only the required parts of the Real DOM.

==========
==========
==========
==========
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

