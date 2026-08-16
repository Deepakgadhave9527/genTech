

==============================================================

## How to encapsulate data in JavaScript?

`Encapsulation` means `keeping data private and allowing access to it only through controlled methods`.

In JavaScript, we can achieve encapsulation using:

### 1. Private fields `#`
"# in JavaScript is used to define a private class field. It provides encapsulation by preventing access to that field from outside the class.

```js
class User {
  #password;

  constructor(password) {
    this.#password = password;
  }

  getPassword() {
    return this.#password;
  }
}

const user = new User("12345");

console.log(user.getPassword()); // 12345
console.log(user.#password);     // Error
```

Here, `#password` is `private` and cannot be directly accessed from outside the class.

### 2. Closures

We can also keep data private using a closure.

```js
function counter() {
  let count = 0;

  return {
    increment() {
      count++;
    },
    getCount() {
      return count;
    }
  };
}

const c = counter();

c.increment();
console.log(c.getCount()); // 1
```

Here, `count` cannot be directly accessed from outside.

### Interview answer

> `Encapsulation means hiding the internal data and providing controlled access to it. In JavaScript, we can achieve encapsulation using private class fields, closures, and methods that control access to the data.`

==============================================================
###  What is `z-index` in CSS?

`z-index` controls the `stacking order of overlapping elements`. 
The element with a higher `z-index` appears above an element with a lower `z-index`. It works within the element’s `stacking context`.”

```js

.box1 {
  position: relative;
  z-index: 1;
}

.box2 {
  position: relative;
  z-index: 2;
}

Here, .box2 appears in front of .box1 because 2 > 1.
```

==============================================================

100vh = full height of the viewport (screen).

100vh → 100% of viewport height
50vh → 50% of viewport height
100vw → 100% of viewport width

==============================================================
align-items vs align-content
align-items is used to align flex items within a single flex line along the cross-axis.

align-content is used to align multiple flex lines (rows or columns) within the flex container along the cross-axis.
==============================================================

### Interview Question: How do you center text inside a box?

`Answer:`
 “I use Flexbox on the parent container. `justify-content: center` centers the text horizontally, and `align-items: center` centers it vertically.”

```css
.box {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

`No `100vh` is required` when you only want to center text inside a specific box.

==============================================================
###  How do you center text in the viewport?

`Answer:`

 “Using Flexbox, set the parent to `display: flex`, then use `justify-content: center` and `align-items: center`. `min-height: 100vh` makes the container fill the viewport.”

```css
1. CSS flex — simplest

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

`Short:` `justify-content` → horizontal center, `align-items` → vertical center.

2. CSS grid — simplest


.container {
  display: grid;
  place-items: center;
  min-height: 100vh;
}

```




==============================================================

Flexbox is a one-dimensional CSS layout system used to arrange elements 
in a row or column.

There are 6 main properties used on a flex container:


flex-direction  → row
flex-wrap       → nowrap
flex-flow       → row nowrap
justify-content → flex-start
align-items     → stretch
align-content   → normal


To use Flexbox:

.container {
    display: flex;
}

==================================================
1. flex-direction


Question: What is flex-direction?

Answer:
The flex-direction property defines the direction in which flex items are placed inside a flex container.

Values:

row             → Items are placed left to right (default)
row-reverse     → Items are placed right to left
column          → Items are placed top to bottom
column-reverse  → Items are placed bottom to top

Example:

.container {
    display: flex;
    flex-direction: row;
}

Interview Point:
flex-direction determines the MAIN AXIS.

If flex-direction is row:
    Main axis  → Horizontal
    Cross axis → Vertical

If flex-direction is column:
    Main axis  → Vertical
    Cross axis → Horizontal


==================================================
2. flex-wrap


Question: What is flex-wrap?

Answer:
The flex-wrap property determines whether flex items should remain on a single line or move to multiple lines when there is not enough space.

Values:

nowrap         → All items stay on one line (default)
wrap           → Items move to multiple lines
wrap-reverse   → Items move to multiple lines in the opposite direction

Example:

.container {
    display: flex;
    flex-wrap: wrap;
}

Interview Point:
flex-wrap is useful when the container has many items and they cannot fit in a single line.


==================================================
3. flex-flow


Question: What is flex-flow?

Answer:
flex-flow is a shorthand property for:

    flex-direction
    flex-wrap

Instead of:

.container {
    flex-direction: row;
    flex-wrap: wrap;
}

We can write:

.container {
    flex-flow: row wrap;
}

Syntax:

flex-flow: <flex-direction> <flex-wrap>;


==================================================
4. justify-content


Question: What is justify-content?

Answer:
justify-content is used to align and distribute flex items along the MAIN AXIS.

Values:

flex-start    → Items are placed at the start (default)
flex-end      → Items are placed at the end
center        → Items are centered
space-between → Equal space between items
space-around  → Equal space around items
space-evenly  → Equal space between and around items

Example:

.container {
    display: flex;
    justify-content: center;
}

IMPORTANT INTERVIEW POINT:

justify-content works on the MAIN AXIS.

If:

flex-direction: row;

Then:

justify-content → Horizontal alignment

If:

flex-direction: column;

Then:

justify-content → Vertical alignment


==================================================
5. align-items


Question: What is align-items?

Answer:
align-items is used to align flex items along the CROSS AXIS.

Values:

flex-start → Items are placed at the cross-start
flex-end   → Items are placed at the cross-end
center     → Items are centered
baseline   → Items are aligned according to their text baseline
stretch    → Items stretch to fill the container (default)

Example:

.container {
    display: flex;
    align-items: center;
}

IMPORTANT INTERVIEW POINT:

align-items works on the CROSS AXIS.

If:

flex-direction: row;

Then:

align-items → Vertical alignment

If:

flex-direction: column;

Then:

align-items → Horizontal alignment


==================================================
6. align-content


Question: What is align-content?

Answer:
align-content is used to align and distribute MULTIPLE FLEX LINES along the CROSS AXIS.

Values:

flex-start    → Lines are packed at the start
flex-end      → Lines are packed at the end
center        → Lines are centered
space-between → Equal space between lines
space-around  → Equal space around lines
stretch       → Lines stretch to fill available space (default)

Example:

.container {
    display: flex;
    flex-wrap: wrap;
    align-content: center;
}

IMPORTANT:
align-content works only when there are MULTIPLE FLEX LINES.

Therefore, if flex-wrap is nowrap and there is only one line,
align-content generally has no effect.

