-- DO NOT SHARE THIS. THE EXECUTION WILL BE LOGGED AND YOUR KEY WILL GET BLACKLISTED!!!
_G.key = "key not needed" -- Put your key inside the quotes. "my-key-here"

-- KILLAURA METHOD, METHOD 2 MIGHT BE LESS LAGGY, BUT ALSO NOT AS EFFECTIVE!
_G.usemethod2 = false

-- RIGHT SHIFT TO TOGGLE GUI!
_G.enabled = false
_G.antiparry = false
_G.stompaura = false
_G.drawlines = false
_G.range = 15
_G.autohit = false
_G.autospawn = false
_G.followclosest = false
_G.autoequip = false
_G.autojump = false
_G.boostws = false
_G.killsay = false
_G.usehitbox = 10
_G.esp = false
_G.usecustomaudio = true
_G.tpOverHead = false -- THIS ONLY WORKS ON KILLAURA METHOD 2!!!

-- If the script is lagging you, try putting this to 3 or higher. Lower value = more consistant killaura hits but more lag.
_G.loopspeed = 2

function addLine(myHrp, theirHrp)
	if not theirHrp.Parent.Torso:FindFirstChild("Beam") then
		if _G.drawlines == true then
			local beam = Instance.new("Beam", theirHrp.Parent.Torso)
			local att0 = Instance.new("Attachment", theirHrp.Parent.Torso)
			local att1 = Instance.new("Attachment", myHrp)

			beam.Attachment0 = att0
			beam.Attachment1 = att1

			beam.Width0 = 0.2
			beam.Width1 = 0.2

			beam.LightEmission = 1
			beam.LightInfluence = 0

			beam.FaceCamera = true

			if theirHrp.Parent.Humanoid.Health <= 15 then
				beam.Color = ColorSequence.new(Color3.fromRGB(255,0,0),Color3.fromRGB(255,0,0))
			else if theirHrp.Parent.Humanoid.Health >= 16 and theirHrp.Parent.Humanoid.Health <= 50 then
					beam.Color = ColorSequence.new(Color3.fromRGB(255, 170, 0),Color3.fromRGB(255, 170, 0))
				else
					beam.Color = ColorSequence.new(Color3.fromRGB(59, 255, 0),Color3.fromRGB(59, 255, 0))
				end
			end
		end
	end
end

-- shit ass esp cause im bad with drawing and math
function addEsp()
	for i,v in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if not v.HumanoidRootPart:FindFirstChild("eyeesspee") then
				local billboard = Instance.new("BillboardGui", v:WaitForChild("Head"))
				billboard.LightInfluence = 0
				billboard.Size = UDim2.new(40, 40, 1, 1)
				billboard.StudsOffset = Vector3.new(0, 3, 0)
				billboard.ZIndexBehavior = "Global"
				billboard.ClipsDescendants = false
				billboard.AlwaysOnTop = true
				billboard.Name = "Head"

				local billboard2 = Instance.new("BillboardGui", v:WaitForChild("HumanoidRootPart"))
				billboard2.LightInfluence = 0
				billboard2.Size = UDim2.new(3, 3, 5, 5)
				billboard2.StudsOffset = Vector3.new(0, 0, 0)
				billboard2.ZIndexBehavior = "Global"
				billboard2.ClipsDescendants = false
				billboard2.AlwaysOnTop = true
				billboard2.Name = "eyeesspee"

				local textBox = Instance.new("TextBox", billboard)
				textBox.BackgroundTransparency = 1
				textBox.ClearTextOnFocus = false
				textBox.MultiLine = true
				textBox.Size = UDim2.new(1, 1, 1, 1)
				textBox.Font = "GothamBold"
				textBox.Text = v.Name
				textBox.TextScaled = true
				textBox.TextYAlignment = "Top"
				textBox.TextColor3 = Color3.fromRGB(255, 55, 55)

				local textBox2 = Instance.new("TextBox", billboard2)
				textBox2.BackgroundTransparency = 1
				textBox2.ClearTextOnFocus = false
				textBox2.MultiLine = true
				textBox2.Size = UDim2.new(1, 1, 1, 1)
				textBox2.Font = "GothamBold"
				textBox2.Text = " "
				textBox2.BackgroundTransparency = 0.85
				textBox2.TextScaled = true
				textBox2.TextYAlignment = "Top"
				textBox2.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
			end
		end
	end
end

function removeEsp()
	for i,v in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if v.HumanoidRootPart:FindFirstChild("eyeesspee") then
				v.HumanoidRootPart:FindFirstChild("eyeesspee"):Destroy()
				v.Head.Head:Destroy()
			end
		end
	end
end

function randomPlayer()
	math.randomseed(os.time())
	local RandomPlayer = game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())]
	return RandomPlayer.DisplayName
end

local tableOfShit = {"why am i writing these messages when i can continue making the script better?! 🤣🤣😂🤣😂🤣🤣","do you ever have problems with light users parrying your ds??? get warriorhook! it has a great anti parry that works! (sometimes..)","get warriorhook!!!","oh im sorry, did i killaura you? i can whitelist you if you want boo 🥺🥺🥺🥺","🤣🤣😂🤣🤣","hey ".. randomPlayer() ..", is your dad spiderman? cause he far from home.","EZ EZ EZ EZ EZ","are you even trying?? lulululul","damn bro you got the whole squad cringing","omg ".. randomPlayer() .. " im your biggest fan!!!","how are you that bad??🤣🤣😂🤣🤣","dont even bother insulting me 🤣🤣😂 im not even touching my keyboard!!","oh god... not ".. randomPlayer() .." again...","OMG!! IS THAT THE FAMOUS ".. randomPlayer() .. "???","vex really thinks this is gonna work...", "haha got you!!!", "who the hell is vex? oh the creator of this crap script?", "get reck't noobie", "warriorhook on top!!! (not really)", "project hook has some pretty cool features","Y1K is daddy 😋😋😋", "samuel you bozo your script is patched!!!","pls pls give vouch copy!!!", "😭 oh no! 😭😭 did i 😭😭 kill your mans?? 😭😭😭😭", "you: 😭😭 noooo i got murdered by a lvl ".. game.Players.LocalPlayer.leaderstats.Level.Value.."!!!", "oh my god im so sorry for killing you 😭😭😭😭😭😭😭", "oh 😭😭 did i hurt your 😭😭 feelings???", "get good with project hoo- i mean with warriorhook!!!", "samuel no one cares about criminality!!!😭😭", "who even wrote this crappy code??😭", "this script was brought to you by raid shadow legends!!", "do you like cheese?", "😭😭 imagine 😭😭 dying 😭😭", "get killaura'd!!!", "oh no 😭😭 did i kill your 😭😭 girl?? 😭😭😭"}

