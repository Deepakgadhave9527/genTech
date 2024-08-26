var user = {
    id: 1,
    name: "Abc",
    active: true,
    greet: function () {
        console.log("Hello, " + user.name);
    },
    arr: [1, 2, 3],
    greetStr: function () {
        return user.name;
    }
};
var addCode3 = function (a, b) {
    return a + b;
};
var booleanVal = function (a, b) {
    return a; // The function returns the value of `a`
};
console.log(booleanVal(true, false)); // Output: true
var arrString = ["q", "b"];
