type adder = {
  value: int
}

function add(x, y)
  return {
    value = x.value + y.value
  }
end

local one = {
  value = 1
}
local two = {
  value = 2
}
local three = add(one, two)
local six = add(three, three)
print(tostring(six.value))
