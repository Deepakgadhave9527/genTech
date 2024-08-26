### Type Annotations

Type annotations allow you to explicitly specify the types of variables,
function parameters, and return values. 
This helps TypeScript understand what type of data is expected and provides better type checking during development.

Variable Annotations:


### Type Alias in TypeScript

A **Type Alias** in TypeScript allows you to create a custom name for a type. Its useful for simplifying complex types, reusing types, and making your code more readable.



 Creating a Type Alias**

type AliasName = ExistingType;

**Example:**

```typescript
type UserID = string;
let id: UserID = "abc123";
```

### **Common Use Cases**

1. **Object Types:**

   ```typescript
   type User = {
     id: number;
     name: string;
     email: string;
   };

   let user: User = {
     id: 1,
     name: "Alice",
     email: "alice@example.com",
   };
   ```

2. **Union Types:**

   ```typescript
   type ID = number | string;
   let userId: ID = 123;
   userId = "abc123";
   ```

3. **Function Types:**

   ```typescript
   type MathOperation = (a: number, b: number) => number;
   const add: MathOperation = (x, y) => x + y;
   ```

4. **Array Types:**

   ```typescript
   type StringArray = string[];
   let names: StringArray = ["Alice", "Bob"];
   ```

5. **Intersection Types:**

   ```typescript
   type Employee = Person & { employeeId: number };
   ```

### **Type Alias vs Interface**

- **Type Alias** can define primitive types, unions, intersections, and more.
- **Interface** is better suited for defining object shapes and can be extended.

**When to Use:**
- Use **Type Aliases** for flexible, non-object types.
- Use **Interfaces** for object structures that might need extension.

Type aliases are a powerful feature in TypeScript, enabling you to write more concise and maintainable code.