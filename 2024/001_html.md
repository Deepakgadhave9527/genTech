
========================================================================
# What is <!DOCTYPE html>?

- `<!DOCTYPE html>` is a declaration that tells the browser to render the document using the HTML5 standard.

- It ensures that the browser renders the page in **Standards Mode**, following modern HTML and CSS specifications.

- It is **not an HTML tag**. It is a declaration placed at the very top of an HTML document.

## Example

```html
<!DOCTYPE html>
<html>
<head>
    <title>My Website</title>
</head>
<body>
    <h1>Hello World</h1>
</body>
</html>
```


# What happens if you dont include `<!DOCTYPE html>`?

If the DOCTYPE is missing or incorrect, the browser switches to **Quirks Mode**.

This can cause:

- Box model issues (incorrect width/height calculations)
- Layout inconsistencies across browsers
- Inconsistent spacing, margins, and padding
- Different rendering of fonts and elements
- CSS behaving differently than expected
- Poor cross-browser compatibility

# What is Quirks Mode?

- **Quirks Mode** is a browser rendering mode designed for backward compatibility with very old websites.

- It is triggered when an HTML document has no DOCTYPE or an incorrect DOCTYPE.

- In Quirks Mode, browsers imitate the behavior of older browsers, which can lead to inconsistent rendering.

# Why do we use `<!DOCTYPE html>`?

- Enables Standards Mode.
- Ensures consistent rendering across browsers.
- Improves cross-browser compatibility.
- Prevents layout and CSS issues.
- Follows the HTML5 standard.

# Interview Definition

`<!DOCTYPE html>` is a declaration placed at the top of an HTML document that tells the browser to render the page using the HTML5 standard. It enables Standards Mode, ensuring consistent rendering and proper HTML and CSS behavior across modern browsers.



================================ Semantic elements ====================================

**Semantic Elements in HTML**



- Semantic elements are HTML elements that clearly describe their meaning to both the browser and developers.

- They make the HTML code easier to read, understand, and maintain.

- They improve accessibility by helping screen readers and other assistive technologies understand the structure of the page.

- They also improve SEO because search engines can better understand the content and structure of a webpage.

- They make the code more organized and easier to debug.



### Common Semantic Elements:

<article>
<aside>
<details>
<figcaption>
<figure>
<footer>
<header>
<main>
<mark>
<nav>
<section>
<summary>
<time>


----------------------------------------------------------------------------


### Benefits of Semantic Elements:

**Clarity**- Code becomes easier to read and understand.

**Meaning**- Tags describe _what_ the content is — not just _how_ it looks.

**Accessibility**- Helps screen readers and assistive tools navigate more effectively.

**SEO**- Search engines better understand the structure of your page.

### Cleaner, More Meaningful HTML Structure

#### 📈 Why This Helps SEO:

- Search engines easily detect page structure using tags like `<header>`, `<nav>`, `<main>`, `<article>`, and `<footer>`.
- Headings like `<h1>` and `<h2>` help bots understand the content hierarchy.
- `<nav>` links are recognized as key site navigation — crucial for effective crawling.

#### ♿ Why This Helps Accessibility:

- Screen readers can skip to `<nav>` or `<main>` directly using keyboard shortcuts.
- Tags like `<article>` signal independent, readable content — improving organization.
- `<footer>` indicates the end of content, reducing confusion for assistive technologies.



===============================================================================
pseudo-classes vs Pseudo-Elements

1.  ### Pseudo-classes (:) 

-Pseudo-classes are CSS selectors used to apply styles to an element based on its **state**, **user interaction**, or **position** in the document.
- Denoted by a single colon (:).
- It allows you to apply styles without adding extra classes or JavaScript.


   <style>
  a:hover {
    color: red;
  }
</style>

<a href="#">Hover over me</a>


### Common Pseudo-Classes

