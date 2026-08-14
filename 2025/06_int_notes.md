
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