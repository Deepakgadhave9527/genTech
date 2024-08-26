

type User = {
    id: number,
    name: string,
    active: boolean,
    greet: () => void,
    greetStr?: () => string,
    arr: any[]
}
var user: User = {
    id: 1,
    name: "Abc",
    active: true,
    greet: () => {
        console.log("Hello, " + user.name);
    },
    arr: [1, 2, 3],
    greetStr: function () {
        return user.name
    }
};
type MathOperation = (a: number, b: number) => number;

const addCode3: MathOperation = (a, b) => {
    return a + b;
};

type returnBool = (a: boolean, b: boolean) => boolean;

const booleanVal: returnBool = (a, b) => {
    return a; // The function returns the value of `a`
};

console.log(booleanVal(true, false)); // Output: true

type StringVal =string[]

const arrString:StringVal=["q","b"]