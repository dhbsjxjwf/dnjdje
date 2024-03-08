                local WorkspacePlayers = game:GetService("Workspace").Game.Players
		local Players = game:GetService('Players')
		local localplayer = Players.LocalPlayer
		local GuiService = game:GetService("GuiService")
	        local Light = game:GetService("Lighting")
		local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
		
		local Window = OrionLib:MakeWindow({Name = "XWW | evade", HidePremium = false,IntroText = "XWW", SaveConfig = false, ConfigFolder = "OrionTest"})


		getgenv().money = true
		getgenv().revivedie = true
		getgenv().autowistle = true
		getgenv().autochat = true
		getgenv().AutoDrink = true
		getgenv().NoCameraShake = true
		getgenv().Settings = {
			moneyfarm = false,
			afkfarm = false,
			NoCameraShake = false,
			Speed = 1450,
			Jump = 3,
			reviveTime = 3,
		}

		local FindAI = function()
			for _,v in pairs(WorkspacePlayers:GetChildren()) do
				if not Players:FindFirstChild(v.Name) then
					return v
				end
			end
		end

		local GetDownedPlr = function()
			for i,v in pairs(WorkspacePlayers:GetChildren()) do
				if v:GetAttribute("Downed") then
					return v
				end
			end
		end

		local revive = function()
			local downedplr = GetDownedPlr()
			if downedplr ~= nil and downedplr:FindFirstChild('HumanoidRootPart') then
				task.spawn(function()
					while task.wait() do
						if localplayer.Character then
							workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
							localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(downedplr:FindFirstChild('HumanoidRootPart').Position.X, downedplr:FindFirstChild('HumanoidRootPart').Position.Y + 3, downedplr:FindFirstChild('HumanoidRootPart').Position.Z)
							task.wait()
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), false)
							task.wait(4.5)
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
							game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
							break
						end
					end
				end)
			end
		end

		task.spawn(function()
			while task.wait() do
				if Settings.AutoRespawn then
					if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
						game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
					end
				end

				if Settings.NoCameraShake then
					localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
				end
				if Settings.moneyfarm then
					if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
						game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
						task.wait(3)
					else
						revive()
						task.wait(1)
					end
				end
				if Settings.moneyfarm == false and Settings.afkfarm and localplayer.Character:FindFirstChild('HumanoidRootPart') ~= nil then
					localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(6007, 7005, 8005)
				end
			end
		end)

		function camerashake()
			while NoCameraShake == true do task.wait()
				localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
			end
		end

		function autodrink()
			while AutoDrink == true do
				local ohString1 = "Cola"
				game:GetService("ReplicatedStorage").Events.UseUsable:FireServer(ohString1)
				wait(6)
			end
		end

		function SpamChat()
			while autochat == true do
				local ohString1 = ""
				local ohString2 = ""
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
				wait(1)
			end
		end

		function autowistlefunction()
			while autowistle == true do
				local ohString1 = "吹口哨"
				local ohBoolean2 = true
				game:GetService("Players").LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2)
				game:GetService("ReplicatedStorage").Events.Whistle:FireServer()
				wait(5)
			end
		end

		function god()
			while revivedie == true do
				game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
				wait()
			end
		end

		function dofullbright()
			Light.Ambient = Color3.new(1, 1, 1)
			Light.ColorShift_Bottom = Color3.new(1, 1, 1)
			Light.ColorShift_Top = Color3.new(1, 1, 1)
			game.Lighting.FogEnd = 100000
			game.Lighting.FogStart = 0
			game.Lighting.ClockTime = 14
			game.Lighting.Brightness = 2
			game.Lighting.GlobalShadows = false
		end

		function freemoney()
			while money == true do
				local ohString1 = "免费金钱"rgb(100,255,100)\">($99999999)</font>"
				game:GetService("Players").LocalPlayer.PlayerGui.HUD.Messages.Use:Fire(ohString1)
				wait(5)
			end
		end

		


		function RandomEmote()
			OrionLib:MakeNotification({
				Name = "随机表情处理...",
				Content = "您按下了随机表情键结",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
		--tabs

		local MainTab= Window:MakeTab({
			Name = "主要特点",
			Icon = "rbxassetid://4483345998",
			PremiumOnly = false
		})

		local MiscTab= Window:MakeTab({
			Name = "额外的",
			Icon = "rbxassetid://4483345998",
			PremiumOnly = false
		})

		local ESPTab = Window:MakeTab({
			Name =  "Esp",
			Icon = "rbxassetid://4483345998",
			PremiumOnly = false
		})

		local TeleportTab= Window:MakeTab({
			Name = "传送",
			Icon = "rbxassetid://4483345998",
			PremiumOnly = false
		})

		local FunTab= Window:MakeTab({
			Name = "乐趣",
			Icon = "rbxassetid://4483345998",
			PremiumOnly = false
		})

		local CreditsTab = Window:MakeTab({
			Name = "制作组",
			Icon = "rbxassetid://4483345998",
			PremiumOnly = true
		})

		local MiscTab3 = MainTab:AddSection({
			Name = "自动农场"
		})

		MainTab:AddToggle({
			Name = "钱农场",
			Default = false,
			Callback = function(Value)
				Settings.moneyfarm = Value
			end    
		})

		MainTab:AddToggle({
			Name = "AFK农场",
			Default = false,
			Callback = function(Value)
				Settings.afkfarm = Value
			end    
		})

		--sliders
		local MainTab3 = MainTab:AddSection({
			Name = "滑块"
		})

		local Misctab5 = MiscTab:AddSection({
			Name = "Sliders"
		})

		local TargetWalkspeed
		MainTab:AddSlider({
			Name = "速度",
			Min = 0,
			Max = 250,
			Default = 0,
			Color = Color3.fromRGB(128, 128, 128),
			Increment = 1,
			ValueName = "步行速度",
			Callback = function(Value)
				TargetWalkspeed = Value
			end   
		})

		MainTab:AddSlider({
			Name = "臀高",
			Min = -1.40,
			Max = 100,
			Default = -1.40,
			Color = Color3.fromRGB(128, 128, 128),
			Increment = 1,
			ValueName = "Hip Height",
			Callback = function(HipValue)
				game.Players.LocalPlayer.Character.Humanoid.HipHeight = HipValue
			end    
		})

		MainTab:AddSlider({
			Name = "FOV滑块",
			Min = 1,
			Max = 120,
			Default = 70,
			Color = Color3.fromRGB(128, 128, 128),
			Increment = 1,
			ValueName = "Fov",
			Callback = function(Fov)
				local ohString1 = "FieldOfView"
				local ohNumber2 = Fov
				game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer(ohString1, ohNumber2)
			end
		})

		MainTab:AddSlider({
			Name = "跳跃功率",
			Min = 0,
			Max = 120,
			Default = 3,
			Color = Color3.fromRGB(128, 128, 128),
			Increment = 1,
			ValueName = "跳越",
			Callback = function(Value)
				Settings.Jump = Value
			end
		})

		MiscTab:AddSlider({
			Name = "日间和夜间滑块",
			Min = 0,
			Max = 24,
			Default = 14,
			Color = Color3.fromRGB(128, 128, 128),
			Increment = 0.1,
			ValueName = "时间",
			Callback = function(Time)
				game.Lighting.ClockTime = Time
			end
		})

		--toggles

		local FunTab2 = FunTab:AddSection({
			Name = "工具"
		})

		local MiscTab3 = MainTab:AddSection({
			Name = "工具"
		})

		MainTab:AddToggle({
			Name = "无摄像头抖动",
			Default = false,
			Callback = function(Value)
				NoCameraShake = Value
				camerashake()
			end    
		})

		MainTab:AddToggle({
			Name = "自动饮用可乐",
			Default = false,
			Callback = function(Value)
				AutoDrink = Value
				autodrink()
			end    
		})

		FunTab:AddToggle({
			Name = "Spam chat",
			Default = false,
			Callback = function(Value)
				autochat = Value
				SpamChat()
			end    
		})

		FunTab:AddToggle({
			Name = "Fake money giver",
			Default = false,
			Callback = function(Value)
				money = Value
				freemoney()
			end    
		})

		MainTab:AddToggle({
			Name = "自动重生",
			Default = false,
			Callback = function(Value)
				Settings.AutoRespawn = Value
			end    
		})

		FunTab:AddToggle({
			Name = "自动吹口哨",
			Default = false,
			Callback = function(Value)
				autowistle = Value
				autowistlefunction()
			end    
		})

		--buttons
		local FunTab3 = FunTab:AddSection({
			Name = "功能"
		})

		local MiscTab2 = MiscTab:AddSection({
			Name = "功能"
		})

		MiscTab:AddButton({
			Name = "查看聊天框",
			Callback = function()
				enabled = true
				spyOnMyself = false
				public = false
				publicItalics = true
				privateProperties = {
					Color = Color3.fromRGB(0,255,255); 
					Font = Enum.Font.SourceSansBold;
					TextSize = 18;
				}
				local StarterGui = game:GetService("StarterGui")
				local Players = game:GetService("Players")
				local player = Players.LocalPlayer
				local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
				local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
				local instance = (_G.chatSpyInstance or 0) + 1
				_G.chatSpyInstance = instance

				local function onChatted(p,msg)
					if _G.chatSpyInstance == instance then
						if p==player and msg:lower():sub(1,4)=="/spy" then
							enabled = not enabled
							wait(0.3)
							privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
							StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
						elseif enabled and (spyOnMyself==true or p~=player) then
							msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
							local hidden = true
							local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
								if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
									hidden = false
								end
							end)
							wait(1)
							conn:Disconnect()
							if hidden and enabled then
								if public then
									saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
								else
									privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
									StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
								end
							end
						end
					end
				end

				for _,p in ipairs(Players:GetPlayers()) do
					p.Chatted:Connect(function(msg) onChatted(p,msg) end)
				end
				Players.PlayerAdded:Connect(function(p)
					p.Chatted:Connect(function(msg) onChatted(p,msg) end)
				end)
				privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
				StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				local chatFrame = player.PlayerGui.Chat.Frame
				chatFrame.ChatChannelParentFrame.Visible = true
				chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
			end    
		})

		ESPTab:AddButton({
			Name = "玩家esp",
			Callback = function()
				local c = workspace.CurrentCamera
				local ps = game:GetService("Players")
				local lp = ps.LocalPlayer
				local rs = game:GetService("RunService")
				local function getdistancefc(part)
					return (part.Position - c.CFrame.Position).Magnitude
				end
				local function esp(p, cr)
					local h = cr:WaitForChild("Humanoid")
					local hrp = cr:WaitForChild("HumanoidRootPart")
					local text = Drawing.new("Text")
					text.Visible = false
					text.Center = true
					text.Outline = true
					text.Font = 2
					text.Color = Color3.fromRGB(255, 255, 255)
					text.Size = 17
					local c1
					local c2
					local c3
					local function dc()
						text.Visible = false
						text:Remove()
						if c1 then
							c1:Disconnect()
							c1 = nil
						end
						if c2 then
							c2:Disconnect()
							c2 = nil
						end
						if c3 then
							c3:Disconnect()
							c3 = nil
						end
					end
					c2 =
						cr.AncestryChanged:Connect(
							function(_, parent)
								if not parent then
								dc()
							end
							end
						)
					c3 =
						h.HealthChanged:Connect(
							function(v)
								if (v <= 0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
								dc()
							end
							end
						)
					c1 =
						rs.RenderStepped:Connect(
							function()
								local hrp_pos, hrp_os = c:WorldToViewportPoint(hrp.Position)
								if hrp_os then
								text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
								text.Text = p.Name .. " (" .. tostring(math.floor(getdistancefc(hrp))) .. " m)"
								text.Visible = true
							else
								text.Visible = false
							end
							end
						)
				end
				local function p_added(p)
					if p.Character then
						esp(p, p.Character)
					end
					p.CharacterAdded:Connect(
						function(cr)
							esp(p, cr)
						end
					)
				end
				for i, p in next, ps:GetPlayers() do
					if p ~= lp then
						p_added(p)
					end
				end
				ps.PlayerAdded:Connect(p_added)
			end    
		})

		MiscTab:AddButton({
			Name = "无限跳越",
			Callback = function()
				local InfiniteJumpEnabled = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if InfiniteJumpEnabled then
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
					end
				end)
			end    
		})

		MiscTab:AddButton({
			Name = "按Q瞬移",
			Callback = function()
				plr = game.Players.LocalPlayer 
				hum = plr.Character.HumanoidRootPart 
				mouse = plr:GetMouse()
				mouse.KeyDown:connect(function(key)
					if key == "q" then
						if mouse.Target then
							hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
						end
					end
				end)
			end    
		})

		MiscTab:AddButton({
			Name = "全亮",
			Callback = function()
				dofullbright()
			end    
		})

		MiscTab:AddButton({
			Name = "主菜单",
			Callback = function()
				game:GetService("ReplicatedStorage").Events.ReturnToMenu:FireServer()
			end    
		})

		MiscTab:AddButton({
			Name = "低质量",
			Callback = function()
				local ohString1 = "LowQuality"
				local ohBoolean2 = true
				game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer(ohString1, ohBoolean2)
			end    
		})

		FunTab:AddButton({
			Name = "免费凸轮(shift + P)",
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Freecam.lua"))()
			end    
		})

		TeleportTab:AddButton({
			Name = "主游戏",
			Callback = function()
				local TeleportService = game:GetService('TeleportService')
				GameId = 9872472334
				TeleportService:Teleport(GameId, game.Players.LocalPlayer)
			end    
		})


		TeleportTab:AddButton({
			Name = "休闲",
			Callback = function()
				local TeleportService = game:GetService('TeleportService')
				GameId = 10662542523
				TeleportService:Teleport(GameId, game.Players.LocalPlayer)
			end    
		})

		TeleportTab:AddButton({
			Name = "社会空间",
			Callback = function()
				local TeleportService = game:GetService('TeleportService')
				GameId = 10324347967
				TeleportService:Teleport(GameId, game.Players.LocalPlayer)
			end    
		})

		TeleportTab:AddButton({
			Name = "大团队",
			Callback = function()
				local TeleportService = game:GetService('TeleportService')
				GameId = 10324346056
				TeleportService:Teleport(GameId, game.Players.LocalPlayer)
			end    
		})

		TeleportTab:AddButton({
			Name = "团队死亡竞赛",
			Callback = function()
				local TeleportService = game:GetService('TeleportService')
				GameId = 110539706691
				TeleportService:Teleport(GameId, game.Players.LocalPlayer)
			end    
		})

		TeleportTab:AddButton({
			Name = "仅VC",
			Callback = function()
				local TeleportService = game:GetService('TeleportService')
				GameId = 10808838353
				TeleportService:Teleport(GameId, game.Players.LocalPlayer)
			end    
		})

		local MiscTab2 = MiscTab:AddSection({
			Name = "项目授予者"
		})

		MiscTab:AddButton({
			Name = "测试emote",
			Callback = function()
				game:GetService("ReplicatedStorage").Events.UI.Purchase:InvokeServer("Emotes", "Test")
			end    
		})

		--KeybindsButton

		local MiscTab1 = MiscTab:AddSection({
			Name = "密钥绑定"
		})

		local FunTab1 = FunTab:AddSection({
			Name = "密钥绑定"
		})

		MiscTab:AddBind({
			Name = "喝可乐",
			Default = Enum.KeyCode.H,
			Hold = false,
			Callback = function()
				local ohString1 = "Cola"
				game:GetService("ReplicatedStorage").Events.UseUsable:FireServer(ohString1)
			end    
		})

		MiscTab:AddBind({
			Name = "重新加入",
			Default = Enum.KeyCode.B,
			Hold = false,
			Callback = function()
				local ts = game:GetService("TeleportService")
				local p = game:GetService("Players").LocalPlayer
				ts:Teleport(game.PlaceId, p)
			end    
		})

		MiscTab:AddBind({
			Name = "随机投票",
			Default = Enum.KeyCode.X,
			Hold = false,
			Callback = function()
				local RandomVote = math.random(3)
				local ohNumber1 = (RandomVote)
				game:GetService("ReplicatedStorage").Events.Vote:FireServer(ohNumber1)
			end    
		})

		MiscTab:AddBind({
			Name = "重生",
			Default = Enum.KeyCode.R,
			Hold = false,
			Callback = function()
				game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
			end    
		})

		FunTab:AddBind({
			Name = "随机emote",
			Default = Enum.KeyCode.Z,
			Hold = false,
			Callback = function()
				local number = math.random(4)
				local ohString1 = (number)
				game:GetService("ReplicatedStorage").Events.Emote:FireServer(ohString1)
				RandomEmote()
			end    
		})
		--test

		ESPTab:AddToggle({
			Name = "bots追踪器",
			Default = true,
			Callback = function(Value)
				getgenv().toggleespmpt = Value
			end    
		})

		ESPTab:AddColorpicker({
			Name = "颜色",
			Default = Color3.fromRGB(255, 255, 255),
			Callback = function(Value)
				getgenv().mptespcolour = Value
			end  
		})

		CreditsTab:AddParagraph("Owner/Main Dev","thaibao7444")
		CreditsTab:AddParagraph("Credits","Tbao Hub")

		local cam = workspace.CurrentCamera
		local rs = game:GetService'RunService'

		getgenv().toggleespmpt = true
		function esp(plr)
			if game:GetService'Players':GetPlayerFromCharacter(plr) == nil then
				local rat = Drawing.new("Line")
				rs.RenderStepped:Connect(function()
					if plr:FindFirstChild'HumanoidRootPart' then
						local vector,screen = cam:WorldToViewportPoint(plr.HumanoidRootPart.Position)
						if screen then
							rat.Visible = toggleespmpt
							rat.From = Vector2.new(cam.ViewportSize.X / 2,cam.ViewportSize.Y / 1)
							rat.To = Vector2.new(vector.X,vector.Y)
							rat.Color = getgenv().mptespcolour
							rat.Thickness = getgenv().mptespthickness
						else
							rat.Visible = false
						end
					else
						pcall(function()
							rat.Visible = false
						end)
					end
					if not plr:FindFirstChild'HumanoidRootPart' or not plr:FindFirstChild'HumanoidRootPart':IsDescendantOf(game:GetService'Workspace') then
						pcall(function()
							rat:Remove()
						end)
					end
				end)
			end
		end

		for i,v in pairs(game:GetService'Workspace'.Game.Players:GetChildren()) do
			esp(v)
		end

		game:GetService'Workspace'.Game.Players.ChildAdded:Connect(function(plr)
			esp(plr)
		end)

		local old
		old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
			local Args = {...}
			local method = getnamecallmethod()
			if tostring(self) == 'Communicator' and method == "InvokeServer" and Args[1] == "update" then
				return Settings.Speed, Settings.Jump 
			end
			return old(self,...)
		end))

		

		game:GetService("RunService").RenderStepped:Connect(function()
			pcall(function()
				if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
					game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
				end
			end)
		end)

		OrionLib:Init()