- `:hover` – Applies when the user hovers over an element.
- `:active` – Applies while an element is being clicked.
- `:focus` – Applies when an element receives keyboard or mouse focus.
- `:visited` – Styles visited links.
- `:link` – Styles unvisited links.
- `:checked` – Styles checked checkboxes or radio buttons.
- `:disabled` – Styles disabled form elements.
- `:enabled` – Styles enabled form elements.
- `:first-child` – Selects the first child element.
- `:last-child` – Selects the last child element.
- `:nth-child()` – Selects elements based on their position

2.  ### Pseudo-Elements (::) 

- Used to style specified parts of an element.
- Denoted by a double colon (::).
- Common pseudo-elements include
  `::before`, `::after`, `::first-letter`, and `::first-line`.

- Can target the first letter or first line of text within an element, among other things.
- Can be used to insert content before or after the element.


### Common Pseudo-Elements

- `::before` – Inserts content before an element.
- `::after` – Inserts content after an element.
- `::first-letter` – Styles the first letter.
- `::first-line` – Styles the first line.
- `::selection` – Styles selected text.
- `::placeholder` – Styles placeholder text in input fields.
- `::marker` – Styles list item markers (bullets or numbers).

   <style>
  
    p::before {
      content: "Before "
    }
  
    p::after {
      content: " After";
      font-style: italic;
    }

</style>
  <p>This is a paragraph.</p>


----------------------------------------------------------------------------

When referring to state, this includes the condition or States generally involve user interaction.

- Common pseudo-classes include `:hover`, `:active`, `:focus`, and `:disabled`.

- Primarily used to style elements under various states.

================================================================================


# 📌 CSS `position` Property

The **`position` property** in CSS specifies how an element is positioned in the document, 
and how it interacts with the document’s normal flow.

The possible values are:

- `static` (default)
- `relative`
- `absolute`
- `fixed`
- `sticky`

### Static

- By default the all elements postions are the static
- Elements are positioned according to the normal document flow (block elements stack vertically, inline elements flow left to right).
- Not affected positioning properties the `top`, `right`, `bottom`, or `left`
- It occupies space in the layout as normal (Holds space in the layout).

### Relative

- its default/static position of the elwmwnt 

-the measurement of positioning properties top, right, bottom, left starts from the element’s by default (static) position in the normal flow.

- its Holds its space in the layout — other elements behave like it hasn’t moved.

- You can move it using `top`, `right`, `bottom`, `left`.

-The element starts in the normal document flow (static positioning) by default.

### Absolute
- An absolutely positioned element is positioned relative to its nearest positioned ancestor (an ancestor with position: relative, absolute, fixed, or sticky). 

- Measurement of length (top, right, bottom, left) starts from the nearest relatively positioned parent element. (an ancestor with `position: relative`, `absolute`, `fixed`, or `sticky`).

- If no relative parent exists, measurement will start from the body/viewport.

- if we set postion absolute then The element is removed from the normal document flow, so it does not occupy space in the layout.

- Can overlap other content because it is removed from the normal document flow.


- With the help of the top, right, bottom, and left position properties, we can set the element's position as required.


Use case: Modals, dropdown menus, tooltips, floating buttons.

### Fixed ##:

- Positioned relative to the viewport.
- element is fixed to viewport  and does not move when the page is scrolled.

- The element does occupy space in the layout because it is not removed 
from the normal document flow.

- the measurement of position properties (top, right, bottom, left,) start from the viewport or body, not from any parent element.

**Use cases:** Fixed navbar, floating buttons, chat buttons, back-to-top buttons, cookie banners.


### Sticky

- The element is positioned based on the user's scroll position.
- It behaves like `position: relative` initially and stays in the normal document flow.
- When the element reaches the specified offset (`top`, `right`, `bottom`, `left`) during scrolling, it behaves like `position: fixed` within its scrolling container.
- The element does occupy space in the layout because it is not removed from the normal document flow.
- The `top`, `right`, `bottom`, and `left` properties define the point at which the element becomes sticky.