local function RandomString(t)
	return t[math.random(1, #t)]
end

game.Players.LocalPlayer.leaderstats.Score.Changed:connect(function()
	if _G.killsay == true then
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(RandomString(tableOfShit),"All")
	end
end)

function remLine(theirHrp)
	if theirHrp.Parent.Torso:FindFirstChild("Beam") then
		theirHrp.Parent.Torso:FindFirstChild("Beam"):Destroy()
	end
end

function walkToClosest()
	local closestCurrent = nil
	local currentMagnitude = 999999

	local myHrp = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")

	for i, v in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if v.Humanoid.Health ~= 0 then
				local theirHrp = v:FindFirstChild("HumanoidRootPart")
				if (myHrp.Position - theirHrp.Position).Magnitude < currentMagnitude then
					if theirHrp.Parent.Humanoid.Health ~= 0 then
						currentMagnitude = (myHrp.Position - theirHrp.Position).Magnitude
						closestCurrent = theirHrp
					end
				end
			end
		end
	end

	if _G.autojump == true then
		keypress(0x20)
	end
	game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid").WalkToPoint = closestCurrent.Position
end

function getClosestHrp()
	local closestCurrent = nil
	local currentMagnitude = 999999

	local myHrp = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")

	for i, v in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if v.Humanoid.Health ~= 0 then
				local theirHrp = v:FindFirstChild("HumanoidRootPart")
				if (myHrp.Position - theirHrp.Position).Magnitude < currentMagnitude then
					if (myHrp.Position - theirHrp.Position).Magnitude <= _G.range and theirHrp.Parent.Humanoid.Health ~= 0 then
						currentMagnitude = (myHrp.Position - theirHrp.Position).Magnitude
						closestCurrent = theirHrp
						addLine(myHrp, theirHrp)
					else
						remLine(theirHrp)
					end
				end
			end
		end
	end

	return closestCurrent
end

function setAttachmentWorldCFrame(attachment, cf)
	attachment.CFrame = attachment.Parent.CFrame:toObjectSpace(cf)
end

local hittable = 0
local walktocount = 0
local espCount = 0
local canLoop = 0
local boostingws = false
local canStomp = 0

game:GetService("RunService").RenderStepped:connect(function()
	if game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") and _G.autospawn == true then
		keypress(0x20)
		keyrelease(0x20)
	end

	if _G.autoequip == true then
		if not game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool") and not game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") then
			keypress(0x31)
			keyrelease(0x31)
		end
	end

	if espCount == 60 then
		if _G.esp == true then
			addEsp()
		else
			removeEsp()
		end

		espCount = 0
	end

	espCount = espCount + 1
	canLoop = canLoop + 1
	canStomp = canStomp + 1

	if walktocount == 10 then
		if _G.followclosest == true then
			walkToClosest()
		end
		if _G.boostws == true then
			if boostingws == true then
				boostingws = false
				game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").Velocity = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart").CFrame.lookVector * (65) + Vector3.new(math.random(-40,40),0,math.random(-40,40))
			else
				boostingws = true
			end
		end
		walktocount = 0
	end

	walktocount = walktocount + 1

	if game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild("Hitbox2") then
		game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild("Hitbox2"):Destroy()
	end

	local enabled = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool"):FindFirstChild("ClientEquipProgress")

	local theirHrp = getClosestHrp()

	if _G.usemethod2 == false then
		if canLoop == _G.loopspeed or canLoop > _G.loopspeed then
			canLoop = 0
			for i,v in pairs(game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes.Hitbox:GetChildren()) do
				if i <= _G.usehitbox then
					if v.Name == "DmgPoint" then

						if _G.antiparry == true then
							if theirHrp.Parent.SemiTransparentShield.Transparency == 1 then
								enabled.Value = 1
								if _G.enabled == true then
									setAttachmentWorldCFrame(v, CFrame.new(theirHrp.Position + Vector3.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))))
								end
							else
								setAttachmentWorldCFrame(v, CFrame.new(theirHrp.Position + Vector3.new(123,123,123)))
								enabled.Value = 0
							end
						else
							if _G.enabled == true then
								setAttachmentWorldCFrame(v, CFrame.new(theirHrp.Position + Vector3.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))))
							end

						end
					end
				else
					setAttachmentWorldCFrame(v, CFrame.new(game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Head").Position + Vector3.new(0, 10, 0)))
				end
			end
		end


		if _G.stompaura == true then
			for i,s in pairs(game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren()) do
				if s.Name == "DmgPoint" then
					s.Visible = true
					if i <= _G.usehitbox then
						if theirHrp.Parent.Humanoid.Health <= 15 then
							setAttachmentWorldCFrame(s, CFrame.new(theirHrp.Position + Vector3.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))))
							if canStomp >= 30 then
								keypress(0x51)
								keyrelease(0x51)
								canStomp = 0
							end
						end
					end
				end
			end
		end
	else


		local me = game:GetService("Workspace").PlayerCharacters:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
		local hitbox = me:FindFirstChildOfClass("Tool").Hitboxes.Hitbox
		local hitboxes = me:FindFirstChildOfClass("Tool").Hitboxes
		local tool = me:FindFirstChildOfClass("Tool")
		local enabled = tool:FindFirstChild("ClientEquipProgress")

		if hitboxes:FindFirstChild("Hitbox2") then
			hitboxes:FindFirstChild("Hitbox2"):Destroy()
		end

		if _G.killaura == true then
			for i,v in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					if v:FindFirstChild("Right Arm") then
						for i,s in pairs(v:FindFirstChild("Torso"):GetChildren()) do
							if s.Name == "Right Shoulder" then
								s:Destroy()
							end
						end
						for i,s in pairs(v:FindFirstChild("Right Arm"):GetChildren()) do
							s:Destroy()
						end
						if (me.HumanoidRootPart.Position - v:FindFirstChild("Torso").Position).Magnitude <= 20 then
							if _G.tpOverHead == true then
								me.HumanoidRootPart.Anchored = true
								me.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("Head").Position + Vector3.new(0, 5, 0))
							end

							local vectorDec = math.random(9999)
							local vectorWhole = 0
							local vector = tostring(vectorWhole .. "." .. vectorDec)
							local vectorComplete = tonumber(vector)

							if v:FindFirstChild("SemiTransparentShield").Transparency == 1 then
								v:FindFirstChild("Right Arm").CFrame = hitbox.CFrame + Vector3.new(0, vectorComplete, 0)
								v:FindFirstChild("Right Arm").CanCollide = false
								enabled.Value = 1
							else
								enabled.Value = 0
							end
						else
							if _G.tpOverHead == true then
								me.HumanoidRootPart.Anchored = false
							end
						end
					end
				end
			end
		end

		if _G.stompaura == true then
			for i,s in pairs(game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren()) do
				if s.Name == "DmgPoint" then
					s.Visible = true
					if i <= _G.usehitbox then
						if theirHrp.Parent.Humanoid.Health <= 15 then
							setAttachmentWorldCFrame(s, CFrame.new(theirHrp.Position + Vector3.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))))
							if canStomp >= 30 then
								keypress(0x51)
								keyrelease(0x51)
								canStomp = 0
							end
						end
					end
				end
			end
		end

	end
