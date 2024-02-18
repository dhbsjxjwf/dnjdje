-- 加载 OrionLib
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 创建窗口
local Window = OrionLib:MakeWindow({
    Name = "XWW hub",
    HidePremium = false,
    SaveConfig = true,
    IntroText = "XWW hub，启动！",
    ConfigFolder = "XWW hub"
})

-- 创建分区
local Tab = Window:MakeTab({
    Name = "传送和生成",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 添加按钮1（传送到目的地）
Tab:AddButton({
    Name = "传送到目的地",
    Callback = function()
        -- 进行传送
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, 1000, 0)))
    end
})

-- 添加按钮2（生成长方形板子）
Tab:AddButton({
    Name = "生成长方形板子",
    Callback = function()
        -- 创建更长的板子
        local rectangle = Instance.new("Part")
        rectangle.Size = Vector3.new(1000, 3, 1000)  -- 将长度和宽度都调整为 1000
        rectangle.Position = Vector3.new(0, 996, 0)
        rectangle.Anchored = true
        rectangle.Parent = game.Workspace