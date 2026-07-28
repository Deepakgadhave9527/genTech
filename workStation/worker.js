onmessage = function(event) {
  console.log('Message from main script:', event.data);
  
  // Do heavy work
  let sum = 0;
  for (let i = 0; i < 1e8; i++) sum += i;
  
  // Send result back
  postMessage(`Sum: ${sum}`);
};
