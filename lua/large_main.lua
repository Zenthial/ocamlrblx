function add(x, y)
  return x + y
end

local one = 1
local two = 2
local three = add(one, two)
local six = add(three, three)
print(tostring(six))
