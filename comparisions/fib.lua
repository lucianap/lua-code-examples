-- Author: Michael-Keith Bernard
-- Date: May 22, 2012
-- Description: Various implementations of the Fibonacci sequence in Lua. Lua
-- has native support for tail-call elimination which is why `tail_call` and
-- `continuation` run in near constant time. For sufficiently large numbers of n
-- you can start to see linear performace characteristics (particularly for the
-- `continuation` implementation), but ultimately the `tail_call` implementation
-- is an order of magnitude faster than iteration even for values of n as small
-- as 500k.

Fibonacci = {}

-- Naive recursive
function Fibonacci.naive(n)
  local function inner(m)
    if m < 2 then
      return m
    end
    return inner(m-1) + inner(m-2)
  end
  return inner(n)
end

-- Iterative
function Fibonacci.iterative(n)
  local a, b = 0, 1

  for i = 1, n do
    a, b = b, a + b
  end
  return a
end

-- Tail-optimized recursive
function Fibonacci.tail_call(n)
  local function inner(m, a, b)
    if m == 0 then
      return a
    end
    return inner(m-1, b, a+b)
  end
  return inner(n, 0, 1)
end

function timeit(f, ...)
  local start = os.clock()
  local res = { f(...) }
  local delta = os.clock() - start
  
  return delta, unpack(res)
end


delta, result = timeit(Fibonacci.naive, 35)
print("Naive fib(35): "..(delta * 1000).." ms")

delta, result = timeit(Fibonacci.iterative, 350)
print("It fib(350): "..(delta * 1000).." ms")

delta, result = timeit(Fibonacci.tail_call, 350)
print("Tail rec fib(350): "..(delta * 1000).." ms")

