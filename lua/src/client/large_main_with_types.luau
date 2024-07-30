local _Include = game.ReplicatedStorage.include
local List = require(_Include.list)

type player_profile = {
	fragments: number,
	skins: { string | number },
}

type adder = {
	value: number,
}

function add(x, y)
	return {
		value = x.value + y.value,
	}
end

function add_skin(prof, skin_name)
	local function _8(name, _)
		return name == skin_name
	end
	local exists = List.exists(_8, prof.skins)

	local function _6(name, quant)
		local _7
		if name == skin_name then
			_7 = { name, quant + 1 }
		else
			_7 = { name, quant }
		end
		return _7
	end
	local _5
	if exists then
		_5 = List.map(_6, prof.skins)
	else
		_5 = table.insert(prof.skins, { skin_name, 1 })
	end
	local skins = _5
	return {
		fragments = prof.fragments,
		skins = skins,
	}
end

local function _9(s, _)
	return print(s)
end
local one = {
	value = 1,
}
local two = {
	value = 2,
}
local three = add(one, two)
local six = add(three, three)
local prof = {
	fragments = 1000,
	skins = {
		tag = "[]",
		value = nil,
	},
}
local new_prof = add_skin(prof, "test")
List.iter(_9, new_prof.skins)
print(tostring(six.value))
