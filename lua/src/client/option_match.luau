local _Include = game.ReplicatedStorage.include

type question = {
	tag: "Never" | "Maybe",
	value: any,
}

function test(o)
	local _2
	if o.tag == "Never" then
		_2 = print("None")
	elseif o.tag == "Maybe" then
		s = o.value
		_2 = print(s)
	else
		error("Exhaustive match was not exhaustive?")
	end
	return _2
end

local t2 = {
	tag = "Maybe",
	value = "thing",
}
test(t2)
