local _Include = game.ReplicatedStorage.include

local Classes = require("Classes")

local Enums = require("Enums")

local pressed = UserInputService.gamepad_supports({
	tag = "MouseButton1",
	value = nil,
}, {
	tag = "E",
	value = nil,
})
local _3
if pressed then
	_3 = print("true")
else
	_3 = print("false")
end
