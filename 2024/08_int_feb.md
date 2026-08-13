==============================================================

### Why do we use `return () => { ... }` in `useEffect()`?

In React, the function returned from `useEffect()` is called the **cleanup function**.

When a dependency changes, React first runs the cleanup function from the previous effect and then runs the effect again with the updated dependency value.


When the component is **unmounted**, React runs the cleanup function one final time because the component is being removed from the UI and the effect is no longer needed. 


**unmounted**, it means **React removes that component from the UI**.


| `useEffect(() => { return cleanup }, [])`   |
| ------------------------------------------- |
| `useEffect` → **After initial render only** |
| `cleanup` → **On unmount only**             |



Cleanup functions are commonly used to:

* Remove event listeners
* Clear timers or intervals
* Cancel subscriptions
* Disconnect from external services
* Clean up other resources created by the effect

For example:
```js
import { useState, useEffect } from "react";

function App() {
  const [show, setShow] = useState(true);

  return (
    <div>
      <button onClick={() => setShow(false)}>
        Remove Child
      </button>

      {show && <Child />}
    </div>
  );
}

function Child() {
  useEffect(() => {
    console.log("Effect: Child mounted");

    return () => {
      console.log("Cleanup: Child unmounted");
    };
  }, []);

  return <h1>Hello</h1>;
}


``

- This prevents `memory leaks and unwanted side effects`.


Here, the effect adds a `resize` event listener, and the cleanup function removes it when the component unmounts.

When a component is **unmounted**, it means **React removes that component from the UI**. Since the component is being removed, the effect is no longer needed, so React runs the cleanup function one final time.

==========================================================


### How does useState change even when it's const?

useState can work with const because React does not reassign the existing state variable. When setCount() is called, React updates the state internally and triggers a re-render. During the new render, the component function runs again and React creates a new variable binding with the latest state value.


const prevents reassignment of the variable in that particular render,
but React creates a new variable binding when the component function runs again.

A new binding means a new variable is created.



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


==========================================

Single Page Applications (SPAs), which build pages in our browser using JavaScript,
MPAs depend on the server to generate and refresh pages

a] Multi-Page Application (MPA)

- If an application / website has multiple requestable web pages then that application
is called multi page application.
 
- An MPA consists of multiple pages, each with its own URL.

- When a user navigates to a new page,the browser reloads and fetches the new HTML content from the server.

- It recreates the DOM for each request

- Multipage application is slow because each request will be send to the server then server
will return a web page as response.

- It utilizes the server resources so high configuration server is required.

- It utilizes more bandwidth

- To fetch the different content you need to fetch different webpages from the server

B] Single page application


- If an application has single requestable web page then that application is called
single page application.

- In SPA all the content will get loaded in the web browser on first request, after that
all the request will be served from web browser itself.

- it does not utilizes the server resources for each request because the content will
be serverd from web browser.

- less bandwidth is required

- it is slow for first request and fast from second request

- It does not re create the DOM tree for content change




Single-Page Application
A single-page application is an app that works inside a browser and does not require page reloading during use.

An SPA loads a single HTML page and dynamically updates the content as the user interacts with the app, without refreshing the entire page.






========================================================
Server-Side Rendering (SSR) and Client-Side Rendering (CSR)
========================================================

In web development, there are two main methods for rendering web pages:

1. Server-Side Rendering (SSR)
2. Client-Side Rendering (CSR)

Both determine where the HTML page is generated—either on the server or in the browser.

========================================================
What is Server-Side Rendering (SSR)?
========================================================

- Server-Side Rendering (SSR) is the traditional way of rendering web pages.
- When a user requests a page, the browser sends a request to the server.
- The server processes the request and fetches the required data (if needed).
- The server generates the complete HTML page.
- The server sends the fully rendered HTML page to the browser.
- The browser displays the page immediately.
- JavaScript is then loaded to make the page interactive.
- Next.js is a popular framework that supports Server-Side Rendering (SSR).

Advantages:
- Faster initial page load.
- Better SEO because search engines receive fully rendered HTML.
- Better performance for the first page load.
- Content is visible even before JavaScript finishes loading.
- Suitable for content-heavy websites.

Disadvantages:
- Increases server workload because HTML is generated for every request.
- Higher server resources are required.
- More complex to implement than CSR.

========================================================
What is Client-Side Rendering (CSR)?
========================================================

- Client-Side Rendering (CSR) is a modern approach to rendering web pages.
- When a user requests a page, the server sends a minimal HTML file along with JavaScript, CSS, and other static assets.
- The browser downloads and executes the JavaScript.
- JavaScript generates the HTML and renders the user interface in the browser.
- Data is usually fetched from APIs, and the page updates dynamically without reloading the entire page.
- React applications commonly use Client-Side Rendering (CSR).

Advantages:
- Provides a rich and interactive user experience.
- Faster page navigation after the initial page load.
- Reduces server rendering workload.
- Ideal for highly interactive web applications.

Disadvantages:
- Slower initial page load because JavaScript must be downloaded and executed first.
- SEO is more challenging compared to SSR.
- Requires JavaScript to render the page.

========================================================
SSR vs CSR
========================================================

SSR (Server-Side Rendering)
- HTML is generated on the server.
- Faster initial page load.
- Better SEO.
- Higher server workload.
- Better for content-heavy websites.
- Next.js commonly uses SSR.

CSR (Client-Side Rendering)
- HTML is generated in the browser using JavaScript.
- Slower initial page load.
- Better user experience after the first load.
- Lower server workload.
- Better for highly interactive web applications.
- React applications commonly use CSR.

server side rendering (SSR) and client side rendering (CSR).


=======================================================

1. Authentication:
   - Authentication is the process of verifying the identity of a user.
   - Authentication is like to : "Who are you?"

### Users prove their identity by providing credentials such as:

- Username and Password
- OTP (One-Time Password)
- Biometric Authentication (Fingerprint, Face ID)
- Security Keys (FIDO/WebAuthn)
- Social Login (Google, GitHub, Facebook) using OAuth/OpenID Connect

- During login, the server verifies these credentials. 
 If they are valid, the user is successfully authenticated.

- After successful authentication, the server usually creates a session or issues a JWT/token 
  so the user doesn't need to log in on every request.

- In **Session-based Authentication**, the server creates a session and sends a Session ID 
 (typically stored in a cookie) to the client. 
 For every subsequent request, the browser automatically sends the Session ID, 
 and the server validates it to identify the authenticated user.

- In **Token-based Authentication (JWT)**, the server generates a JWT (JSON Web Token) 
and sends it to the client. The client stores the token and includes 
it in the Authorization header with every subsequent request. 
The server validates the token to confirm that the user has already been authenticated.

- Session IDs and JWTs do not verify the user's identity again. 
Instead, they allow the server to recognize that the 
user's identity has already been verified during login.

- The goal of authentication is to ensure the user is who they claim to be.




2. Authorization

- Authorization is the process of determining what an authenticated user is allowed to access or perform.
- Authorization is the like, "What are you allowed to do?"
- Authorization is performed only after successful authentication.
- Authorization decisions are based on roles, permissions, attributes, or policies.


Common Authorization Mechanisms:
- Role-Based Access Control (RBAC): Permissions are assigned based on user roles such as Admin, Manager, or Employee.
- Attribute-Based Access Control (ABAC): Access is determined using user attributes, resource properties, and environmental conditions.
- Policy-Based Access Control
- Permission-based authorization


================================================================================
Debounce vs Throttling

- Debouncing and throttling are two commonly used techniques in web development
  to optimize performance and reduce the load on web servers.

- These techniques are particularly useful when dealing with events 
   that can trigger multiple times in quick succession, such as user inputs or page scrolling.

- By implementing debouncing and throttling, we can limit the number of times 
  a function is called and prevent the server requests.

Debounce function is only executed after a specified delay period has passed 
since the last time the function was invoked.

while throttling limits the number of times the function can be called over a certain period.

- This results in a better user experience and improved website performance.

Debounicng real world example
When you search for something on Flipkart's website, 
the search results appear as you type. But if every keystroke triggers a request,
it could slow down the website. That's where debouncing comes in. 
It delays the request until you stop typing for a short period of time,
 ensuring that only the final keystroke triggers the request. 
 This prevents the server from being overloaded with requests and delivers search results quickly.

### Debounce

function is only executed after a specified delay period has passed 
since the last time the function was invoked.

debounce is useful for restricting the frequency of function execution, particularly for events that occur rapidly, such as typing or window resizing

#### Key Points:

- Delays execution of a function until after a specified wait time.
- Useful for scenarios like search input fields, window resizing, etc.
- Prevents a function from being called too frequently.

#### Example:

html

<!DOCTYPE html>
<html>
<head>
    <title>Debounce Example</title>
</head>
<body>
    <input type="text" id="search" placeholder="Type to search...">
    <script>
        function debounce(func, wait) {
            let timeout;
            return function(...args) {
                clearTimeout(timeout);
                timeout = setTimeout(() => {
                    func.apply(this, args);
                }, wait);
            };
        }

        function searchQuery() {
            console.log('Searching for:', document.getElementById('search').value);
        }

        const debouncedSearch = debounce(searchQuery, 300);

        document.getElementById('search').addEventListener('input', debouncedSearch);
    </script>

</body>
</html>

### Throttling

Throttling ensures that a function is only executed at most once in a specified time period. 
It limits the rate at which a function can be executed, 
regardless of how many times an event fires in that period.

#### Key Points:

- Limits the frequency of function execution to at most once per specified time period.
- Useful for scenarios like scroll events, mouse movement, etc.
- Ensures a function is not called more often than the specified time interval.

A real-world example of throttling is scrolling on a website. 
When you scroll down a page, the browser fires a scroll event for every pixel you move. 
If you have a lot of content on the page, 
this can cause performance issues as the browser tries to handle all the events.

To fix this, we can use throttling to limit the number of scroll events that the browser handles. For example, we might set a limit of one scroll event per 100 milliseconds. This means that the browser will handle only one scroll event during that time, no matter how many times the event is fired.

#### Example:

html

<!DOCTYPE html>
<html>
<head>
    <title>Throttling Example</title>
</head>
<body>
    <div id="content" style="height: 1500px; background: linear-gradient(white, black);">
        Scroll down to see the effect in the console log.
    </div>
    <script>
        function throttle(func, limit) {
            let lastFunc;
            let lastRan;
            return function(...args) {
                const context = this;
                if (!lastRan) {
                    func.apply(context, args);
                    lastRan = Date.now();
                } else {
                    clearTimeout(lastFunc);
                    lastFunc = setTimeout(function() {
                        if ((Date.now() - lastRan) >= limit) {
                            func.apply(context, args);
                            lastRan = Date.now();
                        }
                    }, limit - (Date.now() - lastRan));
                }
            };
        }

        function onScroll() {
            console.log('Scroll event triggered at:', new Date().toLocaleTimeString());
        }

        const throttledScroll = throttle(onScroll, 1000);

        window.addEventListener('scroll', throttledScroll);
    </script>

</body>
</html>

### Summary

- **Debounce** delays the execution of a function until after a specified wait time has passed since the last invocation.

- **Throttling** ensures that a function is called at most once in a specified time period.

Both techniques help in optimizing performance and improving user experience by controlling the rate of function execution in response to frequent events.





========================================================

`Code Optimization in React:`

Code optimization is the process of improving the performance of a React application by making the code more efficient and reducing unnecessary work.

It helps to:
- Reduce unnecessary re-renders.
- Improve application speed and responsiveness.
- Reduce memory usage.
- Improve overall user experience.

Common React optimization techniques:

- Use `React.memo` to prevent unnecessary re-renders of components.
- Use `useMemo` to memoize expensive calculations.
- Use `useCallback` to memoize functions and prevent unnecessary function recreations.
- Use `lazy loading` and `code splitting` to load only the required code.
- Avoid unnecessary state updates.
- Keep component state as local as possible.
- Use proper `keys` when rendering lists.
- Optimize large lists using techniques like virtualization.



----------------------------
 
Code optimization

Code optimization in React.js involves improving the efficiency, performance,
and overall quality of your codebase without changing its functionality.

It includes techniques such as minimizing unnecessary re-renders,
reducing bundle size, optimizing network requests, managing state efficiently,
enhancing code readability, and maintaining code maintainability.

1. React.StrictMode:

- Use React.StrictMode to detect potential issues in your codebase during development.
  -It helps identify unsafe lifecycles, deprecated APIs, and other potential problems.

2. Memoization:
   Memoization is a technique used to optimize expensive computations by caching the results.
   React provides a useMemo hook for memoizing values.

import React, { useMemo } from 'react';

const Component = ({ data }) => {
const processedData = useMemo(() => {
// Expensive computation
return data.map(item => item \* 2);
}, [data]);

    return (
      <div>
        {processedData.map((item, index) => (
          <div key={index}>{item}</div>
        ))}
      </div>
    );

};

3. Code Splitting:
   Splitting your code into smaller chunks allows lazy-loading components when needed,
   reducing the initial bundle size and speeding up the initial load time.

import React, { lazy, Suspense } from 'react';

const LazyComponent = lazy(() => import('./LazyComponent'));

const App = () => (
<Suspense fallback={<div>Loading...</div>}>
<LazyComponent />
</Suspense>
);

4. Avoid Inline Styles:

- Inline styles can clutter your components and make maintenance difficult.
  -Prefer using CSS classes or styled-components for better separation of concerns and easier styling management.

5. Debouncing and Throttling:

- Debouncing and throttling are code optimization techniques that help improve performance by
  controlling the rate at which functions are executed in response to frequent events.
- Debouncing function is excuated after specif delay perdia passes since las time function invokde
  while throttling limits the number of times the function can be called over a certain period.



========================================================================

In React.js development, the `window` object is often used for tasks related to application behavior and user interactions. Here are some `window` methods commonly used in React applications:

1. **`window.addEventListener()`**: Registers event listeners for various events (e.g., resize, scroll) to handle changes or interactions in the application.

2. **`window.removeEventListener()`**: Removes event listeners that were previously added, helping to clean up resources and avoid memory leaks.

3. **`window.scrollTo()`**: Used to programmatically scroll the window to a specific position, useful for smooth scrolling or navigation effects.

4. **`window.location.href`**: Gets or sets the URL of the current page, often used for programmatic navigation or redirecting.

5. **`window.localStorage`**: Provides access to local storage for storing and retrieving data on the client side.

6. **`window.sessionStorage`**: Provides access to session storage for storing data for the duration of the page session.

7. **`window.matchMedia()`**: Allows for querying and responding to media queries, useful for responsive design and handling different screen sizes.

8. **`window.requestAnimationFrame()`**: Schedules a function to be called before the next repaint, useful for implementing animations or optimizing performance.

9. **`window.history.pushState()`**: Updates the browser history stack without reloading the page, often used in single-page applications (SPAs) for managing navigation.

10. **`window.scrollY`**: Gets the number of pixels that the document is currently scrolled vertically, useful for tracking scroll position or implementing infinite scrolling.

These methods help manage application state, handle user interactions, and optimize performance in React.js applications.


========================== ES6 features ==================================

Below is the list of top ES6 features every JavaScript developer should know,


1. let and const:
2. Arrow Functions:
3. Template Literals:
4. Destructuring Assignment:
5. Default Parameters:
6. Rest and Spread Operators:
7. Classes:
8. Modules:
9. Promises:
10. Symbol:
11. Iterators and Generators:
12. Map and Set:
13. WeakMap and WeakSet:
14. Enhanced Object Literals:
15. Object.assign():
16. String Methods:
17. Number Methods:
18. Math Methods:
19. New Data Structures:
20. For…of Loop:


Default parameters
Spread and Rest syntaxes (…)
let and const
promise
Destructuring assignment
Arrow function expressions
Classes

Template literals (Template strings)
Tagged Templates
Object.assign() and Object.is()

1. let and const
   ```javascript
   let x = 10;
   const y = 20;
   x = 15; // Allowed
   // y = 25; // Error: Assignment to constant variable
   ```

2. Arrow Functions
   ```javascript
   const add = (a, b) => a + b;
   console.log(add(2, 3)); // 5
   ```

3. **Template Literals**
   ```javascript
   const name = 'World';
   const greeting = `Hello, ${name}!`;
   console.log(greeting); // Hello, World!
   ```

4. **Destructuring Assignment**
   ```javascript
   const [a, b] = [1, 2];
   const { name, age } = { name: 'Alice', age: 30 };
   console.log(a, b); // 1 2
   console.log(name, age); // Alice 30
   ```

5. **Default Parameters**
   ```javascript
   function greet(name = 'Guest') {
     return `Hello, ${name}!`;
   }
   console.log(greet()); // Hello, Guest!
   console.log(greet('John')); // Hello, John!
   ```

6. **Rest and Spread Operators**
   - **Rest Operator**:
     ```javascript
     function sum(...numbers) {
       return numbers.reduce((acc, num) => acc + num, 0);
     }
     console.log(sum(1, 2, 3, 4)); // 10
     ```
   - **Spread Operator**:
     ```javascript
     const arr = [1, 2, 3];
     const newArr = [0, ...arr, 4];
     console.log(newArr); // [0, 1, 2, 3, 4]
     ```

7. **Classes**
   ```javascript
   class Person {
     constructor(name) {
       this.name = name;
     }
     greet() {
       return `Hello, ${this.name}!`;
     }
   }
   const john = new Person('John');
   console.log(john.greet()); // Hello, John!
   ```

8. **Modules**
   - **Export**:
     ```javascript
     // module.js
     export const pi = 3.14;
     export function add(a, b) {
       return a + b;
     }
     ```
   - **Import**:
     ```javascript
     // main.js
     import { pi, add } from './module.js';
     console.log(pi); // 3.14
     console.log(add(2, 3)); // 5
     ```

9. **Promises**
   ```javascript
   const myPromise = new Promise((resolve, reject) => {
     setTimeout(() => resolve('Done!'), 1000);
   });

   myPromise.then(result => console.log(result)); // Done!
   ```

10. **Symbol**
    ```javascript
    const sym1 = Symbol('description');
    const sym2 = Symbol('description');
    console.log(sym1 === sym2); // false
    ```

11. **Iterators and Generators**
    ```javascript
    function* generator() {
      yield 1;
      yield 2;
      yield 3;
    }
    const gen = generator();
    console.log(gen.next().value); // 1
    console.log(gen.next().value); // 2
    ```

12. **Map and Set**
    - **Map**:
      ```javascript
      const map = new Map();
      map.set('key1', 'value1');
      console.log(map.get('key1')); // value1
      ```
    - **Set**:
      ```javascript
      const set = new Set([1, 2, 3]);
      set.add(4);
      console.log(set.has(2)); // true
      ```

13. **WeakMap and WeakSet**
    - **WeakMap**:
      ```javascript
      const weakMap = new WeakMap();
      const obj = {};
      weakMap.set(obj, 'value');
      console.log(weakMap.get(obj)); // value
      ```
    - **WeakSet**:
      ```javascript
      const weakSet = new WeakSet();
      const obj = {};
      weakSet.add(obj);
      console.log(weakSet.has(obj)); // true
      ```

14. **Enhanced Object Literals**
    ```javascript
    const name = 'Alice';
    const person = {
      name,
      greet() {
        return `Hello, ${this.name}!`;
      }
    };
    console.log(person.greet()); // Hello, Alice!
    ```

15. **Object.assign()**
    ```javascript
    const target = { a: 1 };
    const source = { b: 2 };
    Object.assign(target, source);
    console.log(target); // { a: 1, b: 2 }
    ```

16. **String Methods**
    ```javascript
    const str = 'Hello, World!';
    console.log(str.includes('World')); // true
    console.log(str.startsWith('Hello')); // true
    console.log(str.endsWith('!')); // true
    ```

17. **Number Methods**
    ```javascript
    console.log(Number.isNaN(NaN)); // true
    console.log(Number.isFinite(123)); // true
    ```

18. **Math Methods**
    ```javascript
    console.log(Math.pow(2, 3)); // 8
    console.log(Math.trunc(4.9)); // 4
    ```

19. **For…of Loop**
    ```javascript
    const iterable = [10, 20, 30];
    for (const value of iterable) {
      console.log(value); // 10, 20, 30
    }
    ```

20. **Tagged Templates**
    ```javascript
    function tag(strings, ...values) {
      return strings.reduce((acc, str, i) => acc + str + (values[i] || ''), '');
    }
    const name = 'World';
    const message = tag`Hello, ${name}!`;
    console.log(message); // Hello, World!
    ```

These examples demonstrate how each ES6 feature can be used in practice.