- A sticky element is limited to the boundaries of its parent/container and will stop moving when the parent container ends.

**Use cases:** Sticky navigation bars, table headers, sidebars, filter menus.



```
static, relative, sticky  is hold space ✅
absolute, fixed is not hold space ❌
```

================================================================================

### Block Elements:

- Start on a new row.
- Take up the full width .
- Width and height can be set.
- You can fully control their box model.

- Examples: `<div>`, `<p>`, `<li>`, etc.

1.  <address>
2.  <article>
3.  <aside>
4.  <blockquote>
5.  <canvas>
6.  <dd>
7.  <div>
8.  <dl>
9.  <dt>
10. <fieldset>
11. <figcaption>
12. <figure>
13. <footer>
14. <form>
15. <h1> - <h6>
16. <header>
17. <hr>
18. <li>
19. <main>
20. <nav>
21. <noscript>
22. <ol>
23. <p>
24. <pre>
25. <section>
26. <table>
27. <tfoot>
28. <ul>

29. <video>
### Inline Elements

- Do not start on a new line.
- Display on the same line if there is enough space.
- `width` and `height` properties do not work (both horizontally and vertically).
- Left and right margins and padding work normally.
- Top and bottom padding is visible but does not affect the layout of surrounding elements.
- Top and bottom margins generally do not affect the layout of surrounding elements.


- Examples: `<span>`, `<a>`, `<strong>`, `<img>`, `<input>`.

You can set vertical padding and margin.But they don't affect layout like they do for block elements.

1. <a>
2. <b>
3. <br>
4. <cite>
5. <code>
6. <em>
7. <i>
8. <img>
9. <input>
10. <label>
11. <span>
12. <strong>
13. <sub>
14. <sup>
15. <time>

### inline-block

- inline-block elements can behave like inline elements, but you can also control their width, height, margins, and padding, like block elements
 - Does not start on a new line.
- Flows inline with other elements, like `inline`.
- Accepts `width`, `height`, `padding`, `margin`, and `border` values, like `block`.

- Provides a hybrid behavior between `block` and `inline` elements.

- Can wrap to the next line if there’s no space left on the current line.
- Can be aligned using the `vertical-align` property (like `top`, `middle`, `bottom`).


--------------------------------------------------------------------------



### **When Block or Inline Elements are Set as `inline-block`:**

- **Inline elements** set as `inline-block`:
  - They **sit next to each other horizontally** like normal inline elements.
  - **Full control of the box model**: You can set **vertical and horizontal padding** and **margins**, as well as **width** and **height**.
  - They **do not start on a new line** — they **stay inline**, unless the container’s width is filled.
  - They **do not take full width** — only as much as needed for content, but you can control it with width/height.
  - **Display on the same line if there’s enough space**.

- **Block elements** set as `inline-block`:
  - They **sit next to each other horizontally** (which would normally be stacked vertically if they were just `block`).
  - They **respect width and height properties**, and you can also add **padding and margin**.
  - They do **not take up full width** unless specified (like `block` elements do).
  - **Display on the same line if there’s enough space**.

================================================================================

### Difference between `display: none;` and `visibility: hidden;`

- **`visibility: hidden;`**
  - Hides the element from the user.
  - The element is not visible, but it **still occupies space in the layout**.
  - It **remains in the document flow** and affects the positioning of other elements.

- **`display: none;`**
  - Completely removes the element from the page layout.
  - The element is **not visible and does not occupy any space**.
  - It **does not affect the document flow**, and other elements move to fill its space.

<!--
display none and visibility hidden

- **`visibility: hidden;`:**
  Hides the element while still occupying space in the layout.
  It's not visible, but it still affects the document flow.
- **`display: none;`:**
  Completely removes the element from the layout, including its space.
  I It's not rendered and doesn't affect the document flow. -->

