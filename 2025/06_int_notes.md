
==================================================
IMPORTANT DIFFERENCE:
align-items vs align-content
==================================================

align-items:

    Aligns ITEMS within a flex line.

align-content:

    Aligns MULTIPLE FLEX LINES within the container.


Example:

.container {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    align-content: space-between;
}


==================================================
MOST IMPORTANT INTERVIEW CONCEPT
==================================================

Question:
What is the difference between justify-content and align-items?

Answer:

justify-content → Aligns items along the MAIN AXIS.

align-items → Aligns items along the CROSS AXIS.


For:

flex-direction: row;

justify-content → Horizontal
align-items      → Vertical


For:

flex-direction: column;

justify-content → Vertical
align-items      → Horizontal


==================================================
EASY WAY TO REMEMBER
==================================================

justify-content
    ↓
MAIN AXIS

align-items
    ↓
CROSS AXIS

align-content
    ↓
MULTIPLE FLEX LINES


==================================================
COMMON INTERVIEW QUESTIONS
==================================================

Q1. What is Flexbox?

Answer:
Flexbox is a one-dimensional CSS layout system used to arrange and align elements in rows or columns.

--------------------------------------------------

Q2. How do you enable Flexbox?

Answer:

.container {
    display: flex;
}

--------------------------------------------------

Q3. What are the six important flex container properties?

Answer:

1. flex-direction
2. flex-wrap
3. flex-flow
4. justify-content
5. align-items
6. align-content

--------------------------------------------------

Q4. What is the default value of flex-direction?

Answer:

row

--------------------------------------------------

Q5. What is the default value of flex-wrap?

Answer:

nowrap

--------------------------------------------------

Q6. What is the default value of justify-content?

Answer:

flex-start

--------------------------------------------------

Q7. What is the default value of align-items?

Answer:

stretch

--------------------------------------------------

Q8. What is the default value of align-content?

Answer:

stretch

--------------------------------------------------

Q9. What is the difference between row and column?

Answer:

row:
Items are arranged horizontally.

column:
Items are arranged vertically.

--------------------------------------------------

Q10. What is the difference between justify-content and align-items?

Answer:

justify-content → Main axis
align-items      → Cross axis

--------------------------------------------------

Q11. What is the difference between align-items and align-content?

Answer:

align-items:
Aligns individual flex items within a flex line.

align-content:
Aligns multiple flex lines within the flex container.

--------------------------------------------------

Q12. Does align-content work with a single flex line?

Answer:

Generally no. align-content is useful when there are multiple flex lines,
usually created using flex-wrap: wrap.

--------------------------------------------------

Q13. What is flex-flow?

Answer:

flex-flow is shorthand for flex-direction and flex-wrap.

Example:

flex-flow: row wrap;


==================================================
ONE-LINE REVISION
==================================================

flex-direction → Direction
flex-wrap       → Wrap or not
flex-flow       → Direction + Wrap
justify-content → Main axis
align-items     → Cross axis
align-content   → Multiple flex lines


==================================================
INTERVIEW GOLDEN RULE
==================================================

DO NOT MEMORIZE:

justify-content = horizontal
align-items = vertical

Instead, remember:

justify-content = MAIN AXIS
align-items = CROSS AXIS

The direction of the main axis depends on flex-direction.




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


