const myMap = new Map();

const key1="str" ; const key2={}; const key3=()=>{}
myMap.set(key1,"this string Value");
myMap.set(key2,"this Object");
myMap.set(key3,"This is function");

myMap.set(true,"This is key4");
myMap.delete(true)
// console.log(myMap)
const key1Val=myMap.get(key1)
const key2Val=myMap.get(key2)
const key3Val=myMap.get(key3)
// console.log(key1Val)
console.log(myMap)

for(let [key,val] of myMap){
        // console.log("key",key)
        
                // console.log("val",val)


}

for(let keys of myMap.keys()){
    // console.log("keys",keys)
}
for(let values of myMap.values()){
        // console.log("values",values)

}
myMap.forEach((values,keys)=>{
            console.log("keys-->",keys)

    console.log("values-->",values)

})
console.log("==================Array.fromArray.fromArray.from")

const myArr=Array.from(myMap)
const KeysOfMap =Array.from(myMap.keys())
const ValuesOfMap =Array.from(myMap.values())
console.log(myArr)

    console.log("KeysOfMap-->",KeysOfMap)
    console.log("ValuesOfMap-->",ValuesOfMap)



// const cars = ["Saab", "Volvo", "BMW"];

// for(let varsValue of cars){
//     console.log(varsValue)
// }

// // // Array of objects
// // let objArr = [
//     {
//         name: 'john',
//         age: 12,
//         gender: 'male'
//     },
//     {
//         name: 'jane',
//         age: 15,
//         gender: 'female'
//     },
//     {
//         name: 'julie',
//         age: 20,
//         gender: 'trans'
//     }
// ];
// for (let val of objArr){
//     console.log(val.age)
// }
// // objArr.map((val,i)=>{
// //         console.log(val.name)

  
// // })



const mySet =new Set([1,2,4,,5,6,6,,33,2,4,5,6,6,4,4,4,1,1,11,"A","a"])
console.log(mySet)
mySet.add({
    name:"Abc"
});
mySet.add({second:'This is second value'});
mySet.add('third','This is third value')
mySet.add('APlle')
mySet.add("apple")
console.log(mySet)
mySet.delete(1)
for(let val of mySet){
    console.log("val --",val)
}
// mySet.clear()




console.log(mySet)


