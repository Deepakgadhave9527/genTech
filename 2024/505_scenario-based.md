400 Bad Request
401 Unauthorized
403 Forbidden
404 Not Found
500 Server Error




Here are **20 very common React + JavaScript + API + Authentication interview questions** with answers that are concise, practical, and suitable for interviews.

---

# 1. Tell me about yourself.

### Best Answer

> I am a Frontend Developer with experience building React.js applications. I have worked with JavaScript, React, Redux Toolkit, REST APIs, authentication using JWT, responsive UI development, and state management. I enjoy writing clean, reusable components, optimizing performance, and collaborating with backend teams to deliver scalable applications.

---

# 2. Why React?

### Best Answer

> React allows us to build reusable components, efficiently update the UI using the Virtual DOM, and manage complex applications with hooks and state management. It also has a strong ecosystem and community support.

---

# 3. Explain the React lifecycle.

### Best Answer

For functional components:

* Mount → `useEffect(() => {}, [])`
* Update → `useEffect(() => {}, [dependency])`
* Unmount → Cleanup function

```javascript
useEffect(() => {
   return () => {
      console.log("Cleanup");
   };
}, []);
```

---

# 4. Difference between State and Props?

### Best Answer

| State                    | Props                                |
| ------------------------ | ------------------------------------ |
| Managed inside component | Passed from parent                   |
| Mutable                  | Read-only                            |
| Triggers re-render       | Also triggers re-render when changed |

---

# 5. What is the Virtual DOM?

### Best Answer

> The Virtual DOM is a lightweight copy of the real DOM. React compares the previous and current Virtual DOM using a diffing algorithm and updates only the changed elements in the real DOM, improving performance.

---

# 6. What is the difference between useEffect and useLayoutEffect?

### Best Answer

`useEffect`

* Runs after the browser paints.
* Used for API calls and side effects.

`useLayoutEffect`

* Runs before the browser paints.
* Used when measuring or synchronously updating the DOM to avoid visual flicker.

---

# 7. Explain useMemo.

### Best Answer

> `useMemo` memoizes the result of an expensive calculation so it only recomputes when its dependencies change.

---

# 8. Explain useCallback.

### Best Answer

> `useCallback` memoizes a function reference to avoid unnecessary re-renders of child components that receive the function as a prop.

---

# 9. React app is slow. What will you do?

### Best Answer

* Use React.memo
* Use useMemo
* Use useCallback
* Lazy loading
* Code splitting
* Virtual scrolling
* Optimize images
* Avoid unnecessary API calls

---

# 10. What is JWT?

### Best Answer

> JWT (JSON Web Token) is a compact, signed token used for authentication and authorization. After a user logs in, the server issues a token. The client includes it in subsequent requests so the server can verify the user's identity without storing session state.

---

# 11. JWT vs Session?

### Best Answer

> For modern React applications with separate frontend and backend, I usually choose JWT with HttpOnly cookies. For traditional server-rendered applications where immediate server-side session invalidation is important, I choose sessions.

---

# 12. How do you implement Login?

### Best Answer

1. User enters credentials.
2. Frontend sends a POST request.
3. Backend validates credentials.
4. Backend returns an access token (and optionally a refresh token).
5. Frontend stores tokens securely.
6. Include the access token in future API requests.

---

# 13. Where do you store JWT?

### Best Answer

> I prefer storing the refresh token in an HttpOnly, Secure cookie. For the access token, I avoid `localStorage` in security-sensitive applications because of XSS risks.

---

# 14. What happens when the token expires?

### Best Answer

* API returns **401 Unauthorized**.
* Use the refresh token to obtain a new access token.
* Retry the failed request.
* If refresh fails, log the user out.

---

# 15. What is CORS?

### Best Answer

> CORS (Cross-Origin Resource Sharing) is a browser security feature that controls whether a web page can make requests to a different origin. The server enables it by sending the appropriate CORS headers.

---

# 16. Explain Debouncing.

### Best Answer

> Debouncing delays a function call until the user stops triggering an event for a specified time. It's commonly used in search inputs to reduce unnecessary API requests.

---

