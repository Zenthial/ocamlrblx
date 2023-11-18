function fib(n)
  local _2
  if n == 1 then
    _2 = 1
  elseif n == 0 then
    _2 = 0
  else
    _2 = fib(n - 1) + fib(n - 2)
  end
  return _2
end

print(fib(10))