// Compare two array and return only the uncommon value in new array without using inbuilt methods
const array1 = [1,2,3,4,5,6]
const array2 = [4,5,6,7,8,9]


const findUncVal = (array1, array2) => {
  const uncommon1 = array1.filter(value => !array2.includes(value));
  const uncommon2 = array2.filter(value => !array1.includes(value));
  return [...uncommon1, ...uncommon2];
};

console.log(findUncVal(array1, array2)); // Output: [1, 2, 3, 7, 8, 9]


const findUncVal2 =(array1,array2)=>{
const unCommon =[];

const contains=(array,value)=>{
for(let i=0;i<array.length;i++){
    if(array[i]==value){
          return true
    }
}
return false
}
for(let i=0;i<array1.length;i++){
    if(!contains(array2,array1[i])){
        unCommon.push(array1[i])
        
    }
}
for(let i=0;i<array2.length;i++){
    if(!contains(array1,array2[i])){
        unCommon.push(array2[i])
        
    }
}
return unCommon
}
console.log(findUncVal2(array1,array2))



//=======================Q.1 HoW to empty an array in JavaScript==========================4
console.log(" Q.1 HoW to empty an array in JavaScript");

var arrayList = ["a", "b", "c", "d", "e", "f"];
//method1
arrayList = [];

console.log(arrayList);

console.log("------method2 ------");
//method2
var arrayList = ["a", "b", "c", "d", "e", "f"];
arrayList.length = 0;
console.log(arrayList);

console.log("------method3 ------");

var arrayList = ["a", "b", "c", "d", "e", "f"];

arrayList.splice(0, arrayList.length);
console.log(arrayList);

// ==================================================== make duplicate ===============
console.log("Q2 duplicate ");

//Q2 duplicate([1, 2, 3, 4, 5]); // [1,2,3,4,5,1,2,3,4,5]

var duplicate = [1, 2, 3, 4, 5];
const duplicate2 = duplicate.concat(duplicate);
console.log(duplicate2);

// ==================================================== Q3 nasted function ===============
console.log("Q3 nasted function");

const mul = (x) => {
  return function (y) {
    return function (z) {
      return x * y * z;
    };
  };
};
console.log(mul(2)(3)(4));
console.log(mul(4)(3)(4)); // output : 48

// ==================================================== Q3 nasted function ===============

for (let i = 1; i <= 100; i++) {
  let f = i % 3 == 0,
    b = i % 5 == 0;
  // console.log(f ? (b ? 'FizzBuzz' : 'Fizz') : b ? 'Buzz' : i);
}

//============4 Remove duplicates from an array ====================

console.log("4 Remove duplicates from an array");

var chars = ["A", "B", "A", "C", "B"];
var uniqueChars = [...new Set(chars)];
console.log(uniqueChars);

//method 2

// const uniqueFilter=()=>{}
var array = ["A", "B", "A", "C", "B"];

// console.log(array.indexOf("A"));

uniquearray = array.filter((val, i) => {
  return array.indexOf(val) == i;
});
console.log(uniquearray);

var array = ["A", "B", "A", "C", "B"];

uniquearray = [];
array.forEach((val, i) => {
  if (!uniquearray.includes(val)) {
    uniquearray.push(val);
  }
  // else {
  // console.log(true);
  //     uniquearray.push(val)

  // }
});

console.log(uniquearray);

//============reverse String ====================

var reverse = "reverse String ";

// Write a simple JavaScript program to join all elements of the following array into a string.

console.log(
  "simple JavaScript program to join all elements of the following array into a string."
);

var myColor = ["Red", "Green", "White", "Black"];
console.log(myColor.toString()); //Red,Green,White,Black
console.log(myColor.join("  ")); //Red  Green  White  Black
console.log(myColor.join("+")); //Red+Green+White+Black

//Pre and post increment

console.log(
  "=======Pre first it will inreament and them assing to value to variable ============="
);

var a = 10;
var b = ++a;
console.log(a);
console.log(b);

console.log(
  "=======post it will not increent same value is applied to variable ============="
);

var a = 10;
var b = a++;
console.log(a);
console.log(b);

var a = 10;
var b = a++;
console.log(a);
console.log(b);

//Pre and post decrement

console.log("Pre and post decrement");
var x = 10;
var y = --x;

console.log(x);
console.log(y);

var x = 10;
var y = x--;

console.log(x);
console.log(y);

