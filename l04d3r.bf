local Supported = {
	[6504986360] = "https://raw.githubusercontent.com/shvl00/shvled/refs/heads/main/bgzi.luau",
	[7436755782] = "https://raw.githubusercontent.com/shvl00/shvled/refs/heads/main/gr0w_4_g4rd3n.lua",
}

local ID = game.GameId
local gm = Supported[ID]

if gm == nil then
	warn("sh0vel prod. -> Game is not supported")
	return
end

loadstring(game:HttpGet(gm))()