end)

if _G.usecustomaudio == true then
	game:GetService("ReplicatedStorage").Shared.Assets.Sounds.HitmarkerSound.SoundId = "rbxassetid://5148302439"
	game:GetService("ReplicatedStorage").Shared.Assets.Sounds.AirdropOpen.SoundId = "rbxassetid://904663967"
	game:GetService("ReplicatedStorage").Shared.Assets.Sounds.UIClickSound.SoundId = "rbxassetid://2483029612"
	game:GetService("ReplicatedStorage").Shared.Assets.Sounds.KillSound.SoundId = "rbxassetid://165013277"
end

local warriorhook = Instance.new("ScreenGui")
local Combat = Instance.new("Frame")
local combatcontainer = Instance.new("Frame")
local Killauratext = Instance.new("TextLabel")
local killaura_unchecked = Instance.new("ImageButton")
local killaura_checked = Instance.new("ImageButton")
local Antiparrytext = Instance.new("TextLabel")
local antiparry_unchecked = Instance.new("ImageButton")
local antiparry_checked = Instance.new("ImageButton")
local Stompauratext = Instance.new("TextLabel")
local stompaura_unchecked = Instance.new("ImageButton")
local stompaura_checked = Instance.new("ImageButton")
local Autohitext = Instance.new("TextLabel")
local autohit_unchecked = Instance.new("ImageButton")
local autohit_checked = Instance.new("ImageButton")
local titlecombat = Instance.new("TextLabel")
local arrow_drop_up = Instance.new("ImageButton")
local arrow_drop_down = Instance.new("ImageButton")
local Farming = Instance.new("Frame")
local farmingcontainer = Instance.new("Frame")
local followtext = Instance.new("TextLabel")
local follow_unchecked = Instance.new("ImageButton")
local follow_checked = Instance.new("ImageButton")
local titleautofarm = Instance.new("TextLabel")
local arrow_drop_up_2 = Instance.new("ImageButton")
local arrow_drop_down_2 = Instance.new("ImageButton")
local autojumptext = Instance.new("TextLabel")
local jump_unchecked = Instance.new("ImageButton")
local jump_checked = Instance.new("ImageButton")
local autoequiptext = Instance.new("TextLabel")
local equip_unchecked = Instance.new("ImageButton")
local equip_checked = Instance.new("ImageButton")
local autospawntext = Instance.new("TextLabel")
local spawn_unchecked = Instance.new("ImageButton")
local spawn_checked = Instance.new("ImageButton")
local velocitytext = Instance.new("TextLabel")
local velocity_unchecked = Instance.new("ImageButton")
local velocity_checked = Instance.new("ImageButton")
local Misc = Instance.new("Frame")
local misccontainer = Instance.new("Frame")
local killsaytext = Instance.new("TextLabel")
local killsay_unchecked = Instance.new("ImageButton")
local killsay_checked = Instance.new("ImageButton")
local titleautofarm_2 = Instance.new("TextLabel")
local arrow_drop_up_3 = Instance.new("ImageButton")
local arrow_drop_down_3 = Instance.new("ImageButton")
local hitboxestext = Instance.new("TextLabel")
local usehitboxesint = Instance.new("TextBox")
local rangetext = Instance.new("TextLabel")
local rangeint = Instance.new("TextBox")
local drawlinestext = Instance.new("TextLabel")
local drawline_checked = Instance.new("ImageButton")
local drawline_unchecked = Instance.new("ImageButton")
local Visual = Instance.new("Frame")
local visualcontainer = Instance.new("Frame")
local esptext = Instance.new("TextLabel")
local esp_unchecked = Instance.new("ImageButton")
local esp_checked = Instance.new("ImageButton")
local visualtext = Instance.new("TextLabel")
local arrow_drop_up_4 = Instance.new("ImageButton")
local arrow_drop_down_4 = Instance.new("ImageButton")
local credits = Instance.new("TextLabel")

warriorhook.Name = "warriorhook"
warriorhook.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
warriorhook.ResetOnSpawn = false

Combat.Name = "Combat"
Combat.Parent = warriorhook
Combat.BackgroundColor3 = Color3.fromRGB(177, 126, 23)
Combat.BorderColor3 = Color3.fromRGB(27, 42, 53)
Combat.BorderSizePixel = 0
Combat.Position = UDim2.new(0.00999999978, 0, 0.00999999978, 0)
Combat.Size = UDim2.new(0, 203, 0, 36)

combatcontainer.Name = "combatcontainer"
combatcontainer.Parent = Combat
combatcontainer.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
combatcontainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
combatcontainer.BorderSizePixel = 0
combatcontainer.Position = UDim2.new(0, 0, 0.983999908, 0)
combatcontainer.Size = UDim2.new(0, 203, 0, 147)

Killauratext.Name = "Killauratext"
Killauratext.Parent = combatcontainer
Killauratext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Killauratext.BackgroundTransparency = 1.000
Killauratext.Position = UDim2.new(0, 0, 0.0204081628, 0)
Killauratext.Size = UDim2.new(0.802955687, 0, 0.25170067, 0)
Killauratext.Font = Enum.Font.Jura
Killauratext.Text = "杀死光环"
Killauratext.TextColor3 = Color3.fromRGB(255, 255, 255)
Killauratext.TextSize = 31.000

killaura_unchecked.Name = "killaura_unchecked"
killaura_unchecked.Parent = Killauratext
killaura_unchecked.BackgroundTransparency = 1.000
killaura_unchecked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
killaura_unchecked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
killaura_unchecked.ZIndex = 2
killaura_unchecked.Image = "rbxassetid://3926309567"
killaura_unchecked.ImageRectOffset = Vector2.new(628, 420)
killaura_unchecked.ImageRectSize = Vector2.new(48, 48)

killaura_checked.Name = "killaura_checked"
killaura_checked.Parent = Killauratext
killaura_checked.BackgroundTransparency = 1.000
killaura_checked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
killaura_checked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
killaura_checked.Visible = false
killaura_checked.ZIndex = 2
killaura_checked.Image = "rbxassetid://3926309567"
killaura_checked.ImageRectOffset = Vector2.new(784, 420)
killaura_checked.ImageRectSize = Vector2.new(48, 48)

Antiparrytext.Name = "Antiparrytext"
Antiparrytext.Parent = combatcontainer
Antiparrytext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Antiparrytext.BackgroundTransparency = 1.000
Antiparrytext.Position = UDim2.new(0, 0, 0.258503407, 0)
Antiparrytext.Size = UDim2.new(0.802955687, 0, 0.25170067, 0)
Antiparrytext.Font = Enum.Font.Jura
Antiparrytext.Text = "反招架"
Antiparrytext.TextColor3 = Color3.fromRGB(255, 255, 255)
Antiparrytext.TextSize = 31.000

