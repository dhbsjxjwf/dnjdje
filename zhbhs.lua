local OrionLib = loadstring(game:HttpGet('https://pastebin.com/raw/xLRUSiKx'))()local Window = OrionLib:MakeWindow({Name = "XCWW", HidePremium = false, SaveConfig = true,IntroText = "XCWW", ConfigFolder = "XCWW"})

local Tab = Window:MakeTab({
    Name = "doors",	
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "MSdoors汉化版",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dhbsjxjwf/dnjdje/main/untitl.lua"))()
end
})    

Tab:AddButton({
	Name = "doors最强汉化版",
	Callback = function()
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end
})    

