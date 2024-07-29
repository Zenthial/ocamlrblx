local Rbxlib = require("Rbxlib")

local function _3(p)
	return print(p)
end
local pressed = Classes.UserInputService.get_keys_pressed({
	tag = "()",
	value = nil,
})
List.iter(_3, pressed)