// ------------------------------
// const fun = (x, x) => {
//     return console.log(x + "" + x);
// }
// fun(1, 2)

function func22(x, x) {
  console.log(x + "" + x);
}
func22("addd", "22");

var a = [1, 2, 3];
var b = a;
b[0] = 5;

console.log(a);
console.log(b);


console.log(" Q.1 HoW to empty an array in JavaScript");

var arrayList = ["a", "b", "c", "d", "e", "f"];
arrayList.length = 0;
console.log(arrayList);

var arrayList = ["a", "b", "c", "d", "e", "f"];
arrayList = [];
console.log(arrayList);

var arrayList = ["a", "b", "c", "d", "e", "f"];
arrayList.splice(0, arrayList.length);
console.log(arrayList);

console.log("============  duplicate ======================");

// Q2 duplicate([1, 2, 3, 4, 5]); // [1,2,3,4,5,1,2,3,4,5]

var duplicate = ["A", "B", "A", "C", "B"];
var set = [...new Set(duplicate)];
console.log(set);

const notuniquearray = [];
const uniquearray = [];
duplicate.forEach((val) => {
  if (uniquearray.includes(val)) {
    console.log(uniquearray.includes(val) + val);
    notuniquearray.push(val);
  } else {
    uniquearray.push(val);
  }
});
console.log(uniquearray);
console.log(notuniquearray);

var duplicate3 = [1, 55, 111, 2, 3, 3, 4, 4, 5, 2, 11, 33, 44, 44];

var unique = duplicate3.filter((val, i) => {
  return duplicate3.indexOf(val) == i;
});

console.log(unique);

// console.log(duplicate);

var ascending = unique.sort(function (a, b) {
  return a - b;
});
console.log(ascending);

console.log("==============max ==================");

var duplicate3 = [1, 55, 111, 2, 3, 3, 4, 4, 5, 2, 11, 33, 44, 44];
var max = Math.max(...duplicate3);

var math = Math.max.apply(null, duplicate3);
console.log(math);

console.log("==================Factorial logic =========================");

var val = 4;
var total = 1;

for (var i = 0; i < val; i++) {
  console.log(total + "--" + (val - i) + "--" + total * (val - i));
  total = total * (val - i);
}

console.log(total);

// 1. Find the maximum element in an array.

const array = [5, 2, 8, 10, 3];

let max=array[0]

const maxFun =()=>{
    
    for(let i=0;i<array.length;i++){
        // console.log(i)
        if(max<array[i]){
            max=array[i]
        }
    }

    return max
}
console.log(maxFun(array)
)
// 2. Find the minimum element in an array.


// how convert array to object

const arrayToObject = (arr) => {
    const obj = {};
    arr.forEach((item, index) => {
      obj[index] = item;
    });
    return obj;
  };
  
  const myArray = ['a', 'b', 'c'];
  const myObject = arrayToObject(myArray);
  console.log(myObject);


//================================\//================================\


function createShoppingCart() {
    let items = []; // Private variable to store items in the cart
    
    function addItem(item) {
      items.push(item);
      console.log(item.name + " added to cart.");
    }
    
    function removeItem(item) {
      let index = items.findIndex(i => i.id === item.id);
      if (index !== -1) {
        items.splice(index, 1);
        console.log(item.name + " removed from cart.");
      } else {
        console.log("Item not found in cart.");
      }
    }
    
    function getCartItems() {
      return items.slice(); // Return a copy of items array
    }
    
    return {
      addItem,
      removeItem,
      getCartItems
    };
  }
  
  // Creating a closure by calling createShoppingCart
  const shoppingCart = createShoppingCart();
  
  // Adding items to the shopping cart
  shoppingCart.addItem({ id: 1, name: "Product 1", price: 10 });
  shoppingCart.addItem({ id: 2, name: "Product 2", price: 20 });
  
  // Retrieving the items from the cart
  const cartItems = shoppingCart.getCartItems();
  console.log("Items in the cart:", cartItems);
  
  // Removing an item from the cart
  shoppingCart.removeItem({ id: 1, name: "Product 1", price: 10 });
  
  // Retrieving the updated items from the cart
  const updatedCartItems = shoppingCart.getCartItems();
  console.log("Updated items in the cart:", updatedCartItems);







