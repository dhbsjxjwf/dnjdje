local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Fluent:Notify({
        Title = "加载脚本",
        Content = "加载Blade Ball脚本",
        Duration = 5 -- Set to nil to make the notification not disappear
})
task.wait(5)
local Window = Fluent:CreateWindow({
    Title = "BobHub V5 ",
    SubTitle = "Blade Ball | Welcome " .. game.Players.LocalPlayer.DisplayName,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
   Main = Window:AddTab({ Title = "战斗", Icon = "剑" }),
   Player = Window:AddTab({ Title = "玩家", Icon = "使用" }),
   Misc = Window:AddTab({ Title = "混乱的", Icon = "家" }),
   Settings = Window:AddTab({ Title = "设置", Icon = "设置" })
}
Window:SelectTab(1)
local Options = Fluent.Options
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dhbsjxjwf/dnjdje/main/bal2.lua"))()

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
do
        
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "自动招架模式",
    Description = "",
    Values = {"Block", "Teleport Ball"},
    Multi = false,
    Default = nil,
})

Dropdown:OnChanged(function(Value)
    print("auto parry mode:", Value)
end)

    local Toggle = Tabs.Main:AddToggle("MyToggle", 
         {
                Title = "自动招架", 
                Description = "",
                Default = false,
                Callback = function(state)
	             if state then
	                 print("auto parry on")
	             else
	                 print("auto parry off")
                 end
             end 
        })
   
        local Toggle = Tabs.Main:AddToggle("MyToggle", 
         {
                Title = "自动招架-面球", 
                Description = "Disable Normal Auto parry First",
                Default = false,
                Callback = function(state)
	             if state then
	                 print("auto parry on")
	             else
	                 print("auto parry off")
                 end
             end 
        })

         local Toggle = Tabs.Main:AddToggle("MyToggle", 
         {
                Title = "集体招架", 
                Description = "Good For Clashing",
                Default = false,
                Callback = function(state)
	             if state then
	                 print("auto parry on")
	             else
	                 print("auto parry off")
                 end
             end 
        })

        local Slider = Tabs.Main:AddSlider("Slider", 
{
    Title = "自动招架触发距离",
    Description = "",
    Default = 20,
    Min = 20,
    Max = 50,
    Rounding = 1,
    Callback = function(Value)
        print("auto parry distance changed to ", Value)
    end
})

local Slider = Tabs.Player:AddSlider("Slider", 
{
    Title = "步行速度",
    Description = "",
    Default = 36,
    Min = 36,
    Max = 50,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Tabs.Player:AddButton({
    Title = "切换Inf跳越",
    Description = "",
    Callback = function()
        _G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
Fluent:Notify({
        Title = "脚本准备了！",
        Content = "Infinite Jump Has Been Loaded",
       
        Duration = 3 -- Set to nil to make the notification not disappear
})
	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
    end
})

local Dropdown2 = Tabs.Player:AddDropdown("Dropdown", {
    Title = "一天的时间",
    Description = "",
    Values = {"Day", "Night"},
    Multi = false,
    Default = 1,
})
Dropdown2:OnChanged(function(Value)
    print("time change to", Value)
end)


local Tab = Tabs.Misc:AddSection("Miscellaneous")
Tab:AddButton({
    Title = "为经典投票",
    Description = "",
    Callback = function()
        print("script")
    end
})
Tab:AddButton({
    Title = "为2团队投票",
    Description = "",
    Callback = function()
        print("script")
    end
})
Tab:AddButton({
    Title = "为4团队投票",
    Description = "",
    Callback = function()
        print("script")
    end
})

local Toggle = Tab:AddToggle("MyToggle", 
{
    Title = "FFA自动投票", 
    Description = "",
    Default = false,
    Callback = function(state)
	if state then
	    print("script")
	else
	    print("script")
        end
    end 
})

local Toggle = Tab:AddToggle("MyToggle", 
{
    Title = "自动为2团队投票", 
    Description = "",
    Default = false,
    Callback = function(state)
	if state then
	    print("scrpi")
	else
	    print("script")
        end
    end 
})

local Toggle = Tab:AddToggle("MyToggle", 
{
    Title = "自动为4团队投票", 
    Description = "",
    Default = false,
    Callback = function(state)
	if state then
	    print("scripy")
	else
	    print("script")
        end
    end 
})

Tab:AddButton({
    Title = "买剑皮",
    Description = "",
    Callback = function()
        print("script")
    end
})
Tab:AddButton({
    Title = "买爆炸皮肤",
    Description = "",
    Callback = function()
        print("script")
    end
})

local Tab = Tabs.Misc:AddSection("Trolling")

local Toggle = Tab:AddToggle("MyToggle", 
{
    Title = "跟着球", 
    Description = "",
    Default = false,
    Callback = function(state)
	if state then
	    print("script")
	else
	    print("script")
        end
    end 
})

local Slider = Tab:AddSlider("Slider", 
{
    Title = "速度球",
    Description = "",
    Default = 20,
    Min = 20,
    Max = 250,
    Rounding = 1,
    Callback = function(Value)
        print("Slider was changed:", Value)
    end
})

end    