# 17. Difference between Promise.all and Promise.allSettled?

### Best Answer

`Promise.all`

* Fails immediately if any promise rejects.

`Promise.allSettled`

* Waits for all promises to complete and reports each result, whether fulfilled or rejected.

---

# 18. Explain Closures.

### Best Answer

> A closure is created when an inner function remembers and can access variables from its outer function even after the outer function has finished executing.

---

# 19. Explain the Event Loop.

### Best Answer

> JavaScript is single-threaded. Synchronous code executes first, then microtasks (such as Promise callbacks), and finally macrotasks (such as `setTimeout` callbacks). The event loop coordinates this execution order.

---

# 20. Why should we hire you?

### Best Answer

> I have strong knowledge of React.js, JavaScript, REST APIs, authentication, and modern frontend development practices. I write clean, maintainable code, enjoy solving real-world problems, and adapt quickly to new technologies. I'm also a collaborative team member who focuses on delivering reliable, user-friendly applications.

---

## Bonus: Frequently Asked Scenario-Based Questions

**Q:** How do you protect private routes?

> Check whether the user is authenticated before rendering the route. If not, redirect to the login page.

**Q:** User clicks the Submit button multiple times.

> Disable the button while the request is in progress or use debouncing/throttling to prevent duplicate submissions.

**Q:** An API is taking too long to respond.

> Show a loading indicator or skeleton UI, set a timeout if appropriate, and allow the user to retry.

**Q:** One API succeeds and another fails.

> Use `Promise.allSettled()` so successful results can still be displayed while handling failures gracefully.

**Q:** The user refreshes the browser.

> Restore authentication using a refresh token or a valid server-side session instead of requiring the user to log in again.

These questions and answers cover many of the topics commonly asked in React frontend interviews, especially for developers with around **2–5 years of experience**.


==========



This is a very common interview question. The best answer is **"It depends on the application requirements."** Then explain the trade-offs.

## Interview Answer

> I don't choose JWT or Session by default. I choose based on the application's architecture. For a modern React application with a separate frontend and backend, I usually prefer **JWT with HttpOnly cookies**. For traditional server-rendered applications, I often prefer **session-based authentication** because it's simpler to manage and revoke.

## JWT vs Session

| Feature     | JWT                                                               | Session                                        |
| ----------- | ----------------------------------------------------------------- | ---------------------------------------------- |
| Storage     | Client stores token (preferably in HttpOnly cookie)               | Server stores session                          |
| Scalability | Better for distributed systems and microservices                  | Harder to scale without shared session storage |
| Logout      | More complex (token remains valid until expiry unless managed)    | Easy (destroy session on server)               |
| Performance | No database lookup required to validate token (if self-contained) | Usually requires session lookup                |
| Mobile APIs | Excellent                                                         | Less common                                    |
| Security    | Good when stored in HttpOnly cookies                              | Good because session data stays on server      |

## When would I choose JWT?

* React + Node.js
* Separate frontend and backend
* Mobile apps
* Microservices
* REST APIs

Example:

```
React → API → JWT → Access Token → Protected APIs
```

## When would I choose Sessions?

* Traditional web applications
* Server-rendered apps
* Banking/internal enterprise applications where immediate session invalidation is important
* Applications with a single backend server or centralized session store

## Interview Follow-up: Which is more secure?

A good answer is:

> Neither is inherently more secure. Security depends on the implementation. A JWT stored in `localStorage` is more vulnerable to XSS than a session using secure, HttpOnly cookies. Likewise, sessions need protection against CSRF. Proper cookie settings, HTTPS, token/session expiration, and secure coding practices are what matter most.

## If the interviewer asks: "What would you use in our React project?"

You can say:

> For a React application, I would use **JWT authentication with a short-lived access token and a refresh token stored in an HttpOnly, Secure cookie**. The frontend sends the access token with API requests, and if it expires, the application uses the refresh token to obtain a new access token automatically. This approach works well for modern SPAs while reducing XSS risk compared with storing tokens in `localStorage`.

This answer demonstrates that you understand both approaches and can choose the one that best fits the application's needs rather than treating one as universally better.
=============

