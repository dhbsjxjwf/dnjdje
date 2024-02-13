local  Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("The Strongest Battlegrounds - SumitScripts", "DarkTheme")

local Tab = Window:NewTab("积分")
local Section = Tab:NewSection("Owner - SumitScripts")
local Section = Tab:NewSection("由SumitScripts修改 由XWW汉化")
local Section = Tab:NewSection("喜欢更多更新")
local Section = Tab:NewSection("修复中的错误报告在Dicord")
local Section = Tab:NewSection("不管怎么样，再见，享受脚本吧")

local Tab = Window:NewTab("菜单")
local Section = Tab:NewSection("最强大的战场")

Section:NewButton("Infinity Yield", "速度 , 飞行 , 跳跃等", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    print("Clicked")
end)

Section:NewButton("自动瞄准", "锁定目标玩家(最适合1v1)", function()
loadstring(game:HttpGet("https://pastebin.com/raw/1Gp9c57U"))()
    print("Clicked")
end)

Section:NewButton("Killer Hub(更新)", "无钥匙的 , 速度 , 排名", function()
loadstring(game:HttpGet("https://pastefy.app/74w2zF6p/raw",true))();
    print("Clicked")
end)

Section:NewSlider("速度", "It's Makes U Faster", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
 
Section:NewSlider("跳越高度", "它让你跳起来", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewButton("无限跳越(飞行)", "ButtonInfo", function()
--script made by Youtube: MrGabbe.   Discord: Mr_G_Curry #6982
local infjmp = true
game:GetService("UserInputService").jumpRequest:Connect(function()
    if infjmp then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
    end
end)
    print("Clicked")
end)