function test(o)
  local _3
  if o == unknown then
    _3 = print("None")
  elseif o == unknown then
    _3 = print(s)
  else
    error("Exhaustive match was not exhaustive?")
  end
  return _3
end

test(unknown)