antiparry_unchecked.Name = "antiparry_unchecked"
antiparry_unchecked.Parent = Antiparrytext
antiparry_unchecked.BackgroundTransparency = 1.000
antiparry_unchecked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
antiparry_unchecked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
antiparry_unchecked.ZIndex = 2
antiparry_unchecked.Image = "rbxassetid://3926309567"
antiparry_unchecked.ImageRectOffset = Vector2.new(628, 420)
antiparry_unchecked.ImageRectSize = Vector2.new(48, 48)

antiparry_checked.Name = "antiparry_checked"
antiparry_checked.Parent = Antiparrytext
antiparry_checked.BackgroundTransparency = 1.000
antiparry_checked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
antiparry_checked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
antiparry_checked.Visible = false
antiparry_checked.ZIndex = 2
antiparry_checked.Image = "rbxassetid://3926309567"
antiparry_checked.ImageRectOffset = Vector2.new(784, 420)
antiparry_checked.ImageRectSize = Vector2.new(48, 48)

Stompauratext.Name = "Stompauratext"
Stompauratext.Parent = combatcontainer
Stompauratext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stompauratext.BackgroundTransparency = 1.000
Stompauratext.Position = UDim2.new(0, 0, 0.496598631, 0)
Stompauratext.Size = UDim2.new(0.802955687, 0, 0.25170067, 0)
Stompauratext.Font = Enum.Font.Jura
Stompauratext.Text = "踩踏光环"
Stompauratext.TextColor3 = Color3.fromRGB(255, 255, 255)
Stompauratext.TextSize = 31.000

stompaura_unchecked.Name = "stompaura_unchecked"
stompaura_unchecked.Parent = Stompauratext
stompaura_unchecked.BackgroundTransparency = 1.000
stompaura_unchecked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
stompaura_unchecked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
stompaura_unchecked.ZIndex = 2
stompaura_unchecked.Image = "rbxassetid://3926309567"
stompaura_unchecked.ImageRectOffset = Vector2.new(628, 420)
stompaura_unchecked.ImageRectSize = Vector2.new(48, 48)

stompaura_checked.Name = "stompaura_checked"
stompaura_checked.Parent = Stompauratext
stompaura_checked.BackgroundTransparency = 1.000
stompaura_checked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
stompaura_checked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
stompaura_checked.Visible = false
stompaura_checked.ZIndex = 2
stompaura_checked.Image = "rbxassetid://3926309567"
stompaura_checked.ImageRectOffset = Vector2.new(784, 420)
stompaura_checked.ImageRectSize = Vector2.new(48, 48)

Autohitext.Name = "Autohitext"
Autohitext.Parent = combatcontainer
Autohitext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Autohitext.BackgroundTransparency = 1.000
Autohitext.Position = UDim2.new(0, 0, 0.734693885, 0)
Autohitext.Size = UDim2.new(0.802955687, 0, 0.25170067, 0)
Autohitext.Font = Enum.Font.Jura
Autohitext.Text = "自动命中"
Autohitext.TextColor3 = Color3.fromRGB(255, 255, 255)
Autohitext.TextSize = 31.000

autohit_unchecked.Name = "autohit_unchecked"
autohit_unchecked.Parent = Autohitext
autohit_unchecked.BackgroundTransparency = 1.000
autohit_unchecked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
autohit_unchecked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
autohit_unchecked.ZIndex = 2
autohit_unchecked.Image = "rbxassetid://3926309567"
autohit_unchecked.ImageRectOffset = Vector2.new(628, 420)
autohit_unchecked.ImageRectSize = Vector2.new(48, 48)

autohit_checked.Name = "autohit_checked"
autohit_checked.Parent = Autohitext
autohit_checked.BackgroundTransparency = 1.000
autohit_checked.Position = UDim2.new(0.994049072, 0, 0.00999999978, 0)
autohit_checked.Size = UDim2.new(0.21472393, 0, 0.945945919, 0)
autohit_checked.Visible = false
autohit_checked.ZIndex = 2
autohit_checked.Image = "rbxassetid://3926309567"
autohit_checked.ImageRectOffset = Vector2.new(784, 420)
autohit_checked.ImageRectSize = Vector2.new(48, 48)

titlecombat.Name = "titlecombat"
titlecombat.Parent = combatcontainer
titlecombat.BackgroundColor3 = Color3.fromRGB(255, 182, 34)
titlecombat.BorderSizePixel = 0
titlecombat.Position = UDim2.new(0, 0, -0.244897962, 0)
titlecombat.Size = UDim2.new(0, 203, 0, 28)
titlecombat.Font = Enum.Font.Jura
titlecombat.Text = "战斗"
titlecombat.TextColor3 = Color3.fromRGB(255, 255, 255)
titlecombat.TextSize = 26.000

arrow_drop_up.Name = "arrow_drop_up"
arrow_drop_up.Parent = titlecombat
arrow_drop_up.BackgroundTransparency = 1.000
arrow_drop_up.Position = UDim2.new(0.874384344, 0, -1.37835741e-07, 0)
arrow_drop_up.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_up.ZIndex = 2
arrow_drop_up.Image = "rbxassetid://3926307971"
arrow_drop_up.ImageRectOffset = Vector2.new(164, 484)
arrow_drop_up.ImageRectSize = Vector2.new(36, 36)

arrow_drop_down.Name = "arrow_drop_down"
arrow_drop_down.Parent = titlecombat
arrow_drop_down.BackgroundTransparency = 1.000
arrow_drop_down.Position = UDim2.new(0.874384224, 0, 1.11758709e-08, 0)
arrow_drop_down.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_down.Visible = false
arrow_drop_down.ZIndex = 2
arrow_drop_down.Image = "rbxassetid://3926307971"
arrow_drop_down.ImageRectOffset = Vector2.new(324, 524)
arrow_drop_down.ImageRectSize = Vector2.new(36, 36)

Farming.Name = "Farming"
Farming.Parent = warriorhook
Farming.BackgroundColor3 = Color3.fromRGB(177, 126, 23)
Farming.BorderColor3 = Color3.fromRGB(27, 42, 53)
Farming.BorderSizePixel = 0
Farming.Position = UDim2.new(0.202095598, 0, 0.00999999978, 0)
Farming.Size = UDim2.new(0, 203, 0, 36)

farmingcontainer.Name = "farmingcontainer"
farmingcontainer.Parent = Farming
farmingcontainer.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
farmingcontainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
farmingcontainer.BorderSizePixel = 0
farmingcontainer.Position = UDim2.new(0, 0, 0.984000325, 0)
farmingcontainer.Size = UDim2.new(0, 203, 0, 189)

followtext.Name = "followtext"
followtext.Parent = farmingcontainer
followtext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
followtext.BackgroundTransparency = 1.000
followtext.Position = UDim2.new(0, 0, 0, 2)
followtext.Size = UDim2.new(0, 163, 0, 37)
followtext.Font = Enum.Font.Jura
followtext.Text = "跟随"
followtext.TextColor3 = Color3.fromRGB(255, 255, 255)
followtext.TextSize = 31.000