//================================\//================================\




  let array = [
    ['1', 40],
    ['2', 60],
    ['3', 50],
    ['5', 20]
  ];
  
  let arrayOfObjects = array.map(subArray => {
    return { id: subArray[0], value: subArray[1] };
  });
  
  console.log(arrayOfObjects);
  // Output: [ { id: '1', value: 40 }, { id: '2', value: 60 }, { id: '3', value: 50 }, { id: '5', value: 20 } ]


  //================================\//================================\
  let array = [
    ['4', 3],
    ['1', 13],
    ['5', 1],
    ['6', 4],
    ['2', 1],
    ['7', 3],
    ['7', 32],
  
    ['9', 11],
    ['10', 1]
  ];
  
  const sortOfArray=array.sort((a,b)=>{
      return a[1]-b[1]
  })
  console.log(sortOfArray)// [[ '5', 1 ],  [ '2', 1 ],[ '10', 1 ], [ '4', 3 ],[ '7', 3 ],  [ '6', 4 ],[ '9', 11 ], [ '1', 13 ],[ '7', 32 ]]
  
  
  














  
  //================================\//================================\


  const sameIdCount =[
    {id:1,count:30},
    {id:2,count:40},
    {id:3,count:50},
    {id:1,count:10},
    {id:2,count:20},
         {id:5,count:20}

   ]
   
   const combinedSameId=(sameIdCount)=>{
       
       const combined ={};
       for(let item of sameIdCount ){
           if(combined[item.id]){
               combined[item.id]+=item.count
               
           }else{
               combined[item.id]=item.count
           }
       }
       
       const arrayConvert=Object.entries(combined).map((val,id)=>{
           return {"id":val[0],count:val[1]}
       })
return arrayConvert
   }
   
console.log(combinedSameId(sameIdCount))











  
  //================================\//================================\




  const sameIdCount2 = [
    { id: 1, count: 30 },
    { id: 2, count: 40 },
    { id: 3, count: 50 },
    { id: 1, count: 10 },
    { id: 2, count: 20 },
    { id: 5, count: 20, name: "Abc" }
];

const combinedSameId2 = (sameIdCount2) => {
    const combined = {};

    for (let item of sameIdCount2) {
        if (combined[item.id]) {
            combined[item.id].count += item.count;
        } else {
            combined[item.id] = { ...item };
        }
    }

    return Object.values(combined);
};

console.log(combinedSameId2(sameIdCount2));
// Output: [
//   { id: 1, count: 40 },
//   { id: 2, count: 60 },
//   { id: 3, count: 50 },
//   { id: 5, count: 20, name: "Abc" }
// ]










  
  //================================\//================================\

  let array = [
    ['6', 4],
    ['4', 3],
    ['7', 3],
    ['1', 1],
    ['2', 1],
    ['5', 1],
    ['9', 1],
    ['10', 1]
  ];
  
  // Copy the array to avoid modifying the original
  let arrayCopy = array.slice();
  
  // Sort by the first element (as strings)
  arrayCopy.sort((a, b) => a[0]-(b[0]));
  
  console.log(arrayCopy);
  // Output: [ ['1', 1], ['10', 1], ['2', 1], ['4', 3], ['5', 1], ['6', 4], ['7', 3], ['9', 1] ]
  












  
  //================================\//================================\

  let array = [5, 3, 8, 1, 2];

  // Ascending order
  array.sort((a, b) => a - b);
  
  console.log(array); // Output: [1, 2, 3, 5, 8]
  












  
  //================================\//================================\


  let array = [5, 3, 8, 1, 2];

  // Descending order
  array.sort((a, b) => b - a);
  
  console.log(array); // Output: [8, 5, 3, 2, 1]
  











  
  //================================\//================================\







  let stringArray = ["banana", "apple", "cherry", "date"];

  // Ascending order (alphabetical)
  stringArray.sort((a, b) => a.localeCompare(b));
  
  console.log(stringArray); // Output: ["apple", "banana", "cherry", "date"]
  
  // Descending order (reverse alphabetical)
  stringArray.sort((a, b) => b.localeCompare(a));
  
  console.log(stringArray); // Output: ["date", "cherry", "banana", "apple"]
  






  
  //================================\//================================\





  let stringArray3 = ["banana aw", "apple mz", "cherry op", "date bc"];

  stringArray3.sort((a, b) => {
      const aSecondPart = a.split(' ')[1];
      const bSecondPart = b.split(' ')[1];
      return aSecondPart.localeCompare(bSecondPart);
  });
  
  console.log(stringArray3);
  // Output: ["banana aw", "date bc", "apple mz", "cherry op"]
  








  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  //================================\//================================\














  
  
  









