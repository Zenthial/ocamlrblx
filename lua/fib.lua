function fib(n)
  if n == 0 then
    return 0
  elseif n == 1 then
    return 1
  elseif n == n then
    return fib(n - 1) + fib(n - 2)
  else
    error("Exhaustive match was not exhaustive?")
  end
end

print(fib(10))