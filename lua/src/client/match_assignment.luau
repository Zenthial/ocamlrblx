local _Include = game.ReplicatedStorage.include

function p(x)
	local _4
	if x == 1 then
		_4 = x + 1
	else
		_4 = x
	end
	local y = _4
	return y + x
end

print(p(1))
