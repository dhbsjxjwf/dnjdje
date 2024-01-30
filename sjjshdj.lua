local OrionLib = loadstring(game:HttpGet('https://pastebin.com/raw/xLRUSiKx'))()
local Window = OrionLib:MakeWindow({Name = "悬浮窗显示的字", HidePremium = false, SaveConfig = true,IntroText = "XWW", ConfigFolder = "XWW"})
local Tab = Window:MakeTab({
    Name = "doors",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "poopdoors",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dhbsjxjwf/dnjdje/main/untitl.lua"))()
end
})    
Tab:AddButton({
	Name = "doors最强",
	Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end
})    
Tab:AddButton({
	Name = "rooms自动行走",
	Callback = function()
loadstring(game:HttpGet("https://" .. "raw.githubusercontent.com/DaRealGeo/roblox/master/rooms-autowalk"))()
end
})    