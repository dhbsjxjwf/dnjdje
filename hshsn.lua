Tab:Button("收集物品项目", function()
	for _,v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("TouchTrigger") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TouchTrigger.CFrame
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(52, 140, -8)
            wait(0.2)
        end
    end
    end()

Tab:Toggle("怪物ESP",false, function(Value)
	if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                if not v:FindFirstChild("Lol") then
                    local esp = Instance.new("Highlight", v)
                    esp.Name = "Lol"
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    esp.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
            v:FindFirstChild("Lol"):Destroy()
        end
    end
    end()
    
    Tab:Toggle("物品ESP",false, function(Value)
	if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") then
                    if not v:FindFirstChild("Lol") then
                        local esp = Instance.new("Highlight", v)
                        esp.Name = "Lol"
                        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        esp.FillColor = Color3.new(0, 255, 0)
                    end
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("TouchTrigger") then
                v:FindFirstChild("Lol"):Destroy()
            end
        end
    end
    end()