========================================================================

list of HTML5 features with just the titles:

1. Semantic Elements
2. Video and Audio
3. Web Storage
4. IndexedDB
5. Forms Enhancements
6. Canvas
7. Web Workers
8. WebSocket API
9. Form Validation
10. Drag and Drop API
11. Offline Capabilities
12. Geolocation
13. SVG and MathML
14. Microdata
15. Server-Sent Events (SSE)
16. Viewport Meta Tag
17. Web Animation API
18. Custom Data Attributes
19. WebRTC
20. Shadow DOM
21. History API
22. Intersection Observer API

## HTML5 Features

### New Semantic Elements

Definition: Semantic HTML elements provide meaning to the structure of the document. They help both browsers and developers understand the purpose of different parts of a page, improving accessibility and SEO.

- **Elements**:
  - `<header>`: Defines a header for a document or section.
  - `<footer>`: Defines a footer for a document or section.
  - `<article>`: Represents a self-contained piece of content.
  - `<section>`: Defines a section in a document.
  - `<nav>`: Defines navigation links.
  - `<aside>`: Represents content aside from the main content.

### Form Enhancements

- **New Input Types**: `email`, `url`, `number`, `range`, `date`, `time`, etc.
- **Attributes**:
  - `placeholder`: Displays a hint within an input field.
  - `required`: Specifies that an input field must be filled out.
  - `pattern`: Defines a regular expression for input validation.
- **Example**:

  <input type="email" placeholder="Enter your email" required>
  ```

### Multimedia Support

- **Elements**:
  - `<audio>`: Embeds sound content.
  - `<video>`: Embeds video content.
- **Attributes**: `controls`, `autoplay`, `loop`, `muted`.
- **Example**:

  <video width="320" height="240" controls>
      <source src="movie.mp4" type="video/mp4">
      Your browser does not support the video tag.
  </video>
  ```

### Canvas Element

- **Purpose**: Used for drawing graphics via JavaScript.
- **Example**:

  <canvas id="myCanvas" width="200" height="100"></canvas>
  <script>
      const canvas = document.getElementById('myCanvas');
      const ctx = canvas.getContext('2d');
      ctx.fillStyle = 'red';
      ctx.fillRect(10, 10, 150, 100);
  </script>

  ```

  ```

### Geolocation API

- **Purpose**: Provides access to the user’s geographical location.
- **Example**:
  ```javascript
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
      console.log("Latitude: " + position.coords.latitude);
      console.log("Longitude: " + position.coords.longitude);
    });
  }
  ```

### Storage

- **Local Storage**: Stores data with no expiration time.
- **Session Storage**: Stores data for the duration of the page session.
- **Example**:

  ```javascript
  // Local Storage
  localStorage.setItem("key", "value");
  console.log(localStorage.getItem("key")); // Outputs: value

  // Session Storage
  sessionStorage.setItem("key", "value");
  console.log(sessionStorage.getItem("key")); // Outputs: value
  ```

### Web Workers

- **Purpose**: Allows running scripts in background threads.
- **Example**:

  ```javascript
  // worker.js
  onmessage = function(e) {
      postMessage('Hello ' + e.data);
  };

  // main.js
  const worker = new Worker('worker.js');
  worker.onmessage = function(e) {
      console.log(e.data); // Outputs: Hello [message]
  ```

};
worker.postMessage('World');

### WebSocket API

- **Purpose**: Provides full-duplex communication channels over a single TCP connection.
- **Example**:
  ```javascript
  const ws = new WebSocket("ws://www.example.com/socketserver");
  ws.onopen = function () {
    ws.send("Hello Server!");
  };
  ws.onmessage = function (event) {
    console.log("Message from server ", event.data);
  };
  ```

### Offline Web Applications

- **Application Cache**: Allows web applications to function offline (Note: deprecated in favor of Service Workers).

### Service Workers

