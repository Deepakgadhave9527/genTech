==========================================================
### How does useState change even when it's const?

`useState` does not try to reassign the existing `const` variable. 
When the state changes, React triggers a new render, 
and the component function runs again. During that new render, 
React provides the latest state value, 
so a new state variable binding is created for that render.
 The previous variable is never reassigned. 
 However, the actual state is not recreated from scratch on every 
 render; React preserves the state internally and provides 
 its latest value to each new render. For example, 
 if `count` is initially `0` and we call `setCount(1)`, 
 React does not change the existing `count` from `0` to `1`. 
 Instead, it re-renders the component and the new render 
 receives a new `count` binding with the value `1`.
 

**In short:**
**New render → new variable binding → latest preserved state value.**







==========================================================
### Why the UI Doesn't Reflect Changes Without useState

Without useState, changing a normal variable does not trigger a 
re-render because React does not track changes to regular variables.
 Since React is not notified about the change, the component 
 function does not run again, and React's reconciliation 
 process is not initiated for that change,
  so the UI does not automatically reflect the updated value. 
With useState, when the state updater function such as setCount() is called,
   React is notified that the state has changed and schedules a 
   re-render of the component. During the re-render, 
   the component function runs again and receives the latest 
   state value from React. React then performs reconciliation,
    where it compares the new React element tree with the previous 
    one to determine what has changed. Based on that comparison, 
    React updates only the necessary parts of the actual DOM, 
    which allows the UI to display the latest state value.


:


==========================================================Sure — 
### React Fiber
 React Fiber is the reconciliation engine introduced in **React 16**.

Before Fiber, React rendered updates synchronously. Once rendering started, it couldn't be paused until it finished, which could make the UI feel sluggish during expensive updates.

Fiber solves this by allowing React to:

* Break rendering work into smaller units.
* Pause and resume rendering.
* Prioritize more important updates (like user input).
* Keep the UI responsive.

### 1. Fiber Node

A Fiber is a JavaScript object that represents a unit of work for a React component.

Each Fiber contains information such as:

* Component type
* Props
* State
* Parent, child, and sibling references
* Effects or work that need to be performed during updates

### 2. Reconciliation

Reconciliation is React's process of determining what needs to change when the UI is updated.

Fiber provides the data structure and architecture that allow React to efficiently perform this reconciliation and determine the necessary DOM updates.

### 3. Scheduling

Fiber allows React to schedule and prioritize updates.

For example:

**High priority:**

* Typing in an input
* Button clicks
* User interactions

**Lower priority:**

* Loading or rendering a large list
* Background rendering
* Non-urgent updates

This helps prevent less important work from blocking user interactions.

### 4. Render Phase and Commit Phase

React Fiber mainly works through two phases: the **render phase** and the **commit phase**.

During the **render phase**, React creates or updates the work-in-progress Fiber tree, performs reconciliation, and determines what changes need to be made. This phase can be interrupted, restarted, or abandoned.

During the **commit phase**, React applies the calculated changes to the actual DOM and performs the required commit-related side effects. The commit phase is not interruptible because React needs to apply the final UI changes consistently.

### 5. Current and Work-in-Progress Fiber Trees

React maintains a **current Fiber tree** and a **work-in-progress Fiber tree**.

The current tree represents what is currently committed and displayed on the screen, while the work-in-progress tree represents the changes React is preparing.

Once the work is successfully committed, the work-in-progress tree becomes the new current tree.

### 6. Simple Explanation

In simple words, Fiber allows React to break rendering work into smaller pieces, prioritize important work, and perform rendering more efficiently.

Fiber is also the architectural foundation for modern React capabilities such as **concurrent rendering, transitions, and Suspense**.
