// for (let i = 0; i < 10; i++) {
//   //   console.log(i);
// }

// let a;
// a = 4;
// a = 5;
// console.log(a);

// let pharse = "deep";

// function say(name) {
//   console.log(name, pharse);
// }
// say("a");

// let value = 55;
// function f() {
//   var value = 123;

//   return function () {
//     console.log(value);
//   };
// }
// let a = f();
// a();

// function run() {
//   var foo = "Foo";
//   let bar = "Bar";

//   console.log(foo, bar); // Foo Bar

//   {
//     foo = "Mooo";
//     let baz = "Bazz";
//     console.log(foo, baz); // Mooo Bazz
//   }

//   console.log(foo); // Mooo
//   //   console.log(baz); // ReferenceError
// }

// run();

// var funcs = [];
// // let's create 3 functions
// for (var i = 0; i < 3; i++) {
//   // and store them in funcs
//   funcs[i] = function () {
//     // each should log its value.
//     console.log("My value: " + i);
//   };
// }

// for (var j = 0; j < 3; j++) {
//   // and now let's run each one to see
//   console.log(j);
// }

// const duplicate = [1, 2, 3, 4, 5];
// const duplicate2 = duplicate.concat(duplicate);
// console.log(duplicate2);

// var duplicate3 = [1, 55, 111, 2, 3, 3, 4, 4, 5, 2, 11, 33, 44, 44];

// var unique = duplicate3.filter((val, i) => {
//   console.log(val + "  ===" + duplicate3.indexOf(val));
//   return duplicate3.indexOf(val) == i;
// });

// console.log(unique);

// var ascending = duplicate3.sort(function (a, b) {
//   return a - b;
// });
// console.log(ascending);

// var a = 10;
// var b = ++a;
// console.log(a);
// console.log(b);

// var a = 10;
// var b = a++;
// console.log(a);
// console.log(b);
// console.log(b);

// function a(v1) {
//   console.log(v1);
//   function b(v2) {
//     console.log(v2);
//     console.log(v1);
//   }
//   b("hello");
// }

// const test = a("test");

// a = [1, 2, 3];
// b = a;

// b[0] = 33;
// console.log(b);

// console.log(a);

const names = "Balaji";
var temp = "";
for (let i = names.length - 1; i >= 0; i--) {
  temp += names.charAt(i);
}
console.log(temp);
