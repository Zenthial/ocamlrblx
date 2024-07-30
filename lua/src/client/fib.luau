local _Include = game.ReplicatedStorage.include

function fib(n)
	local _1
	if n == 1 then
		_1 = 1
	elseif n == 0 then
		_1 = 0
	else
		_1 = fib(n - 1) + fib(n - 2)
	end
	return _1
end

print(fib(10))