If you're interviewing for a **Frontend Developer (React.js + JavaScript)** role, especially with **3–6 years of experience**, many interviewers focus on **scenario-based questions** rather than just theory. Authentication is one of the most common topics.

Here are some realistic interview questions with what the interviewer is looking for.

---

# 1. Where do you store the JWT token? LocalStorage or Cookies?

### Scenario

> Your backend returns a JWT after login. Where would you store it and why?

### Good Answer

* **Access Token**

  * Store in **memory** or **HttpOnly Secure Cookie**
  * Avoid LocalStorage if security is important.

* **Refresh Token**

  * Store in **HttpOnly Secure Cookie**
  * Cannot be accessed via JavaScript.
  * Protects against XSS.

### Explain

LocalStorage is vulnerable to XSS.

Cookies are vulnerable to CSRF, but can be protected using:

* SameSite
* CSRF Token
* Secure Cookie

---

# 2. User refreshes the page. How do you keep them logged in?

### Scenario

> User logged in successfully. They refresh the page.

What happens?

### Good Answer

When the page refreshes:

1. React state is lost.
2. Check whether a valid refresh token exists.
3. Call

```
POST /refresh-token
```

4. Backend returns a new access token.
5. Store access token in memory.
6. Continue the session.

---

# 3. Token expires while the user is working.

### Scenario

> User is editing a form for 20 minutes.

Access token expires.

What will you do?

### Expected Answer

Use an Axios interceptor.

Flow

```
API Request

↓

401 Unauthorized

↓

Refresh Token API

↓

New Access Token

↓

Retry Original Request
```

Never ask the user to log in immediately if refresh succeeds.

---

# 4. Multiple API calls fail with 401 simultaneously.

### Scenario

Five API requests happen together.

All return 401.

Will you call Refresh API five times?

### Good Answer

No.

Use a queue.

```
Request 1 -> Refresh

Request 2 -> Wait

Request 3 -> Wait

↓

Refresh Success

↓

Retry all requests
```

Only one refresh request should happen.

---

# 5. How do you protect private routes?

### Example

```
/dashboard

/profile

/settings
```

### Good Answer

Create a Protected Route.

```jsx
if (!user) {
   return <Navigate to="/login" />;
}

return children;
```

---

# 6. User opens the application in two browser tabs.

### Scenario

User logs out from one tab.

The other tab is still open.

How do you synchronize logout?

### Good Answer

Listen to the storage event.

```javascript
window.addEventListener("storage", () => {
   logout();
});
```

Or use:

```
BroadcastChannel API
```

---

# 7. User manually changes the JWT in LocalStorage.

### Scenario

They edit the token using DevTools.

What happens?

### Answer

Frontend should never trust the token.

Every protected API should verify it on the server.

Frontend only uses it to send requests.

---

# 8. Backend suddenly returns 403.

Difference between 401 and 403?

### Answer

401

```
User is NOT authenticated.
```

Need Login.

403

```
User is authenticated

But doesn't have permission.
```

Example

Admin page

Normal user

↓

403 Forbidden

---

# 9. How do you prevent unauthorized API calls before login?

### Answer

Don't call protected APIs until authentication finishes.

Example

```jsx
if (!isAuthenticated) return;
```

Or

```jsx
enabled: !!user
```

when using React Query.

---

# 10. How do you implement Role Based Authentication?

### Scenario

```
Admin

Manager

Employee
```

### Answer

Backend returns

```json
{
  "role":"Admin"
}
```

Frontend checks

```jsx
if(role !== "Admin"){
   return <AccessDenied />;
}
```

Backend must also validate roles.

---

# 11. User changes URL manually.

Example

```
/admin
```

What happens?

### Answer

Route Guard

```jsx
if(user.role!=="Admin"){
   return <Navigate to="/403"/>
}
```

Backend should still verify permissions.

---

# 12. Login API is slow.

### Scenario

User clicks Login five times.

### Answer

Disable button

```jsx
disabled={loading}
```

Show spinner.

Prevent duplicate requests.

---

# 13. How do you remember the logged-in user after reopening the browser?

### Answer

Use:

