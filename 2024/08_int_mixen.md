==============================================================

### Why do we use `return () => { ... }` in `useEffect()`?

In React, the function returned from `useEffect()` is called the `cleanup function`.

When a dependency in the dependency array changes during the update phase, React `first runs the cleanup function` from the previous effect, and then the `main function inside useEffect runs again`.


When the component is `unmounted`, React runs the cleanup function one final time because the component is being removed from the UI and the effect is no longer needed. 


`unmounted`, it means `React removes that component from the UI`.


| `useEffect(() => { return cleanup }, [])`   |
| ------------------------------------------- |
| `useEffect` → `After initial render only` |
| `cleanup` → `On unmount only`             |



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

When a component is `unmounted`, it means `React removes that component from the UI`. Since the component is being removed, the effect is no longer needed, so React runs the cleanup function one final time.

==========================================================


### How does useState change even when it's const?

- useState can work with const because React does not reassign the existing state variable. 

- When setState() is called, React updates the state internally and triggers a re-render. 

- During the new render, the component function runs again and React creates a new variable binding with the latest state value. 


const prevents reassignment of the variable in that particular render,
but React creates a new variable binding when the component functions runs again.

------------------------------------------------------

A new binding means a new variable is created.

The component function means the whole function that defines the component, not just the useState line.
whenever any update happens, the whole app re-renders.”


==========================================================
 ### Why the UI Doesn't Reflect Changes Without useState

“React’s reconciliation doesn’t detect or respond to normal variable updates because React doesn’t track them. With useState, React provides a setter like setCount(). When we call the setter, it notifies React about the state update and schedules a re-render. Then React performs reconciliation and updates the necessary parts of the UI.”



==========================================================
`### React Fiber`

React Fiber is React``s internal reconciliation engine that manages how React updates the UI.

React Fiber introduced in `React 16 v`.

Before Fiber, React rendered updates synchronously. Once rendering started, it couldnt be paused until it finished, which could make the UI feel sluggish during expensive updates.

Fiber breaks rendering work into smaller units, Pause and resume rendering, and  allowing React to Prioritize more important updates (like user input)  and schedule updates efficiently instead of doing all the work at once.

When state or props change, Fiber helps React determine what needs to be updated and then commits those changes to the DOM.”



==========================================

Single Page Applications (SPAs), which build pages in our browser using JavaScript,
MPAs depend on the server to generate and refresh pages

a] Multi-Page Application (MPA)

- If an application / website has multiple requestable web pages then that application
is called multi page application.
 
- An MPA consists of multiple pages, each with its own URL.

- When a user navigates to a new page,the browser reloads and fetches the new HTML content from the server.

- The browser creates a new DOM for the newly loaded page

- Multipage application is slow because each request will be send to the server then server
will return a web page as response.

- It utilizes the server resources so high configuration server is required.

- It utilizes more bandwidth

- To fetch the different content you need to fetch different webpages from the server

B] Single page application

- A `Single Page Application (SPA)` is a web application that initially loads a `single HTML page` in the browser.

- After the initial page load, the application `dynamically updates the content` without completely reloading the entire web page.

- In an SPA, `navigation and UI changes are generally handled by JavaScript in the browser`.

- The browser can still `send requests to the server/API` to fetch, update, or save

- The `initial page load can be slower` because the browser needs to download JavaScript, CSS, images, and other resources.

- After the initial load, `subsequent navigation can be faster` because the application is already loaded in the browser.

- An SPA generally `does not reload the entire page or recreate the entire DOM tree` for every content change. Instead, only the required parts of the UI are updated.

- SPAs commonly use frameworks and libraries such as `React, Angular, and Vue`.


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

- In `Session-based Authentication`, the server creates a session and sends a Session ID 
 (typically stored in a cookie) to the client. 
 For every subsequent request, the browser automatically sends the Session ID, 
 and the server validates it to identify the authenticated user.

- In `Token-based Authentication (JWT)`, the server generates a JWT (JSON Web Token) 
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

  -reduce unnecessary function calls 

- These techniques are particularly useful when dealing with events 
   that can trigger multiple times in quick succession, such as user inputs or page scrolling resizing, mouse movement, and button clicks.

- By implementing debouncing and throttling, we can limit the number of times 
  a function is called and prevent the server requests.



Debounce function is only executed after a specified delay period has passed 
since the last time the function was invoked.

If the event occurs again before the delay expires, the timer is reset.

Example: Search input — send a search request only after the user stops typing for a specified amount of time.

while throttling limits the number of times the function can be called over a certain period.

- Both techniques can result in a better user experience, improved performance, and reduced unnecessary server requests.

================================================================================

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

- `Debounce` delays the execution of a function until after a specified wait time has passed since the last invocation.

- `Throttling` ensures that a function is called at most once in a specified time period.

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

-Use debouncing and throttling for high-frequency events.
- Use `React.memo` to prevent unnecessary re-renders of components.
- Use `useMemo` to memoize expensive calculations.
- Use `useCallback` to memoize functions and prevent unnecessary function recreations.
- Use `lazy loading` and `code splitting` to load only the required code.
- Avoid unnecessary state updates.
- Keep component state as local as possible.
- Use proper `keys` when rendering lists.
- Optimize large lists using techniques like virtualization.

