// Array Reversal: Implement a function to reverse the elements of an array without using the built-in reverse() method.

const originalArray = [1, 2, 3, 4, 5];

const reverseArray = () => {
  const revArr = [];
  for (let i = originalArray.length - 1; i >= 0; i--) {
    revArr.push(originalArray[i]);
  }
  return revArr;
};
console.log(reverseArray());


var newArray = [];

var itemToRemove = 3;

for(let i=0;i<originalArray.length;i++){
    if(originalArray[i] !==itemToRemove){
        newArray.push(originalArray[i])
    }
}
console.log("newArray",newArray)
