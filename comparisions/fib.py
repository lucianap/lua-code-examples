import time

#Naive recursivo
def fib(n):
	if n == 0: return 0
	elif n == 1: return 1
	else: return fib(n-1)+fib(n-2)

#Iterativo
def fibI(n):
    a, b = 0, 1
    for i in range(0, n):
        a, b = b, a + b
    return a

#Tail recursion
def fibRT(n):
  def fib_help(a, b, n):
    return fib_help(b, a+b, n-1) if n > 0 else a
  return fib_help(0, 1, n)

start = time.time()
resultN = fib(35)
print("Fibonacci naive fib(35) time:")
end = time.time()
print(end - start)

start = time.time()
resultI = fibI(350)
print("Fibonacci iterative fibI(350) time:" )
end = time.time()
print(end - start)

start = time.time()
resultRT = fibRT(350)
print("Fibonacci tail recursive fibRT(350) time:")
end = time.time()
print(end - start)