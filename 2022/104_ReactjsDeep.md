    Q1. What is React?
    React is a JavaScript library specifically designed for building user interfaces on the web. It simplifies the development process by breaking down the user interface into reusable components. These components are like building blocks that can be easily assembled and reused throughout the application. By dividing the UI into smaller, manageable parts, developers can efficiently update and render only the necessary sections, leading to faster and more responsive applications.
    One of the standout features of React is its declarative syntax. Instead of directly manipulating the DOM, developers can describe how the UI should look based on the application's state. React takes care of efficiently updating and rendering the components as the state changes. This declarative approach not only makes the code easier to understand but also enhances code reusability and maintainability.
    Overall, React empowers developers to create dynamic and engaging user interfaces for web applications. With its component-based architecture, efficient rendering, and declarative syntax, React has become a popular choice in the web development community for building interactive and highly performant UIs.

    Q2. What are the major features of React?
    Component-Based Architecture: React follows a component-based approach, making it easier to manage and maintain the codebase.

    Virtual DOM: React efficiently updates only the necessary parts of the UI, resulting in faster rendering and better performance.

    JSX: React allows writing HTML-like code directly within JavaScript using JSX.
    Unidirectional Data Flow: React's one-way binding ensures a predictable state and simplifies debugging.

    State Management: React provides built-in state management for creating interactive and dynamic user interfaces.
    
    Q3. What is JSX?
    JSX stands for JavaScript XML. It's a syntax extension used in React, a popular JavaScript library for building user interfaces. JSX allows you to write HTML-like code directly within your JavaScript code.
    Instead of creating elements and modifying them using JavaScript functions, JSX lets you define the structure and appearance of your user interface components in a more declarative and intuitive way.
    For example, in regular JavaScript, you would create an element like this:
    
      const element = document.createElement('h1');
      element.textContent = 'Hello, World!';
      document.body.appendChild(element);
              
    With JSX, you can achieve the same result in a more concise and familiar way:
    
      const element = <h1>Hello, World!</h1>;
              
    Under the hood, JSX is transformed into regular JavaScript using a transpiler like Babel. This transformed code is what actually gets executed by the browser or JavaScript runtime.
    JSX combines the power of JavaScript with the flexibility and expressiveness of HTML-like syntax, making it easier to create dynamic and interactive user interfaces in React.
    Q4. How to create components in React?
    Components are the building blocks of creating User Interfaces(UI) in React. There are two possible ways to create a component.
    Function Components : This is the simplest way to create a component. Those are pure JavaScript functions that accept props object as the first parameter and return React elements to render the output:
    For example, in regular JavaScript, you would create an element like this:
    
      function Greeting({ message }) {
        return <h1>{'Hello, $ {message}'}</h1>;
      }
              
    Class Components : You can also use ES6 class to define a component. The above function component can be written as a class component:
    
      class Greeting extends React.Component {
        render() {
          return <h1>{'Hello, $ {this.props.message}'}</h1>;
        }
      }
              
    Q5. When to use a Class Component over a Function Component?
    In React, both class components and function components can be used to build user interfaces. However, with the introduction of React Hooks in React 16.8, function components have gained more capabilities and can handle most of the tasks that were previously exclusive to class components.
    But even there are two reasons to use Class components over Function components.
    If you need a React functionality whose Function component equivalent is not present yet, like Error Boundaries.
    In older versions, If the component needs state or lifecycle methods then you need to use class component.
    Note: You can also use reusable react error boundary third-party component without writing any class. i.e, No need to use class components for Error boundaries.
    Q6. What are Pure Components?
    A pure component in React is a component that only re-renders when its props change. It helps optimize performance by preventing unnecessary re-renders when the component's props remain the same.
    Here's a simple example:
    
      import React, { PureComponent } from 'react';
    
      class Greeting extends PureComponent {
        render() {
          return <h1>Hello, {this.props.name}!</h1>;
        }
      }
    
      const App = () => {
        const name = "John Doe";
        
        return (
          <div>
            <Greeting name={name} />
          </div>
        );
      };
    
      export default App;
    
              
    In this example, we have a Greeting component that receives a name prop and displays a greeting message with the name. The Greeting component is a pure component because it only relies on its props and doesn't have any internal state.
    The App component renders the Greeting component with a specific name prop value, which is 'John Doe' in this case. Since the Greeting component is a pure component, it won't re-render unnecessarily as long as the name prop remains the same.
    Pure components are helpful in scenarios where you want to prevent unnecessary re-renders of components that rely only on their props.
    Q7. What is state in React?
    State of a component is an object that holds some information that may change over the lifetime of the component. The important point is whenever the state object changes, the component re-renders. It is always recommended to make our state as simple as possible and minimize the number of stateful components.
    Let's take an example of User component with message state. Here, useState hook has been used to add state to the User component and it returns an array with current state and function to update it.
    Example using Functional component:
    
      import React, { useState } from "react";
    
      function User() {
        const [message, setMessage] = useState("Welcome to React world");
    
        return (
          <div>
            <h1>{message}</h1>
          </div>
        );
      }
              
    Example using Class component:
    
      import React from 'react';
    
      class User extends React.Component {
        constructor(props) {
          super(props);
    
          this.state = {
            message: "Welcome to React world",
          };
        }
    
        render() {
          return (
            <div>
              <h1>{this.state.message}</h1>
            </div>
          );
        }
      }
              
    State is similar to props, but it is private and fully controlled by the component ,i.e., it is not accessible to any other component till the owner component decides to pass it.
    Q8. What are props in React?
    If we want to send data from parent component to child component, then we use props. Props acts as inputs to the component and they are immutable.
    Example:
    
      // Greeting.jsx
    
      import React from 'react';
      import Message from './Message';
    
      function Greeting() {
        const name = 'John Doe';
    
        return (
          <div>
            <Message name={name} />
          </div>
        );
      }
    
      export default Greeting;
    
              
    
      // Message.jsx
    
      import React from 'react';
    
      function Message(props) {
        return <h2>Hello, {props.name}!</h2>;
      }
    
      export default Message;
    
              
    Here, the parent component Greeting supplies the data (name) to the child component Message via props. The child component can then use that data to customize its rendering or perform other operations.
    Q9. What is the difference between state and props?
    Component Interaction: State is used to manage a component's own data, while props are used to pass data from a parent component to a child component.
    Mutability: State can be changed and updated within a component, while props cannot be changed and are read-only.
    Rendering: Changes to state trigger the component to re-render, updating what is shown on the screen. Changes to props do not trigger automatic re-rendering.
    In summary, state is for managing a component's internal data and can be changed, while props are for passing data from a parent component to a child component and are read-only.
    Q10. Why should we not update the state directly?
    If you try to update the state directly then it won't re-render the component.
    
      //Wrong
      this.state.message = "Hello world";
              
    Instead use setState() method. It schedules an update to a component's state object. When state changes, the component responds by re-rendering.
    
      //Correct
      this.setState({ message: "Hello World" });
              
    Q11. Why would you use a callback function as an argument when calling setState()?
    The callback function is invoked when setState finished and the component gets rendered.
    Note: It is recommended to use lifecycle method rather than this callback function.
    
      setState({ name: "John" }, () =>
        console.log("The name has updated and component re-rendered")
      );
              
    Q12. What are the differences between HTML and React event handling?
    Below are some of the main differences between HTML and React event handling:
    In HTML, the event name usually represents in lowercase as a convention:
    
      //Html
      <button onclick="activateLasers()"></button>
    
    
      //React
      <button onClick={activateLasers}>
              
    In HTML, you can return false to prevent default behavior. Whereas in React you must call preventDefault() explicitly
    
      //Html
      <a
        href="#"
        onclick='console.log("The link was clicked."); return false;'
      />
              
    
      //React
      function handleClick(event) {
        event.preventDefault();
        console.log("The link was clicked.");
      }
              
    In HTML, you need to invoke the function by appending () Whereas in react you should not append () with the function name. (refer 'activateLasers' function in the first point for example)
    Q13. How to bind methods or event handlers in JSX callbacks?
    There are 3 possible ways to achieve this in class components:
    Binding in Constructor: In JavaScript classes, the methods are not bound by default. The same rule applies for React event handlers defined as class methods. Normally we bind them in constructor.
    
      class User extends Component {
        constructor(props) {
          super(props);
          this.handleClick = this.handleClick.bind(this);
        }
    
        handleClick() {
          console.log("SingOut triggered");
        }
    
        render() {
          return <button onClick={this.handleClick}>SingOut</button>;
        }
      }
              
    Public class fields syntax: If you don't like to use bind approach then public class fields syntax can be used to correctly bind callbacks. The Create React App eanables this syntax by default.
    
      handleClick = () => {
        console.log("SingOut triggered", this);
      };
    
      <button onClick={this.handleClick}>SingOut</button>
              
    Arrow functions in callbacks: It is possible to use arrow functions directly in the callbacks.
    
      handleClick() {
        console.log('SingOut triggered');
      }
    
      render() {
        return <button onClick={() => this.handleClick()}>SignOut</button>;
      }
              
    Note: If the callback is passed as prop to child components, those components might do an extra re-rendering. In those cases, it is preferred to go with .bind() or public class fields syntax approach considering performance.
    Q14. How to pass a parameter to an event handler or callback?
    You can use an arrow function to wrap around an event handler and pass parameters:
    
      <button onClick={() => this.handleClick(id)} />
              
    This is an equivalent to calling .bind:
    
      <button onClick={this.handleClick.bind(this, id)} />
              
    Apart from these two approaches, you can also pass arguments to a function which is defined as arrow function
    
      <button onClick={this.handleClick(id)} />;
    
      handleClick = (id) => () => {
        console.log("Hello, your ticket number is", id);
      };
              
    Q15. What are synthetic events in React?
    SyntheticEvent is a cross-browser wrapper around the browser's native event. Its API is same as the browser's native event, including stopPropagation() and preventDefault(), except the events work identically across all browsers. The native events can be accessed directly from synthetic events using nativeEvent attribute.
    Let's take an example of BookStore title search component with the ability to get all native event properties
    
      function BookStore() {
        handleTitleChange(e) {
          console.log('The new title is:', e.target.value);
          // 'e' represents synthetic event
          const nativeEvent = e.nativeEvent;
          console.log(nativeEvent);
          e.stopPropogation();
          e.preventDefault();
        }
      
        return <input name="title" onChange={handleTitleChange} />
      }
              
    Q16. What are inline conditional expressions?
    You can use either if statements or ternary expressions which are available from JS to conditionally render expressions. Apart from these approaches, you can also embed any expressions in JSX by wrapping them in curly braces and then followed by JS logical operator &&.
    
      <h1>Hello!</h1>;
      {
        messages.length > 0 && !isLogin ? (
          <h2>You have {messages.length} unread messages.</h2>
        ) : (
          <h2>You don't have unread messages.</h2>
        );
      }
              
    Q17. What is 'key' prop and what is the benefit of using it in arrays of elements?
    A key is a special attribute you should include when creating arrays of elements. Key prop helps React identify which items have changed, are added, or are removed.
    Keys should be unique among its siblings. Most often we use ID from our data as key:
    
      const todoItems = todos.map((todo) => <li key={todo.id}>{todo.text}</li>);
              
    When you don't have stable IDs for rendered items, you may use the item index as a key as a last resort:
    
      const todoItems = todos.map((todo, index) => (
        <li key={index}>{todo.text}</li>
      ));
              
    Note:
    Using indexes for keys is not recommended if the order of items may change. This can negatively impact performance and may cause issues with component state.
    If you extract list item as separate component then apply keys on list component instead of li tag.
    There will be a warning message in the console if the key prop is not present on list items.
    The key attribute accepts either string or number and internally convert it as string type.
    Q18. What is the use of refs?
    The ref is used to return a reference to the element. They should be avoided in most cases, however, they can be useful when you need a direct access to the DOM element or an instance of a component.
    Q19. How to create refs?
    The callback function is invoked when setState finished and the component gets rendered.
    There are two approaches.,
    This is a recently added approach. Refs are created using React.createRef() method and attached to React elements via the ref attribute. In order to use refs throughout the component, just assign the ref to the instance property within constructor.
    
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
          this.myRef = React.createRef();
        }
    
        render() {
          return <div ref={this.myRef} />;
        }
      }
              
    You can also use ref callbacks approach regardless of React version. For example, the search bar component's input element is accessed as follows,
    
      class SearchBar extends Component {
        constructor(props) {
          super(props);
          this.txtSearch = null;
          this.state = { term: "" };
          this.setInputSearchRef = (e) => {
            this.txtSearch = e;
          };
        }
    
        onInputChange(event) {
          this.setState({ term: this.txtSearch.value });
        }
    
        render() {
          return (
            <input
              value={this.state.term}
              onChange={this.onInputChange.bind(this)}
              ref={this.setInputSearchRef}
            />
          );
        }
      }
              
    You can also use refs in function components using closures. Note: You can also use inline ref callbacks even though it is not a recommended approach.
    Q20. What are forward refs?
    Ref forwarding is a feature that lets some components take a ref they receive, and pass it further down to a child.
    
      const ButtonElement = React.forwardRef((props, ref) => (
        <button ref={ref} className="CustomButton">
          {props.children}
        </button>
      ));
      
      // Create ref to the DOM button:
      const ref = React.createRef();
      <ButtonElement ref={ref}>{"Forward Ref"}</ButtonElement>;
              
    Q21. Which is preferred option with in callback refs and findDOMNode()?
    It is preferred to use callback refs over findDOMNode() API. Because findDOMNode() prevents certain improvements in React in the future.
    The legacy approach of using findDOMNode:
    
      class MyComponent extends Component {
        componentDidMount() {
          findDOMNode(this).scrollIntoView();
        }
      
        render() {
          return <div />;
        }
      }
              
    The recommended approach is:
    
      class MyComponent extends Component {
        constructor(props) {
          super(props);
          this.node = createRef();
        }
    
        componentDidMount() {
          this.node.current.scrollIntoView();
        }
      
        render() {
          return <div ref={this.node} />;
        }
      }
              
    Q22. Why are String Refs legacy?
    If you worked with React before, you might be familiar with an older API where the ref attribute is a string, like ref={'textInput'}, and the DOM node is accessed as this.refs.textInput. We advise against it because string refs have below issues, and are considered legacy. String refs were removed in React v16.
    They force React to keep track of currently executing component. This is problematic because it makes react module stateful, and thus causes weird errors when react module is duplicated in the bundle.
    They are not composable — if a library puts a ref on the passed child, the user can't put another ref on it. Callback refs are perfectly composable.
    They don't work with static analysis like Flow. Flow can't guess the magic that framework does to make the string ref appear on this.refs, as well as its type (which could be different). Callback refs are friendlier to static analysis.
    It doesn't work as most people would expect with the 'render callback' pattern (e.g. )
    
      class MyComponent extends Component {
        renderRow = (index) => {
          // This won't work. Ref will get attached to DataTable rather than MyComponent:
          return <input ref={"input-" + index} />;
      
          // This would work though! Callback refs are awesome.
          return <input ref={(input) => (this["input-" + index] = input)} />;
        };
      
        render() {
          return (
            <DataTable data={this.props.data} renderRow={this.renderRow} />
          );
        }
      }
              
    Q23. What is Virtual DOM?
    The Virtual DOM (VDOM) is an in-memory representation of Real DOM. The representation of a UI is kept in memory and synced with the 'real' DOM. It's a step that happens between the render function being called and the displaying of elements on the screen. This entire process is called reconciliation.
    Q24. How Virtual DOM works?
    The Virtual DOM works in three simple steps.
    Whenever any underlying data changes, the entire UI is re-rendered in Virtual DOM representation.
    
              
              
    Then the difference between the previous DOM representation and the new one is calculated.
    
              
              
    Once the calculations are done, the real DOM will be updated with only the things that have actually changed.
    
              
              
    Q25. What is the difference between Shadow DOM and Virtual DOM?
    The Shadow DOM is a browser technology designed primarily for scoping variables and CSS in web components. The Virtual DOM is a concept implemented by libraries in JavaScript on top of browser APIs.
    Q26. What is React Fiber?
    Fiber is the new reconciliation engine or reimplementation of core algorithm in React v16. The goal of React Fiber is to increase its suitability for areas like animation, layout, gestures, ability to pause, abort, or reuse work and assign priority to different types of updates; and new concurrency primitives.
    Q27. What is the main goal of React Fiber?
    The goal of React Fiber is to increase its suitability for areas like animation, layout, and gestures. Its headline feature is incremental rendering: the ability to split rendering work into chunks and spread it out over multiple frames.
    from documentation, Its main goals are:
    Ability to split interruptible work in chunks.
    Ability to prioritize, rebase and reuse work in progress.
    Ability to yield back and forth between parents and children to support layout in React.
    Ability to return multiple elements from render().
    Better support for error boundaries.
    Q28. What are controlled components?
    A component that controls the input elements within the forms on subsequent user input is called Controlled Component, i.e, every state mutation will have an associated handler function.
    For example, to write all the names in uppercase letters, we use handleChange as below,
    
      handleChange(event) {
        this.setState({value: event.target.value.toUpperCase()})
      }
              
    Q29. What are uncontrolled components?
    The Uncontrolled Components are the ones that store their own state internally, and you query the DOM using a ref to find its current value when you need it. This is a bit more like traditional HTML.
    In the below UserProfile component, the name input is accessed using ref.
    
      class UserProfile extends React.Component {
        constructor(props) {
          super(props);
          this.handleSubmit = this.handleSubmit.bind(this);
          this.input = React.createRef();
        }
      
        handleSubmit(event) {
          alert("A name was submitted: " + this.input.current.value);
          event.preventDefault();
        }
      
        render() {
          return (
            <form onSubmit={this.handleSubmit}>
              <label>
                {"Name:"}
                <input type="text" ref={this.input} />
              </label>
              <input type="submit" value="Submit" />
            </form>
          );
        }
      }
              
    In most cases, it's recommend to use controlled components to implement forms. In a controlled component, form data is handled by a React component. The alternative is uncontrolled components, where form data is handled by the DOM itself.
    Q30. What is the difference between createElement and cloneElement?
    JSX elements will be transpiled to React.createElement() functions to create React elements which are going to be used for the object representation of UI. Whereas cloneElement is used to clone an element and pass it new props.
    Q31. What is Lifting State Up in React?
    When several components need to share the same changing data then it is recommended to lift the shared state up to their closest common ancestor. That means if two child components share the same data from its parent, then move the state to parent instead of maintaining local state in both of the child components.
    Q32. What are the different phases of component lifecycle?
    The component lifecycle has three distinct lifecycle phases:
    Mounting: The component is ready to mount in the browser DOM. This phase covers initialization from constructor(), getDerivedStateFromProps(), render(), and componentDidMount() lifecycle methods.
    Updating: In this phase, the component gets updated in two ways, sending the new props and updating the state either from setState() or forceUpdate(). This phase covers getDerivedStateFromProps(), shouldComponentUpdate(), render(), getSnapshotBeforeUpdate() and componentDidUpdate() lifecycle methods.
    Unmounting: In this last phase, the component is not needed and gets unmounted from the browser DOM. This phase includes componentWillUnmount() lifecycle method.
    It's worth mentioning that React internally has a concept of phases when applying changes to the DOM. They are separated as follows
    Render The component will render without any side effects. This applies to Pure components and in this phase, React can pause, abort, or restart the render.
    Pre-commit Before the component actually applies the changes to the DOM, there is a moment that allows React to read from the DOM through the getSnapshotBeforeUpdate().
    Commit React works with the DOM and executes the final lifecycles respectively componentDidMount() for mounting, componentDidUpdate() for updating, and componentWillUnmount() for unmounting.
    Q33. What are the lifecycle methods of React?
    Before React 16.3
    componentWillMount: Executed before rendering and is used for App level configuration in your root component.
    componentDidMount: Executed after first rendering and here all AJAX requests, DOM or state updates, and set up event listeners should occur.
    componentWillReceiveProps: Executed when particular prop updates to trigger state transitions.
    shouldComponentUpdate: Determines if the component will be updated or not. By default it returns true. If you are sure that the component doesn't need to render after state or props are updated, you can return false value. It is a great place to improve performance as it allows you to prevent a re-render if component receives new prop.
    componentWillUpdate: Executed before re-rendering the component when there are props & state changes confirmed by shouldComponentUpdate() which returns true.
    componentDidUpdate: Mostly it is used to update the DOM in response to prop or state changes.
    componentWillUnmount: It will be used to cancel any outgoing network requests, or remove all event listeners associated with the component.
    React 16.3+
    getDerivedStateFromProps: Invoked right before calling render() and is invoked on every render. This exists for rare use cases where you need a derived state.
    componentDidMount: Executed after first rendering and where all AJAX requests, DOM or state updates, and set up event listeners should occur.
    shouldComponentUpdate: Determines if the component will be updated or not. By default, it returns true. If you are sure that the component doesn't need to render after the state or props are updated, you can return a false value. It is a great place to improve performance as it allows you to prevent a re-render if component receives a new prop.
    getSnapshotBeforeUpdate: Executed right before rendered output is committed to the DOM. Any value returned by this will be passed into componentDidUpdate(). This is useful to capture information from the DOM i.e. scroll position.
    componentDidUpdate: Mostly it is used to update the DOM in response to prop or state changes. This will not fire if shouldComponentUpdate() returns false.
    componentWillUnmount It will be used to cancel any outgoing network requests, or remove all event listeners associated with the component.
    Q34. What are Higher-Order Components?
    A higher-order component (HOC) is a function that takes a component and returns a new component. Basically, it's a pattern that is derived from React's compositional nature.
    We call them pure components because they can accept any dynamically provided child component but they won't modify or copy any behavior from their input components.
    
      const EnhancedComponent = higherOrderComponent(WrappedComponent);
              
    HOC can be used for many use cases:
    Code reuse, logic and bootstrap abstraction.
    Render hijacking.
    State abstraction and manipulation.
    Props manipulation.
    Q35. How to create props proxy for HOC component?
    You can add/edit props passed to the component using props proxy pattern like this:
    
      function HOC(WrappedComponent) {
        return class Test extends Component {
          render() {
            const newProps = {
              title: "New Header",
              footer: false,
              showFeatureX: false,
              showFeatureY: true,
            };
      
            return <WrappedComponent {...this.props} {...newProps} />;
          }
        };
      }
              
    Q36. What is context?
    Context provides a way to pass data through the component tree without having to pass props down manually at every level.
    For example, authenticated users, locale preferences, UI themes need to be accessed in the application by many components.
    
      const { Provider, Consumer } = React.createContext(defaultValue);
              
    Q37. What is children prop?
    Children is a prop (this.props.children) that allows you to pass components as data to other components, just like any other prop you use. Component tree put between component's opening and closing tag will be passed to that component as children prop.
    There are several methods available in the React API to work with this prop. These include React.Children.map, React.Children.forEach, React.Children.count, React.Children.only, React.Children.toArray.
    A simple usage of children prop looks as below,
    
      const MyDiv = React.createClass({
        render: function () {
          return <div>{this.props.children}</div>;
        },
      });
      
      ReactDOM.render(
        <MyDiv>
          <span>{"Hello"}</span>
          <span>{"World"}</span>
        </MyDiv>,
        node
      );
              
    Q38. How to write comments in React?
    The comments in React/JSX are similar to JavaScript Multiline comments but are wrapped in curly braces.
    Single-line comments:
    
      <div>
        {/* Single-line comments(In vanilla JavaScript, the single-line comments are represented by double slash(//)) */}
        {'Welcome, let's play React'}
      </div>
              
    Multi-line comments:
    
      <div>
        {/* Multi-line comments for more than
        one line */}
        {'Welcome user, let's play React'}
      </div>
              
    Q39. What is the purpose of using super constructor with props argument?
    A child class constructor cannot make use of this reference until the super() method has been called. The same applies to ES6 sub-classes as well. The main reason for passing props parameter to super() call is to access this.props in your child constructors.
    Passing props:
    
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
      
          console.log(this.props); // prints { name: 'John', age: 42 }
        }
      }
              
    Not passing props:
    
      class MyComponent extends React.Component {
        constructor(props) {
          super();
      
          console.log(this.props); // prints undefined
      
          // but props parameter is still available
          console.log(props); // prints { name: 'John', age: 42 }
        }
      
        render() {
          // no difference outside constructor
          console.log(this.props); // prints { name: 'John', age: 42 }
        }
      }
              
    The above code snippets reveals that this.props is different only within the constructor. It would be the same outside the constructor.
    Q40. What is reconciliation?
    Reconciliation is the process through which React updates the Browser DOM and makes React work faster. React use a diffing algorithm so that component updates are predictable and faster. React would first calculate the difference between the real DOM and the copy of DOM (Virtual DOM) when there's an update of components. React stores a copy of Browser DOM which is called Virtual DOM. When we make changes or add data, React creates a new Virtual DOM and compares it with the previous one. This comparison is done by Diffing Algorithm. Now React compares the Virtual DOM with Real DOM. It finds out the changed nodes and updates only the changed nodes in Real DOM leaving the rest nodes as it is. This process is called Reconciliation.
    Q41. How to set state with a dynamic key name?
    If you are using ES6 or the Babel transpiler to transform your JSX code then you can accomplish this with computed property names.
    
      handleInputChange(event) {
        this.setState({ [event.target.id]: event.target.value })
      }
              
    Q42. What would be the common mistake of function being called every time the component renders?
    You need to make sure that function is not being called while passing the function as a parameter.
    
      render() {
        // Wrong: handleClick is called instead of passed as a reference!
        return <button onClick={this.handleClick()}>{'Click Me'}</button>
      }
              
    Instead, pass the function itself without parenthesis:
    
      render() {
        // Correct: handleClick is passed as a reference!
        return <button onClick={this.handleClick}>{'Click Me'}</button>
      }
              
    Q43. Is lazy function supports named exports?
    No, currently React.lazy function supports default exports only. If you would like to import modules which are named exports, you can create an intermediate module that reexports it as the default. It also ensures that tree shaking keeps working and don’t pull unused components. Let's take a component file which exports multiple named components,
    
      // MoreComponents.js
      export const SomeComponent = /* ... */;
      export const UnusedComponent = /* ... */;
              
    and reexport MoreComponents.js components in an intermediate file IntermediateComponent.js
    
      // IntermediateComponent.js
      export { SomeComponent as default } from "./MoreComponents.js";
              
    Now you can import the module using lazy function as below,
    
      import React, { lazy } from "react";
      const SomeComponent = lazy(() => import("./IntermediateComponent.js"));
              
    Q44. Why React uses className over class attribute?
    The attribute class is a keyword in JavaScript, and JSX is an extension of JavaScript. That's the principal reason why React uses className instead of class. Pass a string as the className prop.
    
      render() {
        return <span className={'menu navigation-menu'}>{'Menu'}</span>
      }
              
    Q45. What are fragments?
    It's a common pattern or practice in React for a component to return multiple elements. Fragments let you group a list of children without adding extra nodes to the DOM. You need to use either or a shorter syntax having empty tag (<>).
    Below is the example of how to use fragment inside Story component.
    
      function Story({title, description, date}) {
        return (
            <Fragment>
              <h2>{title}</h2>
              <p>{description}</p>
              <p>{date}</p>
            </Fragment>
          );
      }
              
    It is also possible to render list of fragments inside a loop with the mandatory key attribute supplied.
    
      function StoryBook() {
        return stories.map(story =>
          <Fragment key={ story.id}>
            <h2>{story.title}</h2>
            <p>{story.description}</p>
            <p>{story.date}</p>
          </Fragment>
          );
      }
              
    Ususally you don't need to use until unless there is a need of key attribute. The usage of shorter syntax looks like below.
    
      function Story({title, description, date}) {
        return (
            <>
              <h2>{title}</h2>
              <p>{description}</p>
              <p>{date}</p>
            </>
          );
      }
              
    Q46. Why fragments are better than container divs?
    Below are the list of reasons to prefer fragments over container DOM elements,
    Fragments are a bit faster and use less memory by not creating an extra DOM node. This only has a real benefit on very large and deep trees.
    Some CSS mechanisms like Flexbox and CSS Grid have a special parent-child relationships, and adding divs in the middle makes it hard to keep the desired layout.
    The DOM Inspector is less cluttered.
    Q47. What are portals in React?
    Portal is a recommended way to render children into a DOM node that exists outside the DOM hierarchy of the parent component.
    
      ReactDOM.createPortal(child, container);
              
    The first argument is any render-able React child, such as an element, string, or fragment. The second argument is a DOM element.
    Q48. What are stateless components?
    If the behaviour of a component is independent of its state then it can be a stateless component. You can use either a function or a class for creating stateless components. But unless you need to use a lifecycle hook in your components, you should go for function components. There are a lot of benefits if you decide to use function components here; they are easy to write, understand, and test, a little faster, and you can avoid the this keyword altogether.
    Q49. What are stateful components?
    If the behaviour of a component is dependent on the state of the component then it can be termed as stateful component. These stateful components are either function components with hooks or class components.
    Let's take an example of function stateful component which update the state based on click event,
    
      import React, {useState} from 'react';
    
      const App = (props) => {
      const [count, setCount] = useState(0);
      handleIncrement() {
        setCount(count+1);
      }
    
      return (
        <>
          <button onClick={handleIncrement}>Increment</button>
          <span>Counter: {count}</span>
        </>
        )
      }
              
    Q50. How to apply validation on props in React?
    When the application is running in development mode, React will automatically check all props that we set on components to make sure they have correct type. If the type is incorrect, React will generate warning messages in the console. It's disabled in production mode due to performance impact. The mandatory props are defined with isRequired.
    The set of predefined prop types:
    
      PropTypes.number
      PropTypes.string
      PropTypes.array
      PropTypes.object
      PropTypes.func
      PropTypes.node
      PropTypes.element
      PropTypes.bool
      PropTypes.symbol
      PropTypes.any
              
    We can define propTypes for User component as below:
    
      import React from "react";
      import PropTypes from "prop-types";
    
      class User extends React.Component {
        static propTypes = {
          name: PropTypes.string.isRequired,
          age: PropTypes.number.isRequired,
        };
    
        render() {
          return (
            <>
              <h1>{'Welcome, $ {this.props.name}'}</h1>
              <h2>{'Age, $ {this.props.age}'}</h2>
            </>
          );
        }
      }
              
    Note: In React v15.5 PropTypes were moved from React.PropTypes to prop-types library.The Equivalent Functional Component
    The Equivalent Functional Component
    
      import React from "react";
      import PropTypes from "prop-types";
      
      function User({ name, age }) {
        return (
          <>
            <h1>{'Welcome, $ {name}'}</h1>
            <h2>{'Age, $ {age}'}</h2>
          </>
        );
      }
      
      User.propTypes = {
        name: PropTypes.string.isRequired,
        age: PropTypes.number.isRequired,
      };
              
    Q51. What are the advantages of React?
    Below are the list of main advantages of React,
    Increases the application's performance with Virtual DOM.
    JSX makes code easy to read and write.
    It renders both on client and server side (SSR).
    Easy to integrate with frameworks (Angular, Backbone) since it is only a view library.
    Easy to write unit and integration tests with tools such as Jest.
    Q52. What are the limitations of React?
    Apart from the advantages, there are few limitations of React too,
    React is just a view library, not a full framework.
    There is a learning curve for beginners who are new to web development.
    Integrating React into a traditional MVC framework requires some additional configuration.
    The code complexity increases with inline templating and JSX.
    Too many smaller components leading to over engineering or boilerplate.
    Q53. What are error boundaries in React v16?
    Error boundaries are components that catch JavaScript errors anywhere in their child component tree, log those errors, and display a fallback UI instead of the component tree that crashed.
    A class component becomes an error boundary if it defines a new lifecycle method called componentDidCatch(error, info) or static getDerivedStateFromError() :
    
      class ErrorBoundary extends React.Component {
        constructor(props) {
          super(props);
          this.state = { hasError: false };
        }
      
        componentDidCatch(error, info) {
          // You can also log the error to an error reporting service
          logErrorToMyService(error, info);
        }
      
        static getDerivedStateFromError(error) {
          // Update state so the next render will show the fallback UI.
          return { hasError: true };
        }
      
        render() {
          if (this.state.hasError) {
            // You can render any custom fallback UI
            return <h1>{"Something went wrong."}</h1>;
          }
          return this.props.children;
        }
      }
              
    After that use it as a regular component:
    
      <ErrorBoundary>
        <MyWidget />
      </ErrorBoundary>
              
    Q54. How are error boundaries handled in React v15?
    React v15 provided very basic support for error boundaries using unstable_handleError method. It has been renamed to componentDidCatch in React v16.
    Q55. What are the recommended ways for static type checking?
    Normally we use PropTypes library (React.PropTypes moved to a prop-types package since React v15.5) for type checking in the React applications. For large code bases, it is recommended to use static type checkers such as Flow or TypeScript, that perform type checking at compile time and provide auto-completion features.
    Q56. What is the use of react-dom package?
    The react-dom package provides DOM-specific methods that can be used at the top level of your app. Most of the components are not required to use this module. Some of the methods of this package are:
    
      render()
      hydrate()
      unmountComponentAtNode()
      findDOMNode()
      createPortal()
              
    Q57. What is the purpose of render method of react-dom?
    This method is used to render a React element into the DOM in the supplied container and return a reference to the component. If the React element was previously rendered into container, it will perform an update on it and only mutate the DOM as necessary to reflect the latest changes.
    
      ReactDOM.render(element, container, [callback])
              
    If the optional callback is provided, it will be executed after the component is rendered or updated.
    Q58. What is ReactDOMServer?
    The ReactDOMServer object enables you to render components to static markup (typically used on node server). This object is mainly used for server-side rendering (SSR). The following methods can be used in both the server and browser environments:
    renderToString()
    renderToStaticMarkup()
    For example, you generally run a Node-based web server like Express, Hapi, or Koa, and you call renderToString to render your root component to a string, which you then send as response.
    
      // using Express
      import { renderToString } from "react-dom/server";
      import MyPage from "./MyPage";
    
      app.get("/", (req, res) => {
        res.write(
          "<!DOCTYPE html><html><head><title>My Page</title></head><body>"
        );
        res.write('<div id="content">');
        res.write(renderToString(<MyPage />));
        res.write("</div></body></html>");
        res.end();
      });
              
    Q59. How to use innerHTML in React?
    The dangerouslySetInnerHTML attribute is React's replacement for using innerHTML in the browser DOM. Just like innerHTML, it is risky to use this attribute considering cross-site scripting (XSS) attacks. You just need to pass a __html object as key and HTML text as value.
    In this example MyComponent uses dangerouslySetInnerHTML attribute for setting HTML markup:
    
      function createMarkup() {
        return { __html: "First &middot; Second" };
      }
      
      function MyComponent() {
        return <div dangerouslySetInnerHTML={createMarkup()} />;
      }
              
    Q60. How to use styles in React?
    The style attribute accepts a JavaScript object with camelCased properties rather than a CSS string. This is consistent with the DOM style JavaScript property, is more efficient, and prevents XSS security holes.
    
      const divStyle = {
        color: "blue",
        backgroundImage: "url(" + imgUrl + ")",
      };
      
      function HelloWorldComponent() {
        return <div style={divStyle}>Hello World!</div>;
      }
              
    Style keys are camelCased in order to be consistent with accessing the properties on DOM nodes in JavaScript (e.g. node.style.backgroundImage).
    Q61. How events are different in React?
    Handling events in React elements has some syntactic differences:
    React event handlers are named using camelCase, rather than lowercase.
    With JSX you pass a function as the event handler, rather than a string.
    Q62. What will happen if you use setState() in constructor?
    When you use setState(), then apart from assigning to the object state React also re-renders the component and all its children. You would get error like this: Can only update a mounted or mounting component. So we need to use this.state to initialize variables inside constructor.
    Q63. What is the impact of indexes as keys?
    Keys should be stable, predictable, and unique so that React can keep track of elements.
    In the below code snippet each element's key will be based on ordering, rather than tied to the data that is being represented. This limits the optimizations that React can do.
    
      {
        todos.map((todo, index) => <Todo {...todo} key={index} />);
      }
              
    If you use element data for unique key, assuming todo.id is unique to this list and stable, React would be able to reorder elements without needing to reevaluate them as much.
    
      {
        todos.map((todo) => <Todo {...todo} key={todo.id} />);
      }
              
    Q64. Is it good to use setState() in componentWillMount() method?
    Yes, it is safe to use setState() inside componentWillMount() method. But at the same it is recommended to avoid async initialization in componentWillMount() lifecycle method. componentWillMount() is invoked immediately before mounting occurs. It is called before render(), therefore setting state in this method will not trigger a re-render. Avoid introducing any side-effects or subscriptions in this method. We need to make sure async calls for component initialization happened in componentDidMount() instead of componentWillMount().
    
      componentDidMount() {
        axios.get('api/todos')
          .then((result) => {
            this.setState({
              messages: [...result.data]
            })
          })
      }
              
    Q65. What will happen if you use props in initial state?
    If the props on the component are changed without the component being refreshed, the new prop value will never be displayed because the constructor function will never update the current state of the component. The initialization of state from props only runs when the component is first created.
    The below component won't display the updated input value:
    
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
      
          this.state = {
            records: [],
            inputValue: this.props.inputValue,
          };
        }
      
        render() {
          return <div>{this.state.inputValue}</div>;
        }
      }
              
    Using props inside render method will update the value:
    
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
      
          this.state = {
            record: [],
          };
        }
      
        render() {
          return <div>{this.props.inputValue}</div>;
        }
      }
              
    Q66. How do you conditionally render components?
    In some cases you want to render different components depending on some state. JSX does not render false or undefined, so you can use conditional short-circuiting to render a given part of your component only if a certain condition is true.
    
      const MyComponent = ({ name, address }) => (
        <div>
          <h2>{name}</h2>
          {address && <p>{address}</p>}
        </div>
      );
              
    If you need an if-else condition then use ternary operator.
    
      const MyComponent = ({ name, address }) => (
        <div>
          <h2>{name}</h2>
          {address ? <p>{address}</p> : <p>{"Address is not available"}</p>}
        </div>
      );
              
    Q67. Why we need to be careful when spreading props on DOM elements?
    When we spread props we run into the risk of adding unknown HTML attributes, which is a bad practice. Instead we can use prop destructuring with ...rest operator, so it will add only required props.For example,
    
      const ComponentA = () => (
        <ComponentB isDisplay={true} className={"componentStyle"} />
      );
      
      const ComponentB = ({ isDisplay, ...domProps }) => (
        <div {...domProps}>{"ComponentB"}</div>
      );
              
    Q68. How you use decorators in React?
    You can decorate your class components, which is the same as passing the component into a function. Decorators are flexible and readable way of modifying component functionality.
    
      @setTitle("Profile")
      class Profile extends React.Component {
        //....
      }
    
      /*
        title is a string that will be set as a document title
        WrappedComponent is what our decorator will receive when
        put directly above a component class as seen in the example above
      */
      const setTitle = (title) => (WrappedComponent) => {
        return class extends React.Component {
          componentDidMount() {
            document.title = title;
          }
    
          render() {
            return <WrappedComponent {...this.props} />;
          }
        };
      };
              
    Note: Decorators are a feature that didn't make it into ES7, but are currently a stage 2 proposal.
    Q69. How do you memoize a component?
    There are memoize libraries available which can be used on function components.
    For example moize library can memoize the component in another component.
    
      import moize from "moize";
      import Component from "./components/Component"; // this module exports a non-memoized component
    
      const MemoizedFoo = moize.react(Component);
    
      const Consumer = () => {
        <div>
          {"I will memoize the following entry:"}
          <MemoizedFoo />
        </div>;
      };
              
    Update: Since React v16.6.0, we have a React.memo. It provides a higher order component which memoizes component unless the props change. To use it, simply wrap the component using React.memo before you use it.
    
      const MemoComponent = React.memo(function MemoComponent(props) {
        /* render using props */
      });
      OR;
      export default React.memo(MyFunctionComponent);
              
    Q70. How you implement Server Side Rendering or SSR?
    React is already equipped to handle rendering on Node servers. A special version of the DOM renderer is available, which follows the same pattern as on the client side.
    
      import ReactDOMServer from "react-dom/server";
      import App from "./App";
    
      ReactDOMServer.renderToString(<App />);
              
    This method will output the regular HTML as a string, which can be then placed inside a page body as part of the server response. On the client side, React detects the pre-rendered content and seamlessly picks up where it left off.
    Q71. How to enable production mode in React?
    You should use Webpack's DefinePlugin method to set NODE_ENV to production, by which it strip out things like propType validation and extra warnings. Apart from this, if you minify the code, for example, Uglify's dead-code elimination to strip out development only code and comments, it will drastically reduce the size of your bundle.
    Q72. What is CRA and its benefits?
    The create-react-app CLI tool allows you to quickly create & run React applications with no configuration step.
    Let's create Todo App using CRA:
    
      # Installation
      $ npm install -g create-react-app
    
      # Create new project
      $ create-react-app todo-app
      $ cd todo-app
    
      # Build, test and run
      $ npm run build
      $ npm run test
      $ npm start
              
    It includes everything we need to build a React app:
    React, JSX, ES6, and Flow syntax support.
    Language extras beyond ES6 like the object spread operator.
    Autoprefixed CSS, so you don’t need -webkit- or other prefixes.
    A fast interactive unit test runner with built-in support for coverage reporting.
    A live development server that warns about common mistakes.
    A build script to bundle JS, CSS, and images for production, with hashes and sourcemaps.
    Q73. What is the lifecycle methods order in mounting?
    The lifecycle methods are called in the following order when an instance of a component is being created and inserted into the DOM.
    constructor()
    static getDerivedStateFromProps()
    render()
    componentDidMount()
    Q74. What are the lifecycle methods going to be deprecated in React v16?
    The following lifecycle methods going to be unsafe coding practices and will be more problematic with async rendering.
    componentWillMount()
    componentWillReceiveProps()
    componentWillUpdate()
    Starting with React v16.3 these methods are aliased with UNSAFE_ prefix, and the unprefixed version will be removed in React v17.
    Q75. What is the purpose of getDerivedStateFromProps() lifecycle method?
    The new static getDerivedStateFromProps() lifecycle method is invoked after a component is instantiated as well as before it is re-rendered. It can return an object to update state, or null to indicate that the new props do not require any state updates.
    
      class MyComponent extends React.Component {
        static getDerivedStateFromProps(props, state) {
          // ...
        }
      }
              
    This lifecycle method along with componentDidUpdate() covers all the use cases of componentWillReceiveProps().
    Q76. What is the purpose of getSnapshotBeforeUpdate() lifecycle method?
    The new getSnapshotBeforeUpdate() lifecycle method is called right before DOM updates. The return value from this method will be passed as the third parameter to componentDidUpdate().
    
      class MyComponent extends React.Component {
        getSnapshotBeforeUpdate(prevProps, prevState) {
          // ...
        }
      }
              
    This lifecycle method along with componentDidUpdate() covers all the use cases of componentWillUpdate().
    Q77. Do Hooks replace render props and higher order components?
    Both render props and higher-order components render only a single child but in most of the cases Hooks are a simpler way to serve this by reducing nesting in your tree.
    Q78. What is the recommended way for naming components?
    It is recommended to name the component by reference instead of using displayName.
    Using displayName for naming component:
    
      export default React.createClass({
        displayName: "TodoApp",
        // ...
      });
              
    The recommended approach:
    
      export default class TodoApp extends React.Component {
        // ...
      }
              
    also
    
      const TodoApp = () => {
        //...
      };
      export default TodoApp;
              
    Q79. What is the recommended ordering of methods in component class?
    Recommended ordering of methods from mounting to render stage:
    
      static methods
      constructor()
      getChildContext()
      componentWillMount()
      componentDidMount()
      componentWillReceiveProps()
      shouldComponentUpdate()
      componentWillUpdate()
      componentDidUpdate()
      componentWillUnmount()
      click handlers or event handlers like onClickSubmit() or onChangeDescription()
      getter methods for render like getSelectReason() or getFooterContent()
      optional render methods like renderNavigation() or renderProfilePicture()
      render()
              
    Q80. What is a switching component?
    A switching component is a component that renders one of many components. We need to use object to map prop values to components.
    For example, a switching component to display different pages based on page prop:
    
      import HomePage from "./HomePage";
      import AboutPage from "./AboutPage";
      import ServicesPage from "./ServicesPage";
      import ContactPage from "./ContactPage";
    
      const PAGES = {
        home: HomePage,
        about: AboutPage,
        services: ServicesPage,
        contact: ContactPage,
      };
    
      const Page = (props) => {
        const Handler = PAGES[props.page] || ContactPage;
    
        return <Handler {...props} />;
      };
    
      // The keys of the PAGES object can be used in the prop types to catch dev-time errors.
      Page.propTypes = {
        page: PropTypes.oneOf(Object.keys(PAGES)).isRequired,
      };
              
    Q81. Why we need to pass a function to setState()?
    The reason behind for this is that setState() is an asynchronous operation. React batches state changes for performance reasons, so the state may not change immediately after setState() is called. That means you should not rely on the current state when calling setState() since you can't be sure what that state will be. The solution is to pass a function to setState(), with the previous state as an argument. By doing this you can avoid issues with the user getting the old state value on access due to the asynchronous nature of setState().
    Let's say the initial count value is zero. After three consecutive increment operations, the value is going to be incremented only by one.
    
      // assuming this.state.count === 0
      this.setState({ count: this.state.count + 1 });
      this.setState({ count: this.state.count + 1 });
      this.setState({ count: this.state.count + 1 });
      // this.state.count === 1, not 3
              
    If we pass a function to setState(), the count gets incremented correctly.
    
      this.setState((prevState, props) => ({
        count: prevState.count + props.increment,
      }));
      // this.state.count === 3 as expected
              
    Q82. What is strict mode in React?
    React.StrictMode is a useful component for highlighting potential problems in an application. Just like , does not render any extra DOM elements. It activates additional checks and warnings for its descendants. These checks apply for development mode only.
    
      import React from "react";
    
      function ExampleApplication() {
        return (
          <div>
            <Header />
            <React.StrictMode>
              <div>
                <ComponentOne />
                <ComponentTwo />
              </div>
            </React.StrictMode>
            <Header />
          </div>
        );
      }
              
    In the example above, the strict mode checks apply to and components only.
    React.StrictMode currently helps you with:
    Identifying components with unsafe lifecycles
    Warning about legacy string ref API usage
    Warning about deprecated findDOMNode usage
    Detecting unexpected side effects
    Detecting legacy context API
    Q83. What are React Mixins?
    Mixins are a way to totally separate components to have a common functionality. Mixins should not be used and can be replaced with higher-order components or decorators.
    One of the most commonly used mixins is PureRenderMixin. You might be using it in some components to prevent unnecessary re-renders when the props and state are shallowly equal to the previous props and state:
    
      const PureRenderMixin = require("react-addons-pure-render-mixin");
    
      const Button = React.createClass({
        mixins: [PureRenderMixin],
        // ...
      });
              
    Q84. Why is isMounted() an anti-pattern and what is the proper solution?
    The primary use case for isMounted() is to avoid calling setState() after a component has been unmounted, because it will emit a warning.
    
      if (this.isMounted()) {
        this.setState({...})
      }
              
    Checking isMounted() before calling setState() does eliminate the warning, but it also defeats the purpose of the warning. Using isMounted() is a code smell because the only reason you would check is because you think you might be holding a reference after the component has unmounted.
    An optimal solution would be to find places where setState() might be called after a component has unmounted, and fix them. Such situations most commonly occur due to callbacks, when a component is waiting for some data and gets unmounted before the data arrives. Ideally, any callbacks should be canceled in componentWillUnmount(), prior to unmounting.
    Q85. What are the Pointer Events supported in React?
    Pointer Events provide a unified way of handling all input events. In the old days we had a mouse and respective event listeners to handle them but nowadays we have many devices which don't correlate to having a mouse, like phones with touch surface or pens. We need to remember that these events will only work in browsers that support the Pointer Events specification.
    The following event types are now available in React DOM:
    
      onPointerDown
      onPointerMove
      onPointerUp
      onPointerCancel
      onGotPointerCapture
      onLostPointerCapture
      onPointerEnter
      onPointerLeave
      onPointerOver
      onPointerOut
              
    Q86. Why should component names start with capital letter?
    If you are rendering your component using JSX, the name of that component has to begin with a capital letter otherwise React will throw an error as an unrecognized tag. This convention is because only HTML elements and SVG tags can begin with a lowercase letter.
    
      class SomeComponent extends Component {
        // Code goes here
      }
              
    You can define component class which name starts with lowercase letter, but when it's imported it should have capital letter. Here lowercase is fine:
    
      class myComponent extends Component {
        render() {
          return <div />;
        }
      }
              
              export default myComponent;
              
    While when imported in another file it should start with capital letter:
    
      import MyComponent from "./myComponent";
              
    What are the exceptions on React component naming?
    The component names should start with an uppercase letter but there are few exceptions to this convention. The lowercase tag names with a dot (property accessors) are still considered as valid component names. For example, the below tag can be compiled to a valid component,
    
      render() {
        return (
          <obj.component/> // 'React.createElement(obj.component)'
        )
      }
              
    Q87. Are custom DOM attributes supported in React v16?
    Yes. In the past, React used to ignore unknown DOM attributes. If you wrote JSX with an attribute that React doesn't recognize, React would just skip it.
    For example, let's take a look at the below attribute:
    
      <div mycustomattribute={"something"} />
              
    Would render an empty div to the DOM with React v15:
    
      <div />
              
    In React v16 any unknown attributes will end up in the DOM:
    
      <div mycustomattribute="something" />
              
    This is useful for supplying browser-specific non-standard attributes, trying new DOM APIs, and integrating with opinionated third-party libraries.
    Q88. What is the difference between constructor and getInitialState?
    You should initialize state in the constructor when using ES6 classes, and getInitialState() method when using React.createClass().
    Using ES6 classes:
    
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
          this.state = {
            /* initial state */
          };
        }
      }
              
    Using React.createClass():
    
      const MyComponent = React.createClass({
        getInitialState() {
          return {
            /* initial state */
          };
        },
      });
              
    Note: React.createClass() is deprecated and removed in React v16. Use plain JavaScript classes instead.
    Q89. Can you force a component to re-render without calling setState?
    By default, when your component's state or props change, your component will re-render. If your render() method depends on some other data, you can tell React that the component needs re-rendering by calling forceUpdate().
    
      component.forceUpdate(callback);
              
    It is recommended to avoid all uses of forceUpdate() and only read from this.props and this.state in render().
    Q90. What is the difference between super() and super(props) in React using ES6 classes?
    When you want to access this.props in constructor() then you should pass props to super() method.
    Using super(props):
    
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
          console.log(this.props); // { name: 'John', ... }
        }
      }
              
    Using super():
    
      class MyComponent extends React.Component {
        constructor(props) {
          super();
          console.log(this.props); // undefined
        }
      }
              
    Outside constructor() both will display same value for this.props.
    Q91. How to loop inside JSX?
    You can simply use Array.prototype.map with ES6 arrow function syntax.
    For example, the items array of objects is mapped into an array of components:
    
      <tbody>
        {items.map((item) => (
          <SomeComponent key={item.id} name={item.name} />
        ))}
      </tbody>
              
    But you can't iterate using for loop:
    
      <tbody>
        for (let i = 0; i < items.length; i++) {
          <SomeComponent key={items[i].id} name={items[i].name} />
        }
      </tbody>
              
    This is because JSX tags are transpiled into function calls, and you can't use statements inside expressions. This may change thanks to do expressions which are stage 1 proposal.
    Q92. How do you access props in attribute quotes?
    React (or JSX) doesn't support variable interpolation inside an attribute value. The below representation won't work:
    
      <img className="image" src="images/{this.props.image}" />
              
    But you can put any JS expression inside curly braces as the entire attribute value. So the below expression works:
    
      <img className="image" src={"images/" + this.props.image} />
              
    Q93. What is React proptype array with shape?
    If you want to pass an array of objects to a component with a particular shape then use React.PropTypes.shape() as an argument to React.PropTypes.arrayOf().
    
      ReactComponent.propTypes = {
        arrayWithShape: React.PropTypes.arrayOf(
          React.PropTypes.shape({
            color: React.PropTypes.string.isRequired,
            fontSize: React.PropTypes.number.isRequired,
          })
        ).isRequired,
      };
              
    Q94. How to conditionally apply class attributes?
    You shouldn't use curly braces inside quotes because it is going to be evaluated as a string.
    
      <div className="btn-panel {this.props.visible ? 'show' : 'hidden'}">
              
    Instead you need to move curly braces outside (don't forget to include spaces between class names):
    
      <div className={'btn-panel ' + (this.props.visible ? 'show' : 'hidden')}>
              
    Q95. What is the difference between React and ReactDOM?
    The react package contains React.createElement(), React.Component, React.Children, and other helpers related to elements and component classes. You can think of these as the isomorphic or universal helpers that you need to build components. The react-dom package contains ReactDOM.render(), and in react-dom/server we have server-side rendering support with ReactDOMServer.renderToString() and ReactDOMServer.renderToStaticMarkup().
    Q96. Why ReactDOM is separated from React?
    The React team worked on extracting all DOM-related features into a separate library called ReactDOM. React v0.14 is the first release in which the libraries are split. By looking at some of the packages, react-native, react-art, react-canvas, and react-three, it has become clear that the beauty and essence of React has nothing to do with browsers or the DOM.
    To build more environments that React can render to, React team planned to split the main React package into two: react and react-dom. This paves the way to writing components that can be shared between the web version of React and React Native.
    Q97. How to use React label element?
    If you try to render a element bound to a text input using the standard for attribute, then it produces HTML missing that attribute and prints a warning to the console.
    
      <label for={'user'}>{'User'}</label>
      <input type={'text'} id={'user'} />
              
    Since for is a reserved keyword in JavaScript, use htmlFor instead.
    
      <label htmlFor={'user'}>{'User'}</label>
      <input type={'text'} id={'user'} />
              
    Q98. How to combine multiple inline style objects?
    You can use spread operator in regular React:
    
      <button style={{ ...styles.panel.button, ...styles.panel.submitButton }}>
        {"Submit"}
      </button>
              
    If you're using React Native then you can use the array notation:
    
      <button style={[styles.panel.button, styles.panel.submitButton]}>
        {"Submit"}
      </button>
              
    Q99. How to re-render the view when the browser is resized?
    You can use the useState hook to manage the width and height state variables, and the useEffect hook to add and remove the resize event listener. The [] dependency array passed to useEffect ensures that the effect only runs once (on mount) and not on every re-render.
    
      import React, { useState, useEffect } from "react";
      function WindowDimensions() {
        const [dimensions, setDimensions] = useState({
          width: window.innerWidth,
          height: window.innerHeight,
        });
    
        useEffect(() => {
          function handleResize() {
            setDimensions({
              width: window.innerWidth,
              height: window.innerHeight,
            });
          }
          window.addEventListener("resize", handleResize);
          return () => window.removeEventListener("resize", handleResize);
        }, []);
    
        return (
          <span>
            {dimensions.width} x {dimensions.height}
          </span>
        );
      }
              
    Q100. What is the difference between setState() and replaceState() methods?
    When you use setState() the current and previous states are merged. replaceState() throws out the current state, and replaces it with only what you provide. Usually setState() is used unless you really need to remove all previous keys for some reason. You can also set state to false/null in setState() instead of using replaceState().
    Q101. How to listen to state changes?
    The componentDidUpdate lifecycle method will be called when state changes. You can compare provided state and props values with current state and props to determine if something meaningful changed.
    
      componentDidUpdate(object prevProps, object prevState)
              
    Note: The previous releases of ReactJS also uses componentWillUpdate(object nextProps, object nextState) for state changes. It has been deprecated in latest releases.
    Q102. What is the recommended approach of removing an array element in React state?
    The better approach is to use Array.prototype.filter() method.
    For example, let's create a removeItem() method for updating the state.
    
      removeItem(index) {
        this.setState({
          data: this.state.data.filter((item, i) => i !== index)
        })
      }
              
    Q103. Is it possible to use React without rendering HTML?
    It is possible. Below are the possible options:
    
      render() {
        return false
      }
              
    
      render() {
        return true
      }
              
    
      render() {
        return null
      }
              
    React version >=16.0.0:
    
      render() {
        return []
      }
              
    
      render() {
        return ""
      }
              
    React version >=16.2.0:
    
      render() {
        return <React.Fragment></React.Fragment>
      }
              
    
      render() {
        return <></>
      }
              
    React version >=18.0.0:
    
      render() {
        return undefined
      }
              
    Q104. How to pretty print JSON with React?
    We can use
     tag so that the formatting of the JSON.stringify() is retained:
    
      const data = { name: "John", age: 42 };
    
      class User extends React.Component {
        render() {
          return <pre>{JSON.stringify(data, null, 2)}</pre>;
        }
      }
    
      React.render(<User />, document.getElementById("container"));
              
    Q105. Why you can't update props in React?
    The React philosophy is that props should be immutable and top-down. This means that a parent can send any prop values to a child, but the child can't modify received props.
    Q106. How to focus an input element on page load?
    You can do it by creating ref for input element and using it in componentDidMount():
    
      class App extends React.Component {
        componentDidMount() {
          this.nameInput.focus();
        }
      
        render() {
          return (
            <div>
              <input defaultValue={"Won't focus"} />
              <input
                ref={(input) => (this.nameInput = input)}
                defaultValue={"Will focus"}
              />
            </div>
          );
        }
      }
      
      ReactDOM.render(<App />, document.getElementById("app"));
              
    Also in Functional component (react 16.08 and above)
    
      import React, { useEffect, useRef } from "react";
    
      const App = () => {
        const inputElRef = useRef(null);
    
        useEffect(() => {
          inputElRef.current.focus();
        }, []);
    
        return (
          <div>
            <input defaultValue={"Won't focus"} />
            <input ref={inputElRef} defaultValue={"Will focus"} />
          </div>
        );
      };
    
      ReactDOM.render(<App />, document.getElementById("app"));
              
    Q107. What are the possible ways of updating objects in state?
    Calling setState() with an object to merge with state:
    Using Object.assign() to create a copy of the object:
    
      const user = Object.assign({}, this.state.user, { age: 42 });
      this.setState({ user });
              
    Using spread operator:
    
      const user = { ...this.state.user, age: 42 };
      this.setState({ user });
              
    Calling setState() with a function:
    
      this.setState((prevState) => ({
        user: {
          ...prevState.user,
          age: 42,
        },
      }));
              
    Q108. How can we find the version of React at runtime in the browser?
    You can use React.version to get the version.
    
      const REACT_VERSION = React.version;
    
      ReactDOM.render(
        <div>{'React version: $ {REACT_VERSION}'}</div>,
        document.getElementById("app")
      );
              
    Q109. What are the approaches to include polyfills in your create-react-app?
    There are approaches to include polyfills in create-react-app,
    Manual import from core-js:
    Create a file called (something like) polyfills.js and import it into root index.js file. Run npm install core-js or yarn add core-js and import your specific required features.
    
      import "core-js/fn/array/find";
      import "core-js/fn/array/includes";
      import "core-js/fn/number/is-nan";
              
    Using Polyfill service:
    Use the polyfill.io CDN to retrieve custom, browser-specific polyfills by adding this line to index.html:
    
      <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=default,Array.prototype.includes"></script>
              
    In the above script we had to explicitly request the Array.prototype.includes feature as it is not included in the default feature set.
    Q110. How to use https instead of http in create-react-app?
    You just need to use HTTPS=true configuration. You can edit your package.json scripts section:
    
      "scripts": {
        "start": "set HTTPS=true && react-scripts start"
      }
              
    or just run set HTTPS=true && npm start
    Q111. How to avoid using relative path imports in create-react-app?
    Create a file called .env in the project root and write the import path:
    
      NODE_PATH=src/app
              
    After that restart the development server. Now you should be able to import anything inside src/app without relative paths.
    Q112. How to add Google Analytics for React Router?
    Add a listener on the history object to record each page view:
    
      history.listen(function (location) {
        window.ga("set", "page", location.pathname + location.search);
        window.ga("send", "pageview", location.pathname + location.search);
      });
              
    Q113. How to update a component every second?
    You need to use setInterval() to trigger the change, but you also need to clear the timer when the component unmounts to prevent errors and memory leaks.
    
      componentDidMount() {
        this.interval = setInterval(() => this.setState({ time: Date.now() }), 1000)
      }
      
      componentWillUnmount() {
        clearInterval(this.interval)
      }
              
    Q114. How do you apply vendor prefixes to inline styles in React?
    React does not apply vendor prefixes automatically. You need to add vendor prefixes manually.
    
      <div
        style={{
        transform: "rotate(90deg)",
        WebkitTransform: "rotate(90deg)", // note the capital 'W' here
        msTransform: "rotate(90deg)", // 'ms' is the only lowercase vendor prefix
        }}
      />
              
    Q115. How to import and export components using React and ES6?
    You should use default for exporting the components
    
      import React from "react";
      import User from "user";
    
      export default class MyProfile extends React.Component {
        render() {
          return <User type="customer">//...</User>;
        }
      }
              
    With the export specifier, the MyProfile is going to be the member and exported to this module and the same can be imported without mentioning the name in other components.
    Q116. Why is a component constructor called only once?
    React's reconciliation algorithm assumes that without any information to the contrary, if a custom component appears in the same place on subsequent renders, it's the same component as before, so reuses the previous instance rather than creating a new one.
    Q117. How to define constants in React?
    You can use ES7 static field to define constant.
    
      class MyComponent extends React.Component {
        static DEFAULT_PAGINATION = 10;
      }
              
    Q118. How to programmatically trigger click event in React?
    You could use the ref prop to acquire a reference to the underlying HTMLInputElement object through a callback, store the reference as a class property, then use that reference to later trigger a click from your event handlers using the HTMLElement.click method.
    This can be done in two steps:
    Create ref in render method:
    
      <input ref={(input) => (this.inputElement = input)} />
              
    Apply click event in your event handler:
    
      this.inputElement.click();
              
    Q119. Is it possible to use async/await in plain React?
    If you want to use async/await in React, you will need Babel and transform-async-to-generator plugin. React Native ships with Babel and a set of transforms.
    Q120. What are the common folder structures for React?
    There are two common practices for React project file structure.
    Grouping by features or routes:
    One common way to structure projects is locate CSS, JS, and tests together, grouped by feature or route.
    
      common/
      ├─ Avatar.js
      ├─ Avatar.css
      ├─ APIUtils.js
      └─ APIUtils.test.js
      feed/
      ├─ index.js
      ├─ Feed.js
      ├─ Feed.css
      ├─ FeedStory.js
      ├─ FeedStory.test.js
      └─ FeedAPI.js
      profile/
      ├─ index.js
      ├─ Profile.js
      ├─ ProfileHeader.js
      ├─ ProfileHeader.css
      └─ ProfileAPI.js
              
    Grouping by file type:
    Another popular way to structure projects is to group similar files together.
    
      api/
      ├─ APIUtils.js
      ├─ APIUtils.test.js
      ├─ ProfileAPI.js
      └─ UserAPI.js
      components/
      ├─ Avatar.js
      ├─ Avatar.css
      ├─ Feed.js
      ├─ Feed.css
      ├─ FeedStory.js
      ├─ FeedStory.test.js
      ├─ Profile.js
      ├─ ProfileHeader.js
      └─ ProfileHeader.css
              
    Q121. What are the popular packages for animation?
    React Transition Group and React Motion are popular animation packages in React ecosystem.
    Q122. What is the benefit of styles modules?
    It is recommended to avoid hard coding style values in components. Any values that are likely to be used across different UI components should be extracted into their own modules.
    For example, these styles could be extracted into a separate component:
    
      export const colors = {
        white,
        black,
        blue,
      };
      
      export const space = [0, 8, 16, 32, 64];
              
    And then imported individually in other components:
    
      import { space, colors } from "./styles";
              
    Q123. What are the popular React-specific linters?
    ESLint is a popular JavaScript linter. There are plugins available that analyse specific code styles. One of the most common for React is an npm package called eslint-plugin-react. By default, it will check a number of best practices, with rules checking things from keys in iterators to a complete set of prop types.
    Another popular plugin is eslint-plugin-jsx-a11y, which will help fix common issues with accessibility. As JSX offers slightly different syntax to regular HTML, issues with alt text and tabindex, for example, will not be picked up by regular plugins.
    Q124. How to make AJAX call and in which component lifecycle methods should I make an AJAX call?
    You can use AJAX libraries such as Axios, jQuery AJAX, and the browser built-in fetch. You should fetch data in the componentDidMount() lifecycle method. This is so you can use setState() to update your component when the data is retrieved.
    For example, the employees list fetched from API and set local state:
    
      class MyComponent extends React.Component {
        constructor(props) {
          super(props);
          this.state = {
            employees: [],
            error: null,
          };
        }
      
        componentDidMount() {
          fetch("https://api.example.com/items")
            .then((res) => res.json())
            .then(
              (result) => {
                this.setState({
                  employees: result.employees,
                });
              },
              (error) => {
                this.setState({ error });
              }
            );
        }
      
        render() {
          const { error, employees } = this.state;
          if (error) {
            return <div>Error: {error.message}</div>;
          } else {
            return (
              <ul>
                {employees.map((employee) => (
                  <li key={employee.name}>
                    {employee.name}-{employee.experience}
                  </li>
                ))}
              </ul>
            );
          }
        }
      }
              
    Q125. What are render props?
    Render Props is a simple technique for sharing code between components using a prop whose value is a function. The below component uses render prop which returns a React element.
    
      <DataProvider render={(data) => <h1>{'Hello $ {data.target}'}</h1>} />
              
    Libraries such as React Router and DownShift are using this pattern.
    Q126. What is React Router?
    React Router is a powerful routing library built on top of React that helps you add new screens and flows to your application incredibly quickly, all while keeping the URL in sync with what's being displayed on the page.
    Q127. How React Router is different from history library?
    React Router is a wrapper around the history library which handles interaction with the browser's window.history with its browser and hash histories. It also provides memory history which is useful for environments that don't have global history, such as mobile app development (React Native) and unit testing with Node.
    Q128. What are the <Router> components of React Router v4?
    React Router v4 provides below 3 components:
    <BrowserRouter>
    <HashRouter>
    <MemoryRouter>
    The above components will create browser, hash, and memory history instances. React Router v4 makes the properties and methods of the history instance associated with your router available through the context in the router object.
    Q129. What is the purpose of push() and replace() methods of history?
    A history instance has two methods for navigation purpose.
    push()
    replace()
    If you think of the history as an array of visited locations, push() will add a new location to the array and replace() will replace the current location in the array with the new one.
    Q130. How do you programmatically navigate using React Router v4?
    There are three different ways to achieve programmatic routing/navigation within components.
    Using the withRouter() higher-order function:
    The withRouter() higher-order function will inject the history object as a prop of the component. This object provides push() and replace() methods to avoid the usage of context.
    
      import { withRouter } from "react-router-dom"; // this also works with 'react-router-native'
    
      const Button = withRouter(({ history }) => (
        <button
          type="button"
          onClick={() => {
            history.push("/new-location");
          }}
        >
          {"Click Me!"}
        </button>
      ));
              
    Using component and render props pattern:
    The component passes the same props as withRouter(), so you will be able to access the history methods through the history prop.
    
      import { Route } from "react-router-dom";
    
      const Button = () => (
        <Route
          render={({ history }) => (
            <button
              type="button"
              onClick={() => {
                history.push("/new-location");
              }}
            >
              {"Click Me!"}
            </button>
          )}
        />
      );
              
    Using context:
    This option is not recommended and treated as unstable API.
    
      const Button = (props, context) => (
        <button
          type="button"
          onClick={() => {
            context.history.push("/new-location");
          }}
        >
          {"Click Me!"}
        </button>
      );
      
      Button.contextTypes = {
        history: React.PropTypes.shape({
          push: React.PropTypes.func.isRequired,
        }),
      };
              
    Q131. How to get query parameters in React Router v4?
    The ability to parse query strings was taken out of React Router v4 because there have been user requests over the years to support different implementation. So the decision has been given to users to choose the implementation they like. The recommended approach is to use query strings library.
    
      const queryString = require("query-string");
      const parsed = queryString.parse(props.location.search);
              
    You can also use URLSearchParams if you want something native:
    
      const params = new URLSearchParams(props.location.search);
      const foo = params.get("name");
              
    You should use a polyfill for IE11.
    Q132. Why you get 'Router may have only one child element' warning?
    You have to wrap your Route's in a block because is unique in that it renders a route exclusively.
    At first you need to add Switch to your imports:
    
      import { Switch, Router, Route } from "react-router";
              
    Then define the routes within block:
    
      <Router>
        <Switch>
          <Route {/* ... */} />
          <Route {/* ... */} />
        </Switch>
      </Router>
              
    Q133. How to pass params to history.push method in React Router v4?
    While navigating you can pass props to the history object:
    
      this.props.history.push({
        pathname: "/template",
        search: "?name=sudheer",
        state: { detail: response.data },
      });
              
    The search property is used to pass query params in push() method.
    Q134. How to implement default or NotFound page?
    A renders the first child that matches. A with no path always matches. So you just need to simply drop path attribute as below
    
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/user" component={User} />
        <Route component={NotFound} />
      </Switch>
              
    Q135. How to get history on React Router v4?
    Below are the list of steps to get history object on React Router v4,
    Create a module that exports a history object and import this module across the project.
    For example, create history.js file:
    
      import { createBrowserHistory } from "history";
    
      export default createBrowserHistory({
        /* pass a configuration object here if needed */
      });
              
    You should use the component instead of built-in routers. Import the above history.js inside index.js file:
    
      import { Router } from "react-router-dom";
      import history from "./history";
      import App from "./App";
    
      ReactDOM.render(
        <Router history={history}>
          <App />
        </Router>,
        holder
      );
              
    You can also use push method of history object similar to built-in history object:
    
      // some-other-file.js
      import history from "./history";
    
      history.push("/go-here");
              
    Q136. How to perform automatic redirect after login?
    The react-router package provides component in React Router. Rendering a will navigate to a new location. Like server-side redirects, the new location will override the current location in the history stack.
    
      import React, { Component } from "react";
      import { Redirect } from "react-router";
    
      export default class LoginComponent extends Component {
        render() {
          if (this.state.isLoggedIn === true) {
            return <Redirect to="/your/redirect/page" />;
          } else {
            return <div>{"Login Please"}</div>;
          }
        }
      }
              
    Q137. What is React Intl?
    The React Intl library makes internationalization in React straightforward, with off-the-shelf components and an API that can handle everything from formatting strings, dates, and numbers, to pluralization. React Intl is part of FormatJS which provides bindings to React via its components and API.
    Q138. What are the main features of React Intl?
    Below are the main features of React Intl,
    Display numbers with separators.
    Display dates and times correctly.
    Display dates relative to 'now'.
    Pluralize labels in strings.
    Support for 150+ languages.
    Runs in the browser and Node.
    Built on standards.
    Q139. What are the two ways of formatting in React Intl?
    The library provides two ways to format strings, numbers, and dates:
    Using react components:
    
      <FormattedMessage
        id={"account"}
        defaultMessage={"The amount is less than minimum balance."}
      />
              
    Using an API:
    
      const messages = defineMessages({
        accountMessage: {
          id: "account",
          defaultMessage: "The amount is less than minimum balance.",
        },
      });
      
      formatMessage(messages.accountMessage);
              
    Q140. How to use &lt;FormattedMessage> as placeholder using React Intl?
    The components from react-intl return elements, not plain text, so they can't be used for placeholders, alt text, etc. In that case, you should use lower level API formatMessage(). You can inject the intl object into your component using injectIntl() higher-order component and then format the message using formatMessage() available on that object.
    
      import React from "react";
      import { injectIntl, intlShape } from "react-intl";
    
      const MyComponent = ({ intl }) => {
        const placeholder = intl.formatMessage({ id: "messageId" });
        return <input placeholder={placeholder} />;
      };
    
      MyComponent.propTypes = {
        intl: intlShape.isRequired,
      };
    
      export default injectIntl(MyComponent);
              
    Q141. How to access current locale with React Intl?
    You can get the current locale in any component of your application using injectIntl():
    
      import { injectIntl, intlShape } from "react-intl";
    
      const MyComponent = ({ intl }) => (
        <div>{'The current locale is $ {intl.locale}'}</div>
      );
    
      MyComponent.propTypes = {
        intl: intlShape.isRequired,
      };
    
      export default injectIntl(MyComponent);
              
    Q142. How to format date using React Intl?
    The injectIntl() higher-order component will give you access to the formatDate() method via the props in your component. The method is used internally by instances of FormattedDate and it returns the string representation of the formatted date.
    
      import { injectIntl, intlShape } from "react-intl";
    
      const stringDate = this.props.intl.formatDate(date, {
        year: "numeric",
        month: "numeric",
        day: "numeric",
      });
    
      const MyComponent = ({ intl }) => (
        <div>{'The formatted date is $ {stringDate}'}</div>
      );
    
      MyComponent.propTypes = {
        intl: intlShape.isRequired,
      };
    
      export default injectIntl(MyComponent);
              
    Q143. What is Shallow Renderer in React testing?
    Shallow rendering is useful for writing unit test cases in React. It lets you render a component one level deep and assert facts about what its render method returns, without worrying about the behavior of child components, which are not instantiated or rendered.
    For example, if you have the following component:
    
      function MyComponent() {
        return (
          <div>
            <span className={"heading"}>{"Title"}</span>
            <span className={"description"}>{"Description"}</span>
          </div>
        );
      }
              
    Then you can assert as follows:
    
      import ShallowRenderer from "react-test-renderer/shallow";
    
      // in your test
      const renderer = new ShallowRenderer();
      renderer.render(<MyComponent />);
    
      const result = renderer.getRenderOutput();
    
      expect(result.type).toBe("div");
      expect(result.props.children).toEqual([
        <span className={"heading"}>{"Title"}</span>,
        <span className={"description"}>{"Description"}</span>,
      ]);
              
    Q144. What is TestRenderer package in React?
    This package provides a renderer that can be used to render components to pure JavaScript objects, without depending on the DOM or a native mobile environment. This package makes it easy to grab a snapshot of the platform view hierarchy (similar to a DOM tree) rendered by a ReactDOM or React Native without using a browser or jsdom.
    
      import TestRenderer from "react-test-renderer";
    
      const Link = ({ page, children }) => <a href={page}>{children}</a>;
    
      const testRenderer = TestRenderer.create(
        <Link page={"https://www.facebook.com/"}>{"Facebook"}</Link>
      );
    
      console.log(testRenderer.toJSON());
      // {
      //   type: 'a',
      //   props: { href: 'https://www.facebook.com/' },
      //   children: [ 'Facebook' ]
      // }
              
    Q145. What is the purpose of ReactTestUtils package?
    ReactTestUtils are provided in the with-addons package and allow you to perform actions against a simulated DOM for the purpose of unit testing.
    Q146. What is Jest?
    Jest is a JavaScript unit testing framework created by Facebook based on Jasmine and provides automated mock creation and a jsdom environment. It's often used for testing components.
    Q147. What are the advantages of Jest over Jasmine?
    There are couple of advantages compared to Jasmine:
    Automatically finds tests to execute in your source code.
    Automatically mocks dependencies when running your tests.
    Allows you to test asynchronous code synchronously.
    Runs your tests with a fake DOM implementation (via jsdom) so that your tests can be run on the command line.
    Runs tests in parallel processes so that they finish sooner.
    Q148. Give a simple example of Jest test case
    Let's write a test for a function that adds two numbers in sum.js file:
    
      const sum = (a, b) => a + b;
    
      export default sum;
              
    Create a file named sum.test.js which contains actual test:
    
      import sum from "./sum";
    
      test("adds 1 + 2 to equal 3", () => {
        expect(sum(1, 2)).toBe(3);
      });
              
    And then add the following section to your package.json:
    
      {
        "scripts": {
          "test": "jest"
        }
      }
              
    Finally, run yarn test or npm test and Jest will print a result:
    
      $ yarn test
      PASS ./sum.test.js
      ✓ adds 1 + 2 to equal 3 (2ms)
              
    Q149. What is flux?
    Flux is an application design paradigm used as a replacement for the more traditional MVC pattern. It is not a framework or a library but a new kind of architecture that complements React and the concept of Unidirectional Data Flow. Facebook uses this pattern internally when working with React.
    Q150. What is Redux?
    Redux is a predictable state container for JavaScript apps based on the Flux design pattern. Redux can be used together with React, or with any other view library. It is tiny (about 2kB) and has no dependencies.
    Q151. What are the core principles of Redux?
    Redux follows three fundamental principles:
    Single source of truth: The state of your whole application is stored in an object tree within a single store. The single state tree makes it easier to keep track of changes over time and debug or inspect the application.
    State is read-only: The only way to change the state is to emit an action, an object describing what happened. This ensures that neither the views nor the network callbacks will ever write directly to the state.
    Changes are made with pure functions: To specify how the state tree is transformed by actions, you write reducers. Reducers are just pure functions that take the previous state and an action as parameters, and return the next state.
    Q152. What are the downsides of Redux compared to Flux?
    Instead of saying downsides we can say that there are few compromises of using Redux over Flux. Those are as follows:
    You will need to learn to avoid mutations: Flux is un-opinionated about mutating data, but Redux doesn't like mutations and many packages complementary to Redux assume you never mutate the state. You can enforce this with dev-only packages like redux-immutable-state-invariant, Immutable.js, or instructing your team to write non-mutating code.
    You're going to have to carefully pick your packages: While Flux explicitly doesn't try to solve problems such as undo/redo, persistence, or forms, Redux has extension points such as middleware and store enhancers, and it has spawned a rich ecosystem.
    There is no nice Flow integration yet: Flux currently lets you do very impressive static type checks which Redux doesn't support yet.
    Q153. What is the difference between mapStateToProps() and mapDispatchToProps()?
    mapStateToProps() is a utility which helps your component get updated state (which is updated by some other components):
    
      const mapStateToProps = (state) => {
        return {
          todos: getVisibleTodos(state.todos, state.visibilityFilter),
        };
      };
              
    mapDispatchToProps() is a utility which will help your component to fire an action event (dispatching action which may cause change of application state):
    
      const mapDispatchToProps = (dispatch) => {
        return {
          onTodoClick: (id) => {
            dispatch(toggleTodo(id));
          },
        };
      };
              
    It is recommended to always use the “object shorthand” form for the mapDispatchToProps.
    Redux wraps it in another function that looks like (…args) => dispatch(onTodoClick(…args)), and pass that wrapper function as a prop to your component.
    
      const mapDispatchToProps = {
        onTodoClick,
      };
              
    Q154. Can I dispatch an action in reducer?
    Dispatching an action within a reducer is an anti-pattern. Your reducer should be without side effects, simply digesting the action payload and returning a new state object. Adding listeners and dispatching actions within the reducer can lead to chained actions and other side effects.
    Q155. How to access Redux store outside a component?
    You just need to export the store from the module where it created with createStore(). Also, it shouldn't pollute the global window object.
    
      store = createStore(myReducer);
    
      export default store;
              
    Q156. What are the drawbacks of MVW pattern?
    DOM manipulation is very expensive which causes applications to behave slow and inefficient.
    Due to circular dependencies, a complicated model was created around models and views.
    Lot of data changes happens for collaborative applications(like Google Docs).
    No way to do undo (travel back in time) easily without adding so much extra code.
    Q157. Are there any similarities between Redux and RxJS?
    These libraries are very different for very different purposes, but there are some vague similarities.
    Redux is a tool for managing state throughout the application. It is usually used as an architecture for UIs. Think of it as an alternative to (half of) Angular. RxJS is a reactive programming library. It is usually used as a tool to accomplish asynchronous tasks in JavaScript. Think of it as an alternative to Promises. Redux uses the Reactive paradigm because the Store is reactive. The Store observes actions from a distance, and changes itself. RxJS also uses the Reactive paradigm, but instead of being an architecture, it gives you basic building blocks, Observables, to accomplish this pattern.
    Q158. How to dispatch an action on load?
    You can dispatch an action in componentDidMount() method and in render() method you can verify the data.
    
      class App extends Component {
        componentDidMount() {
          this.props.fetchData();
        }
      
        render() {
          return this.props.isLoaded ? (
            <div>{"Loaded"}</div>
          ) : (
            <div>{"Not Loaded"}</div>
          );
        }
      }
      
      const mapStateToProps = (state) => ({
        isLoaded: state.isLoaded,
      });
      
      const mapDispatchToProps = { fetchData };
      
      export default connect(mapStateToProps, mapDispatchToProps)(App);
              
    Q159. How to use connect() from React Redux?
    You need to follow two steps to use your store in your container:
    Use mapStateToProps(): It maps the state variables from your store to the props that you specify.
    Connect the above props to your container: The object returned by the mapStateToProps function is connected to the container. You can import connect() from react-redux.
    
      import React from "react";
      import { connect } from "react-redux";
    
      class App extends React.Component {
        render() {
          return <div>{this.props.containerData}</div>;
        }
      }
    
      function mapStateToProps(state) {
        return { containerData: state.data };
      }
    
      export default connect(mapStateToProps)(App);
              
    Q160. How to reset state in Redux?
    You need to write a root reducer in your application which delegate handling the action to the reducer generated by combineReducers().
    For example, let us take rootReducer() to return the initial state after USER_LOGOUT action. As we know, reducers are supposed to return the initial state when they are called with undefined as the first argument, no matter the action.
    
      const appReducer = combineReducers({
        /* your app's top-level reducers */
      });
      
      const rootReducer = (state, action) => {
        if (action.type === "USER_LOGOUT") {
          state = undefined;
        }
      
        return appReducer(state, action);
      };
              
    In case of using redux-persist, you may also need to clean your storage. redux-persist keeps a copy of your state in a storage engine. First, you need to import the appropriate storage engine and then, to parse the state before setting it to undefined and clean each storage state key.
    
      const appReducer = combineReducers({
        /* your app's top-level reducers */
      });
      
      const rootReducer = (state, action) => {
        if (action.type === "USER_LOGOUT") {
          Object.keys(state).forEach((key) => {
            storage.removeItem('persist:$ {key}');
          });
      
          state = undefined;
        }
      
        return appReducer(state, action);
      };
              
    Q161. Whats the purpose of at symbol in the Redux connect decorator?
    The @ symbol is in fact a JavaScript expression used to signify decorators. Decorators make it possible to annotate and modify classes and properties at design time.
    Let's take an example setting up Redux without and with a decorator.
    Without decorator:
    
      import React from "react";
      import * as actionCreators from "./actionCreators";
      import { bindActionCreators } from "redux";
      import { connect } from "react-redux";
    
      function mapStateToProps(state) {
        return { todos: state.todos };
      }
    
      function mapDispatchToProps(dispatch) {
        return { actions: bindActionCreators(actionCreators, dispatch) };
      }
    
      class MyApp extends React.Component {
        // ...define your main app here
      }
    
      export default connect(mapStateToProps, mapDispatchToProps)(MyApp);
              
    With decorator:
    
      import React from "react";
      import * as actionCreators from "./actionCreators";
      import { bindActionCreators } from "redux";
      import { connect } from "react-redux";
    
      function mapStateToProps(state) {
        return { todos: state.todos };
      }
    
      function mapDispatchToProps(dispatch) {
        return { actions: bindActionCreators(actionCreators, dispatch) };
      }
    
      @connect(mapStateToProps, mapDispatchToProps)
      export default class MyApp extends React.Component {
        // ...define your main app here
      }
              
    The above examples are almost similar except the usage of decorator. The decorator syntax isn't built into any JavaScript runtimes yet, and is still experimental and subject to change. You can use babel for the decorators support.
    Q162. What is the difference between React context and React Redux?
    You can use Context in your application directly and is going to be great for passing down data to deeply nested components which what it was designed for.
    Whereas Redux is much more powerful and provides a large number of features that the Context API doesn't provide. Also, React Redux uses context internally but it doesn't expose this fact in the public API.
    Q163. Why are Redux state functions called reducers?
    Reducers always return the accumulation of the state (based on all previous and current actions). Therefore, they act as a reducer of state. Each time a Redux reducer is called, the state and action are passed as parameters. This state is then reduced (or accumulated) based on the action, and then the next state is returned. You could reduce a collection of actions and an initial state (of the store) on which to perform these actions to get the resulting final state.
    Q164. How to make AJAX request in Redux?
    You can use redux-thunk middleware which allows you to define async actions.
    Let's take an example of fetching specific account as an AJAX call using fetch API:
    
      export function fetchAccount(id) {
        return (dispatch) => {
          dispatch(setLoadingAccountState()); // Show a loading spinner
          fetch('/account/$ {id}', (response) => {
            dispatch(doneFetchingAccount()); // Hide loading spinner
            if (response.status === 200) {
              dispatch(setAccount(response.json)); // Use a normal function to set the received state
            } else {
              dispatch(someError);
            }
          });
        };
      }
      
      function setAccount(data) {
        return { type: "SET_Account", data: data };
      }
              
    Q165. Should I keep all component's state in Redux store?
    Keep your data in the Redux store, and the UI related state internally in the component.
    Q166. What is the proper way to access Redux store?
    The best way to access your store in a component is to use the connect() function, that creates a new component that wraps around your existing one. This pattern is called Higher-Order Components, and is generally the preferred way of extending a component's functionality in React. This allows you to map state and action creators to your component, and have them passed in automatically as your store updates.
    Let's take an example of component using connect:
    
      import { connect } from "react-redux";
      import { setVisibilityFilter } from "../actions";
      import Link from "../components/Link";
    
      const mapStateToProps = (state, ownProps) => ({
        active: ownProps.filter === state.visibilityFilter,
      });
    
      const mapDispatchToProps = (dispatch, ownProps) => ({
        onClick: () => dispatch(setVisibilityFilter(ownProps.filter)),
      });
    
      const FilterLink = connect(mapStateToProps, mapDispatchToProps)(Link);
    
      export default FilterLink;
              
    Due to it having quite a few performance optimizations and generally being less likely to cause bugs, the Redux developers almost always recommend using connect() over accessing the store directly (using context API).
    
      class MyComponent {
        someMethod() {
          doSomethingWith(this.context.store);
        }
      }
              
    Q167. What is the difference between component and container in React Redux?
    Component is a class or function component that describes the presentational part of your application.
    Container is an informal term for a component that is connected to a Redux store. Containers subscribe to Redux state updates and dispatch actions, and they usually don't render DOM elements; they delegate rendering to presentational child components.
    Q168. What is the purpose of the constants in Redux?
    Constants allows you to easily find all usages of that specific functionality across the project when you use an IDE. It also prevents you from introducing silly bugs caused by typos – in which case, you will get a ReferenceError immediately.
    Normally we will save them in a single file (constants.js or actionTypes.js).
    
      export const ADD_TODO = "ADD_TODO";
      export const DELETE_TODO = "DELETE_TODO";
      export const EDIT_TODO = "EDIT_TODO";
      export const COMPLETE_TODO = "COMPLETE_TODO";
      export const COMPLETE_ALL = "COMPLETE_ALL";
      export const CLEAR_COMPLETED = "CLEAR_COMPLETED";
              
    In Redux, you use them in two places
    During action creation: Let's take actions.js:
    
      import { ADD_TODO } from "./actionTypes";
    
      export function addTodo(text) {
        return { type: ADD_TODO, text };
      }
              
    In reducers:
    Let's create reducer.js:
    
      import { ADD_TODO } from "./actionTypes";
    
      export default (state = [], action) => {
      switch (action.type) {
        case ADD_TODO:
          return [
            ...state,
            {
              text: action.text,
              completed: false,
            },
          ];
        default:
          return state;
      }
      };
              
    Q169. What are the different ways to write mapDispatchToProps()?
    There are a few ways of binding action creators to dispatch() in mapDispatchToProps().
    Below are the possible options:
    
      const mapDispatchToProps = (dispatch) => ({
        action: () => dispatch(action()),
      });
              
    
      const mapDispatchToProps = (dispatch) => ({
        action: bindActionCreators(action, dispatch),
      });
              
    
      const mapDispatchToProps = { action };
              
    The third option is just a shorthand for the first one.
    Q170. What is the use of the ownProps parameter in mapStateToProps() and mapDispatchToProps()?
    If the ownProps parameter is specified, React Redux will pass the props that were passed to the component into your connect functions. So, if you use a connected component:
    
      import ConnectedComponent from "./containers/ConnectedComponent";
    
      <ConnectedComponent user={"john"} />;
              
    The ownProps inside your mapStateToProps() and mapDispatchToProps() functions will be an object:
    
      {
        user: "john";
      }
              
    You can use this object to decide what to return from those functions.
    Q171. How to structure Redux top level directories?
    Most of the applications has several top-level directories as below:
    Components: Used for dumb components unaware of Redux.
    Containers: Used for smart components connected to Redux.
    Actions: Used for all action creators, where file names correspond to part of the app.
    Reducers: Used for all reducers, where files name correspond to state key.
    Store: Used for store initialization.
    This structure works well for small and medium size apps.
    Q172. What is redux-saga?
    redux-saga is a library that aims to make side effects (asynchronous things like data fetching and impure things like accessing the browser cache) in React/Redux applications easier and better.
    It is available in NPM:
    
      $ npm install --save redux-saga
              
    Q173. What is the mental model of redux-saga?
    Saga is like a separate thread in your application, that's solely responsible for side effects. redux-saga is a redux middleware, which means this thread can be started, paused and cancelled from the main application with normal Redux actions, it has access to the full Redux application state and it can dispatch Redux actions as well.
    Q174. What are the differences between call() and put() in redux-saga?
    Both call() and put() are effect creator functions. call() function is used to create effect description, which instructs middleware to call the promise. put() function creates an effect, which instructs middleware to dispatch an action to the store.
    Let's take example of how these effects work for fetching particular user data.
    
      function* fetchUserSaga(action) {
        // 'call' function accepts rest arguments, which will be passed to 'api.fetchUser' function.
        // Instructing middleware to call promise, it resolved value will be assigned to 'userData' variable
        const userData = yield call(api.fetchUser, action.userId);
      
        // Instructing middleware to dispatch corresponding action.
        yield put({
          type: "FETCH_USER_SUCCESS",
          userData,
        });
      }
              
    Q175. What is Redux Thunk?
    Redux Thunk middleware allows you to write action creators that return a function instead of an action. The thunk can be used to delay the dispatch of an action, or to dispatch only if a certain condition is met. The inner function receives the store methods dispatch() and getState() as parameters.
    Q176. What are the differences between redux-saga and redux-thunk?
    Both Redux Thunk and Redux Saga take care of dealing with side effects. In most of the scenarios, Thunk uses Promises to deal with them, whereas Saga uses Generators. Thunk is simple to use and Promises are familiar to many developers, Sagas/Generators are more powerful but you will need to learn them. But both middleware can coexist, so you can start with Thunks and introduce Sagas when/if you need them.
    Q177. What is Redux DevTools?
    Redux DevTools is a live-editing time travel environment for Redux with hot reloading, action replay, and customizable UI. If you don't want to bother with installing Redux DevTools and integrating it into your project, consider using Redux DevTools Extension for Chrome and Firefox.
    Q178. What are the features of Redux DevTools?
    Some of the main features of Redux DevTools are below,
    Lets you inspect every state and action payload.
    Lets you go back in time by cancelling actions.
    If you change the reducer code, each staged action will be re-evaluated.
    If the reducers throw, you will see during which action this happened, and what the error was.
    With persistState() store enhancer, you can persist debug sessions across page reloads.
    Q179. What are Redux selectors and why to use them?
    Selectors are functions that take Redux state as an argument and return some data to pass to the component.
    For example, to get user details from the state:
    
      const getUserData = (state) => state.user.data;
              
    These selectors have two main benefits,
    The selector can compute derived data, allowing Redux to store the minimal possible state
    The selector is not recomputed unless one of its arguments changes
    Q180. What is Redux Form?
    Redux Form works with React and Redux to enable a form in React to use Redux to store all of its state. Redux Form can be used with raw HTML5 inputs, but it also works very well with common UI frameworks like Material UI, React Widgets and React Bootstrap.
    Q181. What are the main features of Redux Form?
    Some of the main features of Redux Form are:
    Validation (sync/async) and submission.
    Field values persistence via Redux store.
    Formatting, parsing and normalization of field values.
    Q182. How to add multiple middlewares to Redux?
    You can use applyMiddleware().
    For example, you can add redux-thunk and logger passing them as arguments to applyMiddleware():
    
      import { createStore, applyMiddleware } from "redux";
      const createStoreWithMiddleware = applyMiddleware(
        ReduxThunk,
        logger
      )(createStore);
              
    Q183. How to set initial state in Redux?
    You need to pass initial state as second argument to createStore:
    
      const rootReducer = combineReducers({
        todos: todos,
        visibilityFilter: visibilityFilter,
      });
      
      const initialState = {
        todos: [{ id: 123, name: "example", completed: false }],
      };
      
      const store = createStore(rootReducer, initialState);
              
    Q184. How Relay is different from Redux?
    Relay is similar to Redux in that they both use a single store. The main difference is that relay only manages state originated from the server, and all access to the state is used via GraphQL queries (for reading data) and mutations (for changing data). Relay caches the data for you and optimizes data fetching for you, by fetching only changed data and nothing more.
    Q185. What is an action in Redux?
    Actions are plain JavaScript objects or payloads of information that send data from your application to your store. They are the only source of information for the store. Actions must have a type property that indicates the type of action being performed.
    For example, let's take an action which represents adding a new todo item:
    
      {
        type: ADD_TODO,
        text: 'Add todo item'
      }
              
    Q186. What is the difference between React Native and React?
    React is a JavaScript library, supporting both front end web and being run on the server, for building user interfaces and web applications.
    React Native is a mobile framework that compiles to native app components, allowing you to build native mobile applications (iOS, Android, and Windows) in JavaScript that allows you to use React to build your components, and implements React under the hood.
    Q187. How to test React Native apps?
    React Native can be tested only in mobile simulators like iOS and Android. You can run the app in your mobile using expo app (https://expo.io) Where it syncs using QR code, your mobile and computer should be in same wireless network.
    Q188. How to do logging in React Native?
    You can use console.log, console.warn, etc. As of React Native v0.29 you can simply run the following to see logs in the console:
    
      $ react-native log-ios
      $ react-native log-android
              
    Q189. How to debug your React Native?
    Follow the below steps to debug React Native app:
    Run your application in the iOS simulator.
    Press Command + D and a webpage should open up at http://localhost:8081/debugger-ui.
    Enable Pause On Caught Exceptions for a better debugging experience.
    Press Command + Option + I to open the Chrome Developer tools, or open it via View -> Developer -> Developer Tools.
    You should now be able to debug as you normally would.
    Q190. What is reselect and how it works?
    Reselect is a selector library (for Redux) which uses memoization concept. It was originally written to compute derived data from Redux-like applications state, but it can't be tied to any architecture or library.
    Reselect keeps a copy of the last inputs/outputs of the last call, and recomputes the result only if one of the inputs changes. If the the same inputs are provided twice in a row, Reselect returns the cached output. It's memoization and cache are fully customizable.
    Q191. What is Flow?
    Flow is a static type checker designed to find type errors in JavaScript. Flow types can express much more fine-grained distinctions than traditional type systems. For example, Flow helps you catch errors involving null, unlike most type systems.
    Q192. What is the difference between Flow and PropTypes?
    Flow is a static analysis tool (static checker) which uses a superset of the language, allowing you to add type annotations to all of your code and catch an entire class of bugs at compile time.
    PropTypes is a basic type checker (runtime checker) which has been patched onto React. It can't check anything other than the types of the props being passed to a given component. If you want more flexible typechecking for your entire project Flow/TypeScript are appropriate choices.
    Q193. How to use Font Awesome icons in React?
    The below steps followed to include Font Awesome in React:
    Install font-awesome:
    
      $ npm install --save font-awesome
              
    Import font-awesome in your index.js file:
    
      import "font-awesome/css/font-awesome.min.css";
              
    Add Font Awesome classes in className:
    
      render() {
        return <div><i className={'fa fa-spinner'} /></div>
      }
              
    Q194. What is React Dev Tools?
    React Developer Tools let you inspect the component hierarchy, including component props and state. It exists both as a browser extension (for Chrome and Firefox), and as a standalone app (works with other environments including Safari, IE, and React Native).
    The official extensions available for different browsers or environments.
    Chrome extension
    Firefox extension
    Standalone app (Safari, React Native, etc)
    Q195. Why is DevTools not loading in Chrome for local files?
    If you opened a local HTML file in your browser (file://...) then you must first open Chrome Extensions and check Allow access to file URLs.
    Q196. How to use Polymer in React?
    You need to follow below steps to use Polymer in React,
    Create a Polymer element:
    
      <link
        rel="import"
        href="../../bower_components/polymer/polymer.html"
      />;
      Polymer({
        is: "calendar-element",
        ready: function () {
          this.textContent = "I am a calendar";
        },
      });
              
    Create the Polymer component HTML tag by importing it in a HTML document, e.g. import it in the index.html of your React application:
    
      <link
        rel="import"
        href="./src/polymer-components/calendar-element.html"
      />
              
    Use that element in the JSX file:
    
      import React from "react";
    
      class MyComponent extends React.Component {
        render() {
          return <calendar-element />;
        }
      }
    
      export default MyComponent;
              
    Q197. What are the advantages of React over Vue.js?
    React has the following advantages over Vue.js:
    Gives more flexibility in large apps developing.
    Easier to test.
    Suitable for mobile apps creating.
    More information and solutions available.
    Note: The above list of advantages are purely opinionated and it vary based on the professional experience. But they are helpful as base parameters.
    Q198. Why React tab is not showing up in DevTools?
    When the page loads, React DevTools sets a global named __REACT_DEVTOOLS_GLOBAL_HOOK__, then React communicates with that hook during initialization. If the website is not using React or if React fails to communicate with DevTools then it won't show up the tab.
    Q199. What are Styled Components?
    styled-components is a JavaScript library for styling React applications. It removes the mapping between styles and components, and lets you write actual CSS augmented with JavaScript.
    Q200. Give an example of Styled Components?
    Lets create
    
      import React from "react";
      import styled from "styled-components";
    
      // Create a <Title> component that renders an <h1> which is centered, red and sized at 1.5em
      const Title = styled.h1'
        font-size: 1.5em;
        text-align: center;
        color: palevioletred;
      ';
    
      // Create a <Wrapper> component that renders a <section> with some padding and a papayawhip background
      const Wrapper = styled.section'
        padding: 4em;
        background: papayawhip;
      ';
              
    These two variables, Title and Wrapper, are now components that you can render just like any other react component.
    
      <Wrapper>
        <Title>{"Lets start first styled component!"}</Title>
      </Wrapper>
              