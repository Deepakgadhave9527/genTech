//=================================================================================

async function async1() {
    console.log("async1 start");
    await async2();
    console.log("async1 end");
  }
  
  async function async2() {
    console.log("async2");
  }
  
  console.log("script start");
  
  setTimeout(function () {
    console.log("setTimeout");
  }, 0);
  
  async1();
  
  new Promise(function (resolve) {
    console.log("promise1");
    resolve();
  }).then(function () {
    console.log("promise2");
  });
  
  console.log("script end");

//=================================================================================

  console.log(null == undefined);
//=================================================================================

  console.log('5' - - '3');

  //=================================================================================

  var a = 10;
  {
      var a = -10;
  }
  console.log(a);

//=================================================================================
  const str = "32003023234400340";
  const countOfZero = [...str].reduce((count, char) => count + (char === '0'), 0);
  console.log(countOfZero);
    
//=================================================================================

  console.log('start');

function sleep(ms) {
  return new Promise(res => setTimeout(res, ms));
}

async function delayTime() {
  console.log("wait for 5 second");
  await sleep(5000);
  console.log("stop");
}

delayTime();

//=================================================================================

function  outerFunction(){
  var count=0
  function inncremnt(){
  count++
  console.log(count)
  }
  return inncremnt
  }
  const counter1=outerFunction()
  counter1()
//=================================================================================
  let a='a,b,c,c'
  let arr=a.split(",");
  let uniq=[...new Set(arr)];
  console.log(uniq)

//=================================================================================
  function check() {
    let x = y = 0;
    x++;
    return x;
  }
  
  check();
  console.log(typeof x); // => ???
  console.log(typeof y); // => ???
  //=================================================================================
  
  var i;
  for (i = 0; i < 3; i++) {
    const log = () => {
      console.log(i);
    }
    setTimeout(log, 100);
  }
  
  let x = true
  setTimeout (()=>{
  
  x= false
  },2000)
  while (x)
  {
  console.log(“hello”)
  }
  
  //=================================================================================
  const arr5 =[1,2,3,4,[5,6,7]]
  
  function flattenArray(arr){
      let result=[]
    function recursivArr(input){
          for(let i=0;i<input.length;i++){
          if(Array.isArray(input[i])){
              recursivArr(input[i])
          }else{
              result.push(input[i])
          }
      }
    }
    recursivArr(arr)
    return result
  }
  const fltArr=flattenArray(arr5)
  console.log(fltArr)


  let nestedArray = [1, [2, 3], [4, [5, 6]], 7,[8,[9,10,[11,[13]]]]];


const flatArr=(inp)=>{
  return  inp.reduce((acc,item)=>{
        if(Array.isArray(item)){
           const subArr= flatArr(item)
            acc=acc.concat(subArr)
        }else{
            acc.push(item)
        }
        return acc
    },[])
    
}
console.log(flatArr(nestedArray))