function fib(n)
  if n == 1 then
    return 1
  elseif n == 0 then
    return 0
  else
    return fib(n - 1) + fib(n - 2)
  end
end

print(fib(10))