* Refresh Token
* Silent Login
* Session Restoration

Never rely only on React Context because it resets when the browser closes.

---

# 14. How do you log out?

### Answer

* Clear access token.
* Clear refresh token (server-side or via cookie expiration).
* Clear React state.
* Clear cache (React Query/Redux if used).
* Redirect to login.

---

# 15. Why shouldn't you decode a JWT and trust the role?

### Answer

Anyone can decode a JWT.

Never authorize users based only on frontend-decoded claims.

Always validate on the server.

---

# 16. Authentication vs Authorization

Authentication

```
Who are you?
```

Authorization

```
What are you allowed to do?
```

---

# 17. Explain the complete authentication flow.

```
Login

↓

Backend verifies credentials

↓

Returns

Access Token

Refresh Token

↓

React stores access token

↓

API Requests

↓

Token expires

↓

Refresh API

↓

New Access Token

↓

Continue working

↓

Logout

↓

Tokens removed
```

---

# 18. React Coding Scenario

**Q:** Build a protected route.

```jsx
import { Navigate } from "react-router-dom";

function ProtectedRoute({ children }) {
  const token = localStorage.getItem("token");

  if (!token) {
    return <Navigate to="/login" replace />;
  }

  return children;
}
```

---

# 19. Axios Interceptor Example

```javascript
axios.interceptors.response.use(
  response => response,
  async error => {
    if (error.response?.status === 401) {
      // Refresh token
      // Retry original request
    }
    return Promise.reject(error);
  }
);
```

---

# 20. Real Interview Scenario

**Interviewer:** A user is filling a long insurance form. After 30 minutes, the token expires. You don't want the user to lose their work. How would you handle it?

**Strong Answer:**

* Use a short-lived access token and a longer-lived refresh token.
* Intercept `401 Unauthorized` responses with an Axios interceptor.
* Refresh the access token automatically using the refresh token.
* Retry the original request once the new access token is obtained.
* Save in-progress form data locally (React state plus autosave to local storage or draft API if appropriate) so accidental refreshes or network issues don't lose work.
* If refresh fails (for example, the refresh token has expired), preserve the draft, redirect to the login page, and after successful login restore the user's work.

---

## Other Scenario-Based React Questions You Should Prepare

* Why does a component re-render unexpectedly, and how would you optimize it?
* How would you manage state across a large React application?
* When would you use Context API instead of Redux or Zustand?
* How do you avoid unnecessary API calls?
* How do you implement infinite scrolling?
* How do you debounce a search input?
* How do you handle race conditions when multiple API requests are in flight?
* How would you optimize the performance of a page rendering thousands of rows?
* How do you implement optimistic UI updates?
* How do you handle errors globally in a React application?

These types of practical, scenario-driven questions are very common in React interviews because they assess how you design and troubleshoot real-world applications, not just your knowledge of APIs and syntax.



Yes. In React interviews, especially for **3–6 years of experience**, interviewers often spend **20–30 minutes just on the login/authentication flow**. They ask "What if...?" scenarios instead of theory.

Here are common scenario-based questions with strong answers.

---

# 1. Explain the complete login flow from clicking Login.

### Interviewer

> What happens from the moment I click the Login button?

### Good Answer

```
User enters email & password
        ↓
Frontend validates input
        ↓
POST /login API
        ↓
Backend verifies credentials
        ↓
Backend returns:
- Access Token
- Refresh Token
        ↓
Store Refresh Token in HttpOnly Cookie
Store Access Token in memory (or as per app design)
        ↓
Fetch user profile (/me)
        ↓
Store user data in Context/Redux
        ↓
Navigate to Dashboard
```

---

# 2. Why do we need both Access Token and Refresh Token?

### Answer

Access Token:

* Short expiry (10–15 minutes)
* Used for every API request

Refresh Token:

* Long expiry (7–30 days)
* Used only to get a new access token
* More secure when stored in an HttpOnly cookie

---

# 3. The access token expires while the user is working. What happens?

### Answer

```
API Request
      ↓
401 Unauthorized
      ↓
Axios Interceptor catches it
      ↓
Call /refresh-token
      ↓
Receive new access token
      ↓
Retry original API
      ↓
User never notices
```

