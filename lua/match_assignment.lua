function p(x)
  local y = if x == 1 then
  return x + 1
else
  return x
end
y + x
end

print(p(1))