follow_unchecked.Name = "follow_unchecked"
follow_unchecked.Parent = followtext
follow_unchecked.BackgroundTransparency = 1.000
follow_unchecked.Position = UDim2.new(0, 162, 0, 0)
follow_unchecked.Size = UDim2.new(0, 35, 0, 35)
follow_unchecked.ZIndex = 2
follow_unchecked.Image = "rbxassetid://3926309567"
follow_unchecked.ImageRectOffset = Vector2.new(628, 420)
follow_unchecked.ImageRectSize = Vector2.new(48, 48)

follow_checked.Name = "follow_checked"
follow_checked.Parent = followtext
follow_checked.BackgroundTransparency = 1.000
follow_checked.Position = UDim2.new(0, 162, 0, 0)
follow_checked.Size = UDim2.new(0, 35, 0, 35)
follow_checked.Visible = false
follow_checked.ZIndex = 2
follow_checked.Image = "rbxassetid://3926309567"
follow_checked.ImageRectOffset = Vector2.new(784, 420)
follow_checked.ImageRectSize = Vector2.new(48, 48)

titleautofarm.Name = "titleautofarm"
titleautofarm.Parent = farmingcontainer
titleautofarm.BackgroundColor3 = Color3.fromRGB(255, 182, 34)
titleautofarm.BorderSizePixel = 0
titleautofarm.Position = UDim2.new(0, 0, 0, -36)
titleautofarm.Size = UDim2.new(0, 203, 0, 28)
titleautofarm.Font = Enum.Font.Jura
titleautofarm.Text = "农业"
titleautofarm.TextColor3 = Color3.fromRGB(255, 255, 255)
titleautofarm.TextSize = 26.000

arrow_drop_up_2.Name = "arrow_drop_up"
arrow_drop_up_2.Parent = titleautofarm
arrow_drop_up_2.BackgroundTransparency = 1.000
arrow_drop_up_2.Position = UDim2.new(0, 177, 0, 0)
arrow_drop_up_2.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_up_2.ZIndex = 2
arrow_drop_up_2.Image = "rbxassetid://3926307971"
arrow_drop_up_2.ImageRectOffset = Vector2.new(164, 484)
arrow_drop_up_2.ImageRectSize = Vector2.new(36, 36)

arrow_drop_down_2.Name = "arrow_drop_down"
arrow_drop_down_2.Parent = titleautofarm
arrow_drop_down_2.BackgroundTransparency = 1.000
arrow_drop_down_2.Position = UDim2.new(0, 177, 0, 0)
arrow_drop_down_2.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_down_2.Visible = false
arrow_drop_down_2.ZIndex = 2
arrow_drop_down_2.Image = "rbxassetid://3926307971"
arrow_drop_down_2.ImageRectOffset = Vector2.new(324, 524)
arrow_drop_down_2.ImageRectSize = Vector2.new(36, 36)

autojumptext.Name = "autojumptext"
autojumptext.Parent = farmingcontainer
autojumptext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autojumptext.BackgroundTransparency = 1.000
autojumptext.Position = UDim2.new(0, 0, 0, 39)
autojumptext.Size = UDim2.new(0, 163, 0, 37)
autojumptext.Font = Enum.Font.Jura
autojumptext.Text = "自动跳越"
autojumptext.TextColor3 = Color3.fromRGB(255, 255, 255)
autojumptext.TextSize = 31.000

jump_unchecked.Name = "jump_unchecked"
jump_unchecked.Parent = autojumptext
jump_unchecked.BackgroundTransparency = 1.000
jump_unchecked.Position = UDim2.new(0, 162, 0, 0)
jump_unchecked.Size = UDim2.new(0, 35, 0, 35)
jump_unchecked.ZIndex = 2
jump_unchecked.Image = "rbxassetid://3926309567"
jump_unchecked.ImageRectOffset = Vector2.new(628, 420)
jump_unchecked.ImageRectSize = Vector2.new(48, 48)

jump_checked.Name = "jump_checked"
jump_checked.Parent = autojumptext
jump_checked.BackgroundTransparency = 1.000
jump_checked.Position = UDim2.new(0, 162, 0, 0)
jump_checked.Size = UDim2.new(0, 35, 0, 35)
jump_checked.Visible = false
jump_checked.ZIndex = 2
jump_checked.Image = "rbxassetid://3926309567"
jump_checked.ImageRectOffset = Vector2.new(784, 420)
jump_checked.ImageRectSize = Vector2.new(48, 48)

autoequiptext.Name = "autoequiptext"
autoequiptext.Parent = farmingcontainer
autoequiptext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoequiptext.BackgroundTransparency = 1.000
autoequiptext.Position = UDim2.new(0, 0, 0, 76)
autoequiptext.Size = UDim2.new(0, 163, 0, 37)
autoequiptext.Font = Enum.Font.Jura
autoequiptext.Text = "自动装备"
autoequiptext.TextColor3 = Color3.fromRGB(255, 255, 255)
autoequiptext.TextSize = 31.000

equip_unchecked.Name = "equip_unchecked"
equip_unchecked.Parent = autoequiptext
equip_unchecked.BackgroundTransparency = 1.000
equip_unchecked.Position = UDim2.new(0, 162, 0, 0)
equip_unchecked.Size = UDim2.new(0, 35, 0, 35)
equip_unchecked.ZIndex = 2
equip_unchecked.Image = "rbxassetid://3926309567"
equip_unchecked.ImageRectOffset = Vector2.new(628, 420)
equip_unchecked.ImageRectSize = Vector2.new(48, 48)

equip_checked.Name = "equip_checked"
equip_checked.Parent = autoequiptext
equip_checked.BackgroundTransparency = 1.000
equip_checked.Position = UDim2.new(0, 162, 0, 0)
equip_checked.Size = UDim2.new(0, 35, 0, 35)
equip_checked.Visible = false
equip_checked.ZIndex = 2
equip_checked.Image = "rbxassetid://3926309567"
equip_checked.ImageRectOffset = Vector2.new(784, 420)
equip_checked.ImageRectSize = Vector2.new(48, 48)

autospawntext.Name = "autospawntext"
autospawntext.Parent = farmingcontainer
autospawntext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autospawntext.BackgroundTransparency = 1.000
autospawntext.Position = UDim2.new(0, 0, 0, 113)
autospawntext.Size = UDim2.new(0, 163, 0, 37)
autospawntext.Font = Enum.Font.Jura
autospawntext.Text = "自动重生"
autospawntext.TextColor3 = Color3.fromRGB(255, 255, 255)
autospawntext.TextSize = 31.000

spawn_unchecked.Name = "spawn_unchecked"
spawn_unchecked.Parent = autospawntext
spawn_unchecked.BackgroundTransparency = 1.000
spawn_unchecked.Position = UDim2.new(0, 162, 0, 0)
spawn_unchecked.Size = UDim2.new(0, 35, 0, 35)
spawn_unchecked.ZIndex = 2
spawn_unchecked.Image = "rbxassetid://3926309567"
spawn_unchecked.ImageRectOffset = Vector2.new(628, 420)
spawn_unchecked.ImageRectSize = Vector2.new(48, 48)

