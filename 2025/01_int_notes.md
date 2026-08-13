


===========================================================================

In JavaScript, a do...while loop is used to execute a block of code at least once before checking a condition, and then it repeatedly executes the block as long as the condition remains true.

do {
  // Block of code to be executed
} while (condition);



  **Syntax:**
  ```javascript
  do {
    // Code to execute
  } while (condition);
  ```

  **Example:**
  ```javascript
  let count = 1;

  do {
    console.log(count);
    count++;
  } while (count > 5);



- **`do...while` Loop**:
  - Code block is executed before the condition is checked.
  - Guarantees at least one execution of the code block.

  
  ### ===========================================================================

### 2. **When to Use**

- **`while` Loop**: Use this when you want to run a block of code as long as a condition is true, 
and you don’t necessarily need to execute the code block if the condition is initially false.


- **`do...while` Loop**: Use this when you need to execute the code block at least once regardless of the condition. 
This is useful when the code block needs to run before any condition is evaluated.


### 3. **Execution Example**

Here’s a practical example showing the difference:

**while` Loop Example:**
```javascript
let num = 0;

while (num > 0) {
  console.log("This won't run because num is 0");
  num--;
}
```

**`do...while` Loop Example:**
```javascript
let num = 0;

do {
  console.log("This will run once, even though num is 0");
  num--;
} while (num > 0);
```






================================================================================


- **`while` Loop**: Checks the condition before executing the code block. If the condition is false initially, the code block inside the loop will not execute at all.

  **Syntax:**
  ```javascript
  while (condition) {
    // Code to execute
  }
  ```

  **Example:**
  ```javascript
  let count = 1;

  while (count > 5) {
    console.log(count);
    count++;
  }

  - **`while` Loop**:
  - Condition is checked before the loop executes.
  - If the condition is false initially, the code block may not execute at all.
  



============================


Let's understand these three terms with JavaScript examples.

### 1. Declaration

Declaration means creating a variable (creating a binding/name) without giving it a value.


```javascript
let name;


---

### 2. Initialization

Initialization means giving a variable its first value at the time it is created.

Example:

let name = "John";

Here:

* `name` is declared.
* `"John"` is the first value given to it.
* This is called initialization.


### 3. Assignment

Assignment means changing or updating the value of an already declared variable.

Example:

let name = "John"; // initialization

name = "David"; // assignment
```

First:

```
name → "John"
```

After assignment:

```
name → "David"
```

  