- **Purpose**: Provides background functionality such as offline support and push notifications.
- **Example**:
  ```javascript
  if ("serviceWorker" in navigator) {
    navigator.serviceWorker
      .register("/service-worker.js")
      .then(function (registration) {
        console.log(
          "Service Worker registered with scope:",
          registration.scope,
        );
      });
  }
  ```

==================================================================================

Cross-browser compatibility ensures that web applications work consistently across different browsers and versions, providing a uniform user experience.

- **CSS Prefixes**: Use vendor prefixes (e.g., `-webkit-`, `-moz-`, `-ms-`, `-o-`) for CSS properties that require them to ensure compatibility with various browser engines.





---------------------------------------------------------------------------------------------

### Elements


- Elements are the simplest building blocks of React applications.
- They describe what you want to see on the screen.
- They are used to define what the UI should look like.
- React elements are objects that describe a DOM node or part of the UI, not actual DOM nodes. They are descriptions of UI elements.
- Elements can contain:
- Content: The actual data or text to be displayed.
- Semantic meaning: Tags like `<header>`, `<footer>`, `<article>`, etc., provide structure and meaning to the UI.
- Formatting instructions: Through attributes like `className` (CSS classes) or `style` (inline styles), React elements can specify how the content should be styled.
- React elements are immutable and lightweight objects that represent the structure of the UI.
- React uses these elements to create and update the DOM.



### Components

- Used to define the logic and structure of the UI, which can include multiple elements and other components.
- A function or class that can manage its own state and lifecycle.
- Components are more complex structures that define both the logic and structure of the UI, and they can include multiple elements and other components.
- A reusable and encapsulated piece of the UI, which can manage its own logic and state.

==============================================

### Tags

- Tags are the syntax used to create elements.
- A tag is a part of HTML syntax used to create an element.
- Tags can be opening, closing, or self-closing.

<div> <!-- Opening tag -->
</div> <!-- Closing tag -->

### Elements

- Elements are the structures that define the document's content and structure.
- An element consists of an opening tag, content (optional), and a closing tag.

<div> <!-- Opening tag -->
This is a div element. <!-- Content -->
</div> <!-- Closing tag -->







========================================================================

- **Absolute units**:
  - Are fixed and do not change with the size of the viewport or parent element.
  - Useful when precise control over sizes is needed, such as in print styles or pixel-perfect designs.
  - Common absolute units include `px`, `pt`, `in`, `cm`, and `mm`.

- **Relative units**:
  - Adapt to the size of the parent element, viewport, or root element, making them more flexible for responsive designs.
  - Allow elements to scale based on screen size, font size, or other relative measurements.
  - Help maintain flexible layouts and enhance accessibility by scaling with text size or viewport dimensions.
  - Common relative units include `%`, `em`, `rem`, `vw`, `vh`, `vmin`, and `vmax`.

**Summary**:

- **Absolute units** are fixed measurements that don't change relative to other elements, ideal for static, precise sizing.
- **Relative units** are dynamic and adapt based on other factors like the viewport or parent element size, enabling flexible and responsive design.

========================================================================

- **Absolute Units:**
- Absolute length units are fixed and do not change relative to any other elements or the viewport.
- They are typically used when you need precise, static measurements.

Fixed measurements that don't change relative to other elements.

### **Examples Absolute Units:**

- **`px` (pixels)**: Fixed unit, 1 pixel on the screen.
- **`pt` (points)**: 1 point = 1/72 inch, used in print.
- **`in` (inches)**: 1 inch = 2.54 cm, used for print.
- **`cm` (centimeters)**: Physical measurement in centimeters.
- **`mm` (millimeters)**: Physical measurement in millimeters.

- **Relative Units:**

Relative length units are based on other dimensions, such as the dimensions of the viewport, the font size, or the parent element. These units are useful for creating flexible and responsive layouts.

Measurements based on other dimensions or the viewport.

### **Relative Units in CSS**

