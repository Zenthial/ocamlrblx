type player_profile = {
	fragments: int,
	skins: list,
}

type adder = {
	value: int,
}

function add(x, y)
	return {
		value = x.value + y.value,
	}
end

function add_skin(prof, skin_name)
	local function _6(name, _)
		return name == skin_name
	end
	local exists = List.exists(_6, prof.skins)

	local function _4(name, quant)
		local _5
		if name == skin_name then
			_5 = { name, quant + 1 }
		else
			_5 = { name, quant }
		end
		return _5
	end
	local _3
	if exists then
		_3 = List.map(_4, prof.skins)
	else
		_3 = table.insert(prof.skins, { skin_name, 1 })
	end
	local skins = _3
	return {
		fragments = prof.fragments,
		skins = skins,
	}
end

local function _7(s, _)
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
List.iter(_7, new_prof.skins)
print(tostring(six.value))
