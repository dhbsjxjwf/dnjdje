local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
 
local Window = OrionLib:MakeWindow({Name = "自动关机"})
 
local Tab = Window:MakeTab({
  Name = "自动旋转",
  Icon = "rbxassetid://4483345998"
})
 
Tab:AddToggle({
  Name = "出售",
  Default = false,
  Callback = function(Value)
    Sold = Value
    while Sold and task.wait(1) do
local args = {
    [1] = 0
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Sold"):InvokeServer(unpack(args))
    end
  end
})
Tab:AddToggle({
  Name = "链",
  Default = false,
  Callback = function(Value)
    Chain = Value
    while Chain and task.wait(1) do
local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Goldlika: PARIS")
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Spin"):InvokeServer(unpack(args))
 
    end
  end
})
Tab:AddToggle({
  Name = "挂机",
  Default = false,
  Callback = function(Value)
    Afk = Value
    while Afk and task.wait() do
repeat wait() until game:IsLoaded() game:GetService("Players").LocalPlayer.Idled:connect(function() game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
    end
  end
})
local Tab = Window:MakeTab({
  Name = "自动跑酷",
  Icon = "rbxassetid://4483345998"
})
Tab:AddToggle({
  Name = "跑酷",
  Default = false,
  Callback = function(Value)
    Obby = Value
    while Obby and task.wait(1) do 
game.Workspace.EndPart:PivotTo(CFrame.new(5.14438533782959, 4.975198745727539, -0.32985734939575195))
game.Workspace.Obby.Start:PivotTo(CFrame.new(5.14438533782959, 4.975198745727539, -0.32985734939575195))
    end
  end
})
local Tab = Window:MakeTab({
  Name = "自动迷你游戏",
  Icon = "rbxassetid://4483345998"
})
Tab:AddToggle({
  Name = "迷你游戏",
  Default = false,
  Callback = function(Value)
    minigame = Value
    while minigame and task.wait() do   game.Players.LocalPlayer.Character:PivotTo(CFrame.new(2.7291126251220703, -13.528335571289062, 32.551177978515625))
game.Workspace.ReadyUpPad:PivotTo(CFrame.new(2.7291126251220703, -13.528335571289062, 32.551177978515625))
    end
  end
})
Tab:AddToggle({
  Name = "飞行",
  Default = false,
  Callback = function(Value)
    fly = Value
    while fly and task.wait(10) do   
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
  end
})