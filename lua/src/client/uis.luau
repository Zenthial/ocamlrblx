local _Include = game.ReplicatedStorage.include

local Rbxlib = require("Rbxlib")

type test = {
	input: Enum.UserInputType,
}

local pressed = Classes.UserInputService.gamepad_supports(Enum.UserInputType.MouseButton1, Enum.KeyCode.E)
local _3
if pressed then
	_3 = print("true")
else
	_3 = print("false")
end
