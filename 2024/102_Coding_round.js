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