- **`%`**: Relative to the **parent element’s size** (width, height).
- **`em`**: Relative to the **font size of the current element**.
- **`rem`**: Relative to the **root element’s font size** (usually `<html>`).
- **`vw`**: Relative to the **viewport width** (1% of the viewport width).
- **`vh`**: Relative to the **viewport height** (1% of the viewport height).

- **`vmin`**: Relative to the **smaller dimension** of the viewport.
- **`vmax`**: Relative to the **larger dimension** of the viewport.
- **`ch`**: Relative to the **width of the “0” character** in the font.
- **`ex`**: Relative to the **height of the lowercase “x”** in the font.

These units help create **responsive** and **scalable** designs.

### **Relative Units in CSS**

- **`%` (Percentage)**:
  - Relative to the **parent element’s size**.
  - A percentage is calculated as a fraction of the parent’s dimensions (width, height, padding, etc.).
  - Example: `width: 50%` means 50% of the parent element's width.

- **`em` (Relative to the font size of the element)**:
  - Relative to the **current element's font size**.
  - If no font size is set on the element, it is inherited from the parent.
  - Example: If the parent has `font-size: 16px`, then `1em` = `16px`.
  - `2em` would be `32px` if the parent font size is `16px`.
  - Used for scaling font sizes, margins, padding, etc.

- **`rem` (Relative to the root element's font size)**:
  - Relative to the **root element's font size** (typically `<html>`).
  - If the root element (`<html>`) has `font-size: 16px`, then `1rem` = `16px`.
  - `2rem` would be `32px`.
  - Consistent across the page, unlike `em`, which is dependent on the parent element.

- **`vw` (Viewport Width)**:
  - Relative to the **viewport’s width** (the width of the visible area of the browser).
  - 1 `vw` = **1% of the viewport width**.
  - Example: `width: 50vw` means the element will take up 50% of the viewport's width.
  - Useful for responsive layouts, especially in terms of width.

- **`vh` (Viewport Height)**:
  - Relative to the **viewport’s height** (the height of the visible area of the browser).
  - 1 `vh` = **1% of the viewport height**.
  - Example: `height: 50vh` means the element will take up 50% of the viewport's height.
  - Often used for full-screen sections or hero areas.

- **`vmin` (Viewport Minimum)**:
  - Relative to the smaller of the **viewport’s width or height**.
  - 1 `vmin` = **1% of the smaller dimension** of the viewport.
  - Example: If the viewport width is 1200px and height is 800px, `1vmin` will be **8px**.
  - Useful when you want a size that adjusts proportionally to the smaller dimension.

- **`vmax` (Viewport Maximum)**:
  - Relative to the larger of the **viewport’s width or height**.
  - 1 `vmax` = **1% of the larger dimension** of the viewport.
  - Example: If the viewport width is 1200px and height is 800px, `1vmax` will be **12px**.
  - Used when you want a size that adapts to the larger viewport dimension.

- **`ch` (Character Width)**:
  - Relative to the width of the **“0” (zero)** character of the current font.
  - 1 `ch` = **the width of the "0" character** in the current font.
  - Example: `width: 20ch` means the element will be as wide as 20 characters of the current font.

- **`ex` (X-height)**:
  - Relative to the **height of the lowercase “x”** in the current font.
  - The `ex` unit is dependent on the font's specific metrics.
  - Example: `font-size: 5ex` means the font will be 5 times the height of the lowercase "x" in the font.

### **When to Use Relative Units**

- **Responsiveness**: Use units like `vw`, `vh`, `%` for building layouts that adapt to screen sizes.
- **Scalability**: `em` and `rem` are great for scaling font sizes and elements proportionally.
- **Accessibility**: Relative units like `rem` make it easier for users to adjust font sizes based on their preferences.
- **Consistency**: `rem` provides a consistent, predictable scaling method for elements that is not dependent on parent styles.