---

# 4. What if the Refresh Token is also expired?

### Answer

```
Refresh API
      ↓
401
      ↓
Logout User
      ↓
Clear tokens
      ↓
Redirect Login Page
      ↓
Show
"Your session has expired. Please login again."
```

---

# 5. Five API requests fail at the same time with 401. What will you do?

### Wrong Answer

Call Refresh API five times.

### Correct Answer

Only one refresh request should happen.

```
API1 → 401
API2 → Wait
API3 → Wait
API4 → Wait
API5 → Wait

↓

Refresh Token API

↓

Success

↓

Retry all waiting requests
```

---

# 6. User refreshes the browser.

### Interviewer

> React state is lost. How do you keep the user logged in?

### Answer

```
App loads

↓

Check Refresh Token Cookie

↓

Call Refresh API

↓

Get New Access Token

↓

Load User Profile

↓

Dashboard Opens
```

---

# 7. User closes the browser and opens it tomorrow.

### Answer

If the refresh token is still valid:

* Generate a new access token
* Restore the session automatically

Otherwise:

* Redirect to Login

---

# 8. User logs out from one browser tab.

Another tab is still open.

How do you logout both?

### Answer

Use:

```
storage event

or

BroadcastChannel API
```

When logout happens:

```
Clear Token

↓

Notify Other Tabs

↓

Other Tabs Logout Automatically
```

---

# 9. User manually changes the token in LocalStorage.

### Answer

No problem.

Backend validates every JWT.

Even if the frontend sends a fake token,

Backend returns

```
401 Unauthorized
```

Never trust the frontend.

---

# 10. User opens

```
/dashboard
```

without logging in.

### Answer

Protected Route

```
if (!token)
    redirect("/login")
```

Backend also verifies authentication for every protected API.

---

# 11. User directly opens

```
/admin
```

### Answer

Check role.

```
if(role!="Admin")
```

Return

```
403 Forbidden
```

Both frontend and backend should enforce authorization.

---

# 12. Login button is clicked five times.

### Answer

Disable button after first click.

```
Loading...

↓

Disable Button

↓

Wait Response

↓

Enable Again
```

Prevents duplicate requests.

---

# 13. Network is slow during login.

### Answer

Show:

* Spinner
* Disable button
* Timeout message if needed
* Retry option if appropriate

Good UX matters.

---

# 14. Login API succeeds but fetching the user profile fails.

### Answer

```
Login Success

↓

Token Received

↓

/me API Failed

↓

Retry

↓

If still fails

Logout
```

The app should avoid entering a partially authenticated state.

---

# 15. Why don't we store passwords?

### Answer

Passwords should never be stored by the frontend.

The frontend only sends them over HTTPS to the login API.

---

# 16. Difference between 401 and 403?

```
401

Not Logged In

Need Authentication
```

```
403

Logged In

No Permission
```

---

# 17. How do you logout?

### Answer

```
Click Logout

↓

Backend Invalidates Refresh Token (if implemented)

↓

Clear Access Token

↓

Clear User State

↓

Clear Cache

↓

Redirect Login
```

---

# 18. Where do you store tokens?

A strong production answer is:

* **Access Token:** In memory (or follow the application's chosen design)
* **Refresh Token:** HttpOnly Secure Cookie

Avoid storing sensitive tokens in LocalStorage when security is a priority because of XSS risks.

---

# 19. What happens if a user stays idle for one hour?

### Answer

If the refresh token is still valid:

```
User Makes API

↓

Access Token Expired

↓

Refresh Token

↓

Continue
```

If both tokens are expired:

```
Session Expired

↓

Redirect Login
```

---

# 20. Real Interview Question

**Interviewer:**

> Suppose a user is filling a loan application for 30 minutes. The access token expires during submission. What happens?

**Strong Answer:**

* The submit request returns `401 Unauthorized`.
* An Axios interceptor catches the error.
* The app sends a refresh token request.
* If successful, it receives a new access token.
* The original submit request is retried automatically.
* The user sees no interruption and does not lose their entered data.
* If the refresh request fails, preserve the form data (for example, as a draft), redirect to login, and restore the draft after successful authentication.

## Tips Interviewers Like to Hear

* Never trust the frontend for authentication or authorization.
* Keep access tokens short-lived.
* Use refresh tokens for session continuity.
* Handle `401` responses automatically with interceptors.
* Avoid multiple simultaneous refresh requests.
* Protect routes on the frontend for UX, but always enforce security on the backend.
* Preserve user work during session expiry whenever possible.

These are among the most frequently asked authentication scenarios in React interviews and are often used to assess practical experience rather than memorized definitions.



If you're interviewing for a **Frontend Developer (React.js + JavaScript)** role, especially with **2–5 years of experience**, expect many **scenario-based questions** instead of simple theory. Below are common interview questions with what the interviewer is looking for.

---

# 1. Authentication & Login

### Q1. How would you implement login in a React application?

**Expected Answer:**

* User enters email/password.
* Send credentials to the backend using POST.
* Backend validates user.
* Backend returns:

  * Access Token
  * Refresh Token (optional)
* Store tokens securely.
* Redirect to dashboard.
* Send Access Token in Authorization header for every API request.

Example:

```http
POST /login

{
   "email":"abc@gmail.com",
   "password":"123456"
}
```

Response

```json
{
   "accessToken":"xxxxx",
   "refreshToken":"yyyy"
}
```

---

### Q2. Where should you store JWT?

**Best Answer**

Avoid LocalStorage for sensitive apps because of XSS risk.

Preferred:

* HttpOnly Secure Cookies ✅
* Memory (Redux/Context) for access token
* Refresh token inside HttpOnly Cookie

If interviewer asks about LocalStorage:

> It is easy to implement but vulnerable to XSS.

---

### Q3. User refreshes the page. How do you keep them logged in?

Answer:

* Access token may be lost.
* Use Refresh Token.
* Call

```http
POST /refresh-token
```

Backend returns a new access token.

---

### Q4. API returns 401 Unauthorized. What will you do?

Answer:

1. Intercept response.
2. Call Refresh Token API.
3. Get new access token.
4. Retry original request.
5. If refresh also fails → logout user.

Usually done with Axios Interceptors.

---

### Q5. How do you protect private routes?

Example

```jsx
<Route
 path="/dashboard"
 element={
   isAuthenticated
      ? <Dashboard/>
      : <Navigate to="/login"/>
 }
/>
```

Or create

```jsx
<PrivateRoute>
```

component.

---

# 2. API Questions

---

### Q6. Multiple APIs need to load on page. How?

Use

```javascript
Promise.all()
```

Example

```javascript
const [users, posts] = await Promise.all([
   getUsers(),
   getPosts()
]);
```

Loads simultaneously.

---

### Q7. API is taking too long.

What will you do?

Answer:

* Loading spinner
* Skeleton UI
* Timeout
* Retry mechanism
* Lazy loading
* Pagination

---

### Q8. One API succeeds and another fails.

How will you handle?

Use

```javascript
Promise.allSettled()
```

instead of

```javascript
Promise.all()
```

---

### Q9. How do you cancel API requests?

Use

```javascript
AbortController
```

or Axios Cancel Token.

Useful when:

* User changes page
* Search input changes
* Component unmounts

---

### Q10. User clicks Submit multiple times.

How prevent duplicate API?

Options

* Disable button
* Loading state

```javascript
disabled={loading}
```

or debounce.

---

# 3. React Scenario Questions

---

### Q11. Parent component re-renders. Child also re-renders.

How reduce unnecessary renders?

Answer:

```jsx
React.memo()
```

Use

* React.memo
* useMemo
* useCallback

---

### Q12. Large list (10,000 records). UI becomes slow.

Answer:

Use

* Virtualization

Libraries

* react-window
* react-virtualized

---

### Q13. Search API on every keystroke.

Bad.

Solution

Debounce

```javascript
setTimeout()
```

or

```javascript
lodash.debounce()
```

---

### Q14. Component fetches data repeatedly.

Reason?

Wrong dependency array.

Wrong

```javascript
useEffect(()=>{
 fetchData();
});
```

Correct

```javascript
useEffect(()=>{
 fetchData();
},[]);
```

---

### Q15. API inside useEffect causing infinite loop.

Wrong

```javascript
useEffect(()=>{
 fetchUsers();
}, [users]);
```

Correct

```javascript
useEffect(()=>{
 fetchUsers();
}, []);
```

---

# 4. JavaScript Scenario Questions

---

### Q16. Difference between == and ===

```javascript
5 == "5"
```

True

```javascript
5 === "5"
```

False

Always prefer

```javascript
===
```

---

### Q17. Event Loop

Question:

```javascript
console.log(1);

setTimeout(()=>{
 console.log(2);
},0);

Promise.resolve().then(()=>{
 console.log(3);
});

console.log(4);
```

Output

```
1
4
3
2
```

---

### Q18. Closure

```javascript
function counter(){

 let count=0;

 return function(){

    count++;

    console.log(count);

 }

}

const c=counter();

c();
c();
```

Output

```
1
2
```

---

### Q19. var vs let

Interviewers ask many times.

| var            | let                          |
| -------------- | ---------------------------- |
| Function scope | Block scope                  |
| Hoisted        | Hoisted (Temporal Dead Zone) |
| Can redeclare  | Cannot redeclare             |

---

### Q20. Explain async/await.

Answer:

It makes asynchronous code easier to read. It is built on top of Promises and allows you to write code that looks synchronous while remaining non-blocking.

---

# 5. State Management

### Q21. Context vs Redux

Context

* Small apps
* Theme
* Authentication
* Language

Redux

* Large applications
* Complex state
* DevTools
* Middleware

---

### Q22. Why Redux Toolkit?

Answer

* Less boilerplate
* Built-in Immer
* Better performance
* Easier async using createAsyncThunk

---

# 6. Performance Questions

---

### Q23. React app is slow.

What will you check?

* React.memo
* useMemo
* useCallback
* Lazy loading
* Code splitting
* Image optimization
* Virtual scrolling
* Remove unnecessary re-renders

---

### Q24. Difference between useMemo and useCallback

```
useMemo
Returns memoized value

useCallback
Returns memoized function
```

---

# 7. Real Interview Scenarios

### Scenario 1

> User logs in on two browser tabs. One logs out. What happens?

Answer:

* Clear authentication state in both tabs using the `storage` event or `BroadcastChannel`.
* Redirect all tabs to the login page.

---

### Scenario 2

> API returns 500.

Answer:

* Show a user-friendly error message.
* Log the error for monitoring.
* Allow retry if appropriate.
* Avoid exposing backend details.

---

### Scenario 3

> Dashboard has 10 APIs.

Answer:

* Fetch independent APIs in parallel with `Promise.all`.
* Lazy-load data that isn't immediately visible.
* Cache repeated requests if appropriate.

---

### Scenario 4

> Search API fires 100 requests.

Answer:

* Debounce input (e.g., 300–500 ms).
* Cancel previous request using `AbortController`.
* Ignore stale responses if a newer request completes first.

---

### Scenario 5

> User token expires while using the application.

Answer:

* API returns 401.
* Refresh the access token automatically.
* Retry the failed request.
* If refresh fails, clear session and redirect to login.

---

# Common Rapid-Fire Questions

* What is the Virtual DOM?
* Difference between `useEffect` and `useLayoutEffect`?
* What are controlled and uncontrolled components?
* Explain React reconciliation.
* What are React hooks?
* Difference between state and props?
* What is prop drilling? How can it be avoided?
* What is code splitting?
* What are Higher-Order Components (HOCs)?
* What is lazy loading in React?
* What is CORS?
* What are HTTP status codes (200, 201, 400, 401, 403, 404, 500)?
* Difference between `PUT` and `PATCH`?
* Explain REST APIs.
* What is optimistic UI?
* How do you handle race conditions in API calls?

These are among the most frequently asked React/JavaScript interview topics, especially for frontend roles that emphasize authentication, API integration, and real-world application scenarios. Being able to explain both **what** you would do and **why** is often more important than memorizing definitions.



