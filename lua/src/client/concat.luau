local _Include = game.ReplicatedStorage.include

function p(s)
	local new_str = s .. "yo"

	local other_str = "test"

	return print(new_str .. other_str)
end

p("hello world")