spawn_checked.Name = "spawn_checked"
spawn_checked.Parent = autospawntext
spawn_checked.BackgroundTransparency = 1.000
spawn_checked.Position = UDim2.new(0, 162, 0, 0)
spawn_checked.Size = UDim2.new(0, 35, 0, 35)
spawn_checked.Visible = false
spawn_checked.ZIndex = 2
spawn_checked.Image = "rbxassetid://3926309567"
spawn_checked.ImageRectOffset = Vector2.new(784, 420)
spawn_checked.ImageRectSize = Vector2.new(48, 48)

velocitytext.Name = "velocitytext"
velocitytext.Parent = farmingcontainer
velocitytext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
velocitytext.BackgroundTransparency = 1.000
velocitytext.Position = UDim2.new(0, 0, 0, 150)
velocitytext.Size = UDim2.new(0, 163, 0, 37)
velocitytext.Font = Enum.Font.Jura
velocitytext.Text = "速度"
velocitytext.TextColor3 = Color3.fromRGB(255, 255, 255)
velocitytext.TextSize = 31.000

velocity_unchecked.Name = "velocity_unchecked"
velocity_unchecked.Parent = velocitytext
velocity_unchecked.BackgroundTransparency = 1.000
velocity_unchecked.Position = UDim2.new(0, 162, 0, 0)
velocity_unchecked.Size = UDim2.new(0, 35, 0, 35)
velocity_unchecked.ZIndex = 2
velocity_unchecked.Image = "rbxassetid://3926309567"
velocity_unchecked.ImageRectOffset = Vector2.new(628, 420)
velocity_unchecked.ImageRectSize = Vector2.new(48, 48)

velocity_checked.Name = "velocity_checked"
velocity_checked.Parent = velocitytext
velocity_checked.BackgroundTransparency = 1.000
velocity_checked.Position = UDim2.new(0, 162, 0, 0)
velocity_checked.Size = UDim2.new(0, 35, 0, 35)
velocity_checked.Visible = false
velocity_checked.ZIndex = 2
velocity_checked.Image = "rbxassetid://3926309567"
velocity_checked.ImageRectOffset = Vector2.new(784, 420)
velocity_checked.ImageRectSize = Vector2.new(48, 48)

Misc.Name = "Misc"
Misc.Parent = warriorhook
Misc.BackgroundColor3 = Color3.fromRGB(177, 126, 23)
Misc.BorderColor3 = Color3.fromRGB(27, 42, 53)
Misc.BorderSizePixel = 0
Misc.Position = UDim2.new(0.395110279, 0, 0.00820788555, 0)
Misc.Size = UDim2.new(0, 203, 0, 36)

misccontainer.Name = "misccontainer"
misccontainer.Parent = Misc
misccontainer.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
misccontainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
misccontainer.BorderSizePixel = 0
misccontainer.Position = UDim2.new(0, 0, 0.984000325, 0)
misccontainer.Size = UDim2.new(0, 203, 0, 151)

killsaytext.Name = "killsaytext"
killsaytext.Parent = misccontainer
killsaytext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
killsaytext.BackgroundTransparency = 1.000
killsaytext.Position = UDim2.new(0, 0, 0, 2)
killsaytext.Size = UDim2.new(0, 163, 0, 37)
killsaytext.Font = Enum.Font.Jura
killsaytext.Text = "杀说"
killsaytext.TextColor3 = Color3.fromRGB(255, 255, 255)
killsaytext.TextSize = 31.000

killsay_unchecked.Name = "killsay_unchecked"
killsay_unchecked.Parent = killsaytext
killsay_unchecked.BackgroundTransparency = 1.000
killsay_unchecked.Position = UDim2.new(0, 162, 0, 0)
killsay_unchecked.Size = UDim2.new(0, 35, 0, 35)
killsay_unchecked.ZIndex = 2
killsay_unchecked.Image = "rbxassetid://3926309567"
killsay_unchecked.ImageRectOffset = Vector2.new(628, 420)
killsay_unchecked.ImageRectSize = Vector2.new(48, 48)

killsay_checked.Name = "killsay_checked"
killsay_checked.Parent = killsaytext
killsay_checked.BackgroundTransparency = 1.000
killsay_checked.Position = UDim2.new(0, 162, 0, 0)
killsay_checked.Size = UDim2.new(0, 35, 0, 35)
killsay_checked.Visible = false
killsay_checked.ZIndex = 2
killsay_checked.Image = "rbxassetid://3926309567"
killsay_checked.ImageRectOffset = Vector2.new(784, 420)
killsay_checked.ImageRectSize = Vector2.new(48, 48)

titleautofarm_2.Name = "titleautofarm"
titleautofarm_2.Parent = misccontainer
titleautofarm_2.BackgroundColor3 = Color3.fromRGB(255, 182, 34)
titleautofarm_2.BorderSizePixel = 0
titleautofarm_2.Position = UDim2.new(0, 0, 0, -35)
titleautofarm_2.Size = UDim2.new(0, 203, 0, 28)
titleautofarm_2.Font = Enum.Font.Jura
titleautofarm_2.Text = "杂项"
titleautofarm_2.TextColor3 = Color3.fromRGB(255, 255, 255)
titleautofarm_2.TextSize = 26.000

arrow_drop_up_3.Name = "arrow_drop_up"
arrow_drop_up_3.Parent = titleautofarm_2
arrow_drop_up_3.BackgroundTransparency = 1.000
arrow_drop_up_3.Position = UDim2.new(0, 177, 0, 0)
arrow_drop_up_3.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_up_3.ZIndex = 2
arrow_drop_up_3.Image = "rbxassetid://3926307971"
arrow_drop_up_3.ImageRectOffset = Vector2.new(164, 484)
arrow_drop_up_3.ImageRectSize = Vector2.new(36, 36)

arrow_drop_down_3.Name = "arrow_drop_down"
arrow_drop_down_3.Parent = titleautofarm_2
arrow_drop_down_3.BackgroundTransparency = 1.000
arrow_drop_down_3.Position = UDim2.new(0, 177, 0, 0)
arrow_drop_down_3.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_down_3.Visible = false
arrow_drop_down_3.ZIndex = 2
arrow_drop_down_3.Image = "rbxassetid://3926307971"
arrow_drop_down_3.ImageRectOffset = Vector2.new(324, 524)
arrow_drop_down_3.ImageRectSize = Vector2.new(36, 36)

hitboxestext.Name = "hitboxestext"
hitboxestext.Parent = misccontainer
hitboxestext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hitboxestext.BackgroundTransparency = 1.000
hitboxestext.Position = UDim2.new(0, 0, 0, 40)
hitboxestext.Size = UDim2.new(0, 163, 0, 37)
hitboxestext.Font = Enum.Font.Jura
hitboxestext.Text = "命中框"
hitboxestext.TextColor3 = Color3.fromRGB(255, 255, 255)
hitboxestext.TextSize = 31.000

usehitboxesint.Name = "usehitboxesint"
usehitboxesint.Parent = hitboxestext
usehitboxesint.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
usehitboxesint.BorderSizePixel = 0
usehitboxesint.Position = UDim2.new(0.993139684, 0, 0.0330328941, 0)
usehitboxesint.Size = UDim2.new(0, 35, 0, 35)
usehitboxesint.ClearTextOnFocus = false
usehitboxesint.Font = Enum.Font.Jura
usehitboxesint.Text = "8"
usehitboxesint.TextColor3 = Color3.fromRGB(255, 255, 255)
usehitboxesint.TextSize = 35.000

rangetext.Name = "rangetext"
rangetext.Parent = misccontainer
rangetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rangetext.BackgroundTransparency = 1.000
rangetext.Position = UDim2.new(0, 0, 0, 77)
rangetext.Size = UDim2.new(0, 163, 0, 37)
rangetext.Font = Enum.Font.Jura
rangetext.Text = "范围"
rangetext.TextColor3 = Color3.fromRGB(255, 255, 255)
rangetext.TextSize = 31.000

rangeint.Name = "rangeint"
rangeint.Parent = rangetext
rangeint.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
rangeint.BorderSizePixel = 0
rangeint.Position = UDim2.new(0.993139684, 0, 0.0330328941, 0)
rangeint.Size = UDim2.new(0, 35, 0, 35)
rangeint.ClearTextOnFocus = false
rangeint.Font = Enum.Font.Jura
rangeint.Text = "15"
rangeint.TextColor3 = Color3.fromRGB(255, 255, 255)
rangeint.TextSize = 35.000

drawlinestext.Name = "drawlinestext"
drawlinestext.Parent = misccontainer
drawlinestext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
drawlinestext.BackgroundTransparency = 1.000
drawlinestext.Position = UDim2.new(0, 0, 0, 114)
drawlinestext.Size = UDim2.new(0, 163, 0, 37)
drawlinestext.Font = Enum.Font.Jura
drawlinestext.Text = "画线"
drawlinestext.TextColor3 = Color3.fromRGB(255, 255, 255)
drawlinestext.TextSize = 31.000

drawline_checked.Name = "drawline_checked"
drawline_checked.Parent = drawlinestext
drawline_checked.BackgroundTransparency = 1.000
drawline_checked.Position = UDim2.new(0, 163, 0, 2)
drawline_checked.Size = UDim2.new(0, 35, 0, 35)
drawline_checked.Visible = false
drawline_checked.ZIndex = 2
drawline_checked.Image = "rbxassetid://3926309567"
drawline_checked.ImageRectOffset = Vector2.new(784, 420)
drawline_checked.ImageRectSize = Vector2.new(48, 48)

drawline_unchecked.Name = "drawline_unchecked"
drawline_unchecked.Parent = drawlinestext
drawline_unchecked.BackgroundTransparency = 1.000
drawline_unchecked.Position = UDim2.new(0, 163, 0, 2)
drawline_unchecked.Size = UDim2.new(0, 35, 0, 35)
drawline_unchecked.ZIndex = 2
drawline_unchecked.Image = "rbxassetid://3926309567"
drawline_unchecked.ImageRectOffset = Vector2.new(628, 420)
drawline_unchecked.ImageRectSize = Vector2.new(48, 48)

Visual.Name = "Visual"
Visual.Parent = warriorhook
Visual.BackgroundColor3 = Color3.fromRGB(177, 126, 23)
Visual.BorderColor3 = Color3.fromRGB(27, 42, 53)
Visual.BorderSizePixel = 0
Visual.Position = UDim2.new(0.587205887, 0, 0.00820788555, 0)
Visual.Size = UDim2.new(0, 203, 0, 36)

visualcontainer.Name = "visualcontainer"
visualcontainer.Parent = Visual
visualcontainer.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
visualcontainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
visualcontainer.BorderSizePixel = 0
visualcontainer.Position = UDim2.new(0, 0, 0.984000325, 0)
visualcontainer.Size = UDim2.new(0, 203, 0, 41)

esptext.Name = "esptext"
esptext.Parent = visualcontainer
esptext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
esptext.BackgroundTransparency = 1.000
esptext.Position = UDim2.new(0, 0, 0, 2)
esptext.Size = UDim2.new(0, 163, 0, 37)
esptext.Font = Enum.Font.Jura
esptext.Text = "ESP"
esptext.TextColor3 = Color3.fromRGB(255, 255, 255)
esptext.TextSize = 31.000

esp_unchecked.Name = "esp_unchecked"
esp_unchecked.Parent = esptext
esp_unchecked.BackgroundTransparency = 1.000
esp_unchecked.Position = UDim2.new(0, 162, 0, 0)
esp_unchecked.Size = UDim2.new(0, 35, 0, 35)
esp_unchecked.ZIndex = 2
esp_unchecked.Image = "rbxassetid://3926309567"
esp_unchecked.ImageRectOffset = Vector2.new(628, 420)
esp_unchecked.ImageRectSize = Vector2.new(48, 48)

esp_checked.Name = "esp_checked"
esp_checked.Parent = esptext
esp_checked.BackgroundTransparency = 1.000
esp_checked.Position = UDim2.new(0, 162, 0, 0)
esp_checked.Size = UDim2.new(0, 35, 0, 35)
esp_checked.Visible = false
esp_checked.ZIndex = 2
esp_checked.Image = "rbxassetid://3926309567"
esp_checked.ImageRectOffset = Vector2.new(784, 420)
esp_checked.ImageRectSize = Vector2.new(48, 48)

visualtext.Name = "visualtext"
visualtext.Parent = visualcontainer
visualtext.BackgroundColor3 = Color3.fromRGB(255, 182, 34)
visualtext.BorderSizePixel = 0
visualtext.Position = UDim2.new(0, 0, 0, -35)
visualtext.Size = UDim2.new(0, 203, 0, 28)
visualtext.Font = Enum.Font.Jura
visualtext.Text = "视觉"
visualtext.TextColor3 = Color3.fromRGB(255, 255, 255)
visualtext.TextSize = 26.000

arrow_drop_up_4.Name = "arrow_drop_up"
arrow_drop_up_4.Parent = visualtext
arrow_drop_up_4.BackgroundTransparency = 1.000
arrow_drop_up_4.Position = UDim2.new(0, 177, 0, 0)
arrow_drop_up_4.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_up_4.ZIndex = 2
arrow_drop_up_4.Image = "rbxassetid://3926307971"
arrow_drop_up_4.ImageRectOffset = Vector2.new(164, 484)
arrow_drop_up_4.ImageRectSize = Vector2.new(36, 36)

arrow_drop_down_4.Name = "arrow_drop_down"
arrow_drop_down_4.Parent = visualtext
arrow_drop_down_4.BackgroundTransparency = 1.000
arrow_drop_down_4.Position = UDim2.new(0, 177, 0, 0)
arrow_drop_down_4.Size = UDim2.new(0, 25, 0, 25)
arrow_drop_down_4.Visible = false
arrow_drop_down_4.ZIndex = 2
arrow_drop_down_4.Image = "rbxassetid://3926307971"
arrow_drop_down_4.ImageRectOffset = Vector2.new(324, 524)
arrow_drop_down_4.ImageRectSize = Vector2.new(36, 36)

credits.Name = "credits"
credits.Parent = warriorhook
credits.BackgroundColor3 = Color3.fromRGB(255, 182, 34)
credits.BackgroundTransparency = 1.000
credits.Position = UDim2.new(0, 0, 0.956268847, 0)
credits.Size = UDim2.new(0.173143387, 0, 0.0432301834, 0)
credits.Font = Enum.Font.Jura
credits.Text = ""
credits.TextColor3 = Color3.fromRGB(255, 182, 34)
credits.TextScaled = true
credits.TextSize = 31.000
credits.TextTransparency = 0.3
credits.TextWrapped = true


--killaura
killaura_unchecked.MouseButton1Down:connect(function()
	_G.enabled = true
	killaura_unchecked.Visible = false
	killaura_checked.Visible = true
end)
killaura_checked.MouseButton1Down:connect(function()
	_G.enabled = false
	killaura_unchecked.Visible = true
	killaura_checked.Visible = false
end)

--antiparry
antiparry_unchecked.MouseButton1Down:connect(function()
	_G.antiparry = true
	antiparry_unchecked.Visible = false
	antiparry_checked.Visible = true
end)
antiparry_checked.MouseButton1Down:connect(function()
	_G.antiparry = false
	antiparry_unchecked.Visible = true
	antiparry_checked.Visible = false
end)

--stompaura
stompaura_unchecked.MouseButton1Down:connect(function()
	_G.stompaura = true
	stompaura_unchecked.Visible = false
	stompaura_checked.Visible = true
end)
stompaura_checked.MouseButton1Down:connect(function()
	_G.stompaura = false
	stompaura_unchecked.Visible = true
	stompaura_checked.Visible = false
end)

--drawline
drawline_unchecked.MouseButton1Down:connect(function()
	_G.drawlines = true
	drawline_unchecked.Visible = false
	drawline_checked.Visible = true
end)
drawline_checked.MouseButton1Down:connect(function()
	_G.drawlines = false
	drawline_unchecked.Visible = true
	drawline_checked.Visible = false
end)

--autohit
autohit_unchecked.MouseButton1Down:connect(function()
	_G.autohit = true
	autohit_unchecked.Visible = false
	autohit_checked.Visible = true
end)
autohit_checked.MouseButton1Down:connect(function()
	_G.autohit = false
	autohit_unchecked.Visible = true
	autohit_checked.Visible = false
end)

--autospawn
spawn_unchecked.MouseButton1Down:connect(function()
	_G.autospawn = true
	spawn_unchecked.Visible = false
	spawn_checked.Visible = true
end)
spawn_checked.MouseButton1Down:connect(function()
	_G.autospawn = false
	spawn_unchecked.Visible = true
	spawn_checked.Visible = false
end)

--follow
follow_unchecked.MouseButton1Down:connect(function()
	_G.followclosest = true
	follow_unchecked.Visible = false
	follow_checked.Visible = true
end)
follow_checked.MouseButton1Down:connect(function()
	_G.followclosest = false
	follow_unchecked.Visible = true
	follow_checked.Visible = false
end)

--equip
equip_unchecked.MouseButton1Down:connect(function()
	_G.autoequip = true
	equip_unchecked.Visible = false
	equip_checked.Visible = true
end)
equip_checked.MouseButton1Down:connect(function()
	_G.autoequip = false
	equip_unchecked.Visible = true
	equip_checked.Visible = false
end)

--autojump
jump_unchecked.MouseButton1Down:connect(function()
	_G.autojump = true
	jump_unchecked.Visible = false
	jump_checked.Visible = true
end)
jump_checked.MouseButton1Down:connect(function()
	_G.autojump = false
	jump_unchecked.Visible = true
	jump_checked.Visible = false
end)

--velocity
velocity_unchecked.MouseButton1Down:connect(function()
	_G.boostws = true
	velocity_unchecked.Visible = false
	velocity_checked.Visible = true
end)
velocity_checked.MouseButton1Down:connect(function()
	_G.boostws = false
	velocity_unchecked.Visible = true
	velocity_checked.Visible = false
end)

--killsay
killsay_unchecked.MouseButton1Down:connect(function()
	_G.killsay = true
	killsay_unchecked.Visible = false
	killsay_checked.Visible = true
end)
killsay_checked.MouseButton1Down:connect(function()
	_G.killsay = false
	killsay_unchecked.Visible = true
	killsay_checked.Visible = false
end)

--esp
esp_unchecked.MouseButton1Down:connect(function()
	_G.esp = true
	esp_unchecked.Visible = false
	esp_checked.Visible = true
end)
esp_checked.MouseButton1Down:connect(function()
	_G.esp = false
	esp_unchecked.Visible = true
	esp_checked.Visible = false
end)

rangeint.Changed:connect(function()
	_G.range = tonumber(rangeint.Text)
	print(_G.range)
end)

usehitboxesint.Changed:connect(function()
	_G.usehitbox = tonumber(usehitboxesint.Text)
	print(_G.usehitbox)
end)

Combat.Selectable = true
Combat.Active = true
Combat.Draggable = true

Farming.Selectable = true
Farming.Active = true
Farming.Draggable = true

Misc.Selectable = true
Misc.Active = true
Misc.Draggable = true

Visual.Selectable = true
Visual.Active = true
Visual.Draggable = true

local UserInputService = game:GetService("UserInputService")

local function IsShiftKeyDown()
	return UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
end

local function IsCtrlKeyDown()
	return UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
end

local function IsAltKeyDown()
	return UserInputService:IsKeyDown(Enum.KeyCode.RightAlt)
end

local function IsJKeyDown()
	return UserInputService:IsKeyDown(Enum.KeyCode.J)
end

local function IsKKeyDown()
	return UserInputService:IsKeyDown(Enum.KeyCode.K)
end

local function IsDelKeyDown()
	return UserInputService:IsKeyDown(Enum.KeyCode.Delete)
end

local function IsPgdKeyDown()
	return UserInputService:IsKeyDown(Enum.KeyCode.PageDown)
end

local function Input(input, gameProcessedEvent)
	if IsShiftKeyDown() then
		if Combat.Visible == true then
			Combat.Visible = false
			Farming.Visible = false
			Misc.Visible = false
			Visual.Visible = false
		else
			Combat.Visible = true
			Farming.Visible = true
			Misc.Visible = true
			Visual.Visible = true
		end
	end
end

UserInputService.InputBegan:Connect(Input)