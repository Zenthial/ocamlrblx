type question = {
  tag: "Never" | "Maybe",
  value: any
}

function test(o)
  local _1
  if o.tag == "Never" then
    _1 = print("None")
  elseif o.tag == "Maybe" then
    s = o.value
    _1 = print(s)
  else
    error("Exhaustive match was not exhaustive?")
  end
  return _1
end

local t = {
  tag = "Never",
  value = nil
}
test(t)
