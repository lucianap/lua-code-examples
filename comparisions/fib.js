<script>
function fib(num) {
  if (num <= 1) return 1;

  return fib(num - 1) + fib(num - 2);
}

function fibIt(num){
  var a = 1, b = 0, temp;

  while (num >= 0){
    temp = a;
    a = a + b;
    b = temp;
    num--;
  }

  return b;
}

function fibRT(n) {
  return function(n,a,b) {
    return n>0 ? arguments.callee(n-1,b,a+b) : a;
  }(n,0,1);
}

console.time('fib');
fib(35);
console.timeEnd('fib');

console.time('fibIt');
fibIt(350);
console.timeEnd('fibIt');

console.time('fibRT');
fibRT(350);
console.timeEnd('fibRT');
</script>