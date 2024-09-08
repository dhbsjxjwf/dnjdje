-- 检查 SimpleSpy 是否已经运行过，如果运行过则关闭
if getgenv().SimpleSpyExecuted and type(getgenv().SimpleSpyShutdown) == "function" then
    getgenv().SimpleSpyShutdown()
end

-- 配置项
local realconfigs = {
    logcheckcaller = false,  -- 是否记录调用者
    autoblock = false,      -- 是否自动屏蔽
    funcEnabled = true,      -- 是否启用函数信息
    advancedinfo = false,   -- 是否显示高级信息
    supersecretdevtoggle = false  -- 是否开启开发者模式
}

-- 创建代理以处理配置项
local configs = newproxy(true)
local configsmetatable = getmetatable(configs)

configsmetatable.__index = function(self, index)
    return realconfigs[index]
end

-- 其他代码...

-- 创建新的按钮
function SimpleSpy:newButton(name, description, onClick)
    return newButton(name, description, onClick)
end

-- 复制代码框内容
newButton(
    "复制代码",
    function() return "点击复制代码" end,
    function()
        setclipboard(codebox:getString())
        TextLabel.Text = "复制成功！"
    end
)

-- 复制触发远程的脚本路径
newButton(
    "复制远程",
    function() return "点击复制远程路径" end,
    function()
        if selected and selected.Remote then
            setclipboard(v2s(selected.Remote))
            TextLabel.Text = "复制完成！"
        end
    end
)

-- 执行代码框中的内容
newButton("运行代码",
    function() return "点击执行代码" end,
    function()
        local Remote = selected and selected.Remote
        if Remote then
            TextLabel.Text = "执行中..."
            xpcall(function()
                local returnvalue
                if Remote:IsA("RemoteEvent") then
                    returnvalue = Remote:FireServer(unpack(selected.args))
                else
                    returnvalue = Remote:InvokeServer(unpack(selected.args))
                end

                TextLabel.Text = ("执行成功！\n%s"):format(v2s(returnvalue))
            end,function(err)
                TextLabel.Text = ("执行错误！\n%s"):format(err)
            end)
            return
        end
        TextLabel.Text = "未找到源"
    end
)

-- 获取调用脚本（不太可靠）
newButton(
    "获取脚本",
    function() return "点击复制调用脚本到剪贴板\n警告：不太可靠，如果为nil则表示未找到" end,
    function()
        if selected then
            if not selected.Source then
                selected.Source = rawget(getfenv(selected.Function),"script")
            end
            setclipboard(v2s(selected.Source))
            TextLabel.Text = "完成！"
        end
    end
)

-- 清除远程日志
newButton(
    "清除日志",
    function() return "点击清除日志" end,
    function()
        TextLabel.Text = "清除中..."
        clear(logs)
        for i,v in next, LogList:GetChildren() do
            if not v:IsA("UIListLayout") then
                v:Destroy()
            end
        end
        codebox:setRaw("")
        selected = nil
        TextLabel.Text = "日志已清除！"
    end
)

-- 屏蔽选中的远程
newButton(
    "屏蔽 (i)",
    function() return "点击屏蔽这个远程\n屏蔽远程将使其被SimpleSpy忽略，但它仍然可用" end,
    function()
        if selected then
            blacklist[OldDebugId(selected.Remote)] = true
            TextLabel.Text = "已屏蔽！"
        end
    end
)

-- 屏蔽所有同名的远程
newButton(
    "屏蔽 (n)",
    function() return "点击屏蔽所有同名的远程\n屏蔽远程将使其被SimpleSpy忽略，但它仍然可用" end,
    function()
        if selected then
            blacklist[selected.Name] = true
            TextLabel.Text = "已屏蔽！"
        end
    end
)

-- 清除屏蔽列表
newButton("清除屏蔽列表",
    function() return "点击清除屏蔽列表\n屏蔽远程将使其被SimpleSpy忽略，但它仍然可用" end,
    function()
        blacklist = {}
        TextLabel.Text = "屏蔽列表已清除！"
    end
)

-- 阻止选中的远程触发服务器（仍然记录）
newButton(
    "阻止 (i)",
    function() return "点击阻止这个远程触发\n阻止远程不会从SimpleSpy日志中移除它，但它不会继续触发服务器" end,
    function()
        if selected then
            blocklist[OldDebugId(selected.Remote)] = true
            TextLabel.Text = "已阻止！"
        end
    end
)

-- 阻止所有同名的远程触发服务器（仍然记录）
newButton("阻止 (n)",function()
    return "点击阻止所有同名的远程触发\n阻止远程不会从SimpleSpy日志中移除它，但它不会继续触发服务器" end,
    function()
        if selected then
            blocklist[selected.Name] = true
            TextLabel.Text = "已阻止！"
        end
    end
)

-- 清除阻止列表
newButton(
    "清除阻止列表",
    function() return "点击停止阻止远程\n阻止远程不会从SimpleSpy日志中移除它，但它不会继续触发服务器" end,
    function()
        blocklist = {}
        TextLabel.Text = "阻止列表已清除！"
    end
)

-- 尝试反编译源脚本
newButton("反编译",
    function()
        return "反编译源脚本"
    end,function()
        if decompile then
            if selected and selected.Source then
                local Source = selected.Source
                if not DecompiledScripts[Source] then
                    codebox:setRaw("--[[反编译中]]")

                    xpcall(function()
                        local decompiledsource = decompile(Source):gsub("-- Decompiled with the Synapse X Luau decompiler.","")
                        local Sourcev2s = v2s(Source)
                        if (decompiledsource):find("script") and Sourcev2s then
                            DecompiledScripts[Source] = ("local script = %s\n%s"):format(Sourcev2s,decompiledsource)
                        end
                    end,function(err)
                        return codebox:setRaw(("--[[\n一个错误发生了\n%s\n]]"):format(err))
                    end)
                end
                codebox:setRaw(DecompiledScripts[Source] or "--未找到源")
                TextLabel.Text = "完成！"
            else
                TextLabel.Text = "未找到源！"
            end
        else
            TextLabel.Text = "缺少函数 (decompile)"
        end
    end
)

    --[[newButton(
        "returnvalue",
        function() return "Get a Remote's return data" end,
        function()
            if selected then
                local Remote = selected.Remote
                if Remote and Remote:IsA("RemoteFunction") then
                    if selected.returnvalue and selected.returnvalue.data then
                        return codebox:setRaw(v2s(selected.returnvalue.data))
                    end
                    return codebox:setRaw("No data was returned")
                else
                    codebox:setRaw("RemoteFunction expected got "..(Remote and Remote.ClassName))
                end
            end
        end
    )]]

newButton(
    "Disable Info",
    function() return string.format("[%s] Toggle function info (because it can cause lag in some games)", configs.funcEnabled and "ENABLED" or "DISABLED") end,
    function()
        configs.funcEnabled = not configs.funcEnabled
        TextLabel.Text = string.format("[%s] Toggle function info (because it can cause lag in some games)", configs.funcEnabled and "ENABLED" or "DISABLED")
    end
)

newButton(
    "Autoblock",
    function() return string.format("[%s] [BETA] Intelligently detects and excludes spammy remote calls from logs", configs.autoblock and "ENABLED" or "DISABLED") end,
    function()
        configs.autoblock = not configs.autoblock
        TextLabel.Text = string.format("[%s] [BETA] Intelligently detects and excludes spammy remote calls from logs", configs.autoblock and "ENABLED" or "DISABLED")
        history = {}
        excluding = {}
    end
)

newButton("Logcheckcaller",function()
    return ("[%s] Log remotes fired by the client"):format(configs.logcheckcaller and "ENABLED" or "DISABLED")
end,
function()
    configs.logcheckcaller = not configs.logcheckcaller
    TextLabel.Text = ("[%s] Log remotes fired by the client"):format(configs.logcheckcaller and "ENABLED" or "DISABLED")
end)

--[[newButton("Log returnvalues",function()
    return ("[BETA] [%s] Log RemoteFunction's return values"):format(configs.logcheckcaller and "ENABLED" or "DISABLED")
end,
function()
    configs.logreturnvalues = not configs.logreturnvalues
    TextLabel.Text = ("[BETA] [%s] Log RemoteFunction's return values"):format(configs.logreturnvalues and "ENABLED" or "DISABLED")
end)]]

newButton("Advanced Info",function()
    return ("[%s] Display more remoteinfo"):format(configs.advancedinfo and "ENABLED" or "DISABLED")
end,
function()
    configs.advancedinfo = not configs.advancedinfo
    TextLabel.Text = ("[%s] Display more remoteinfo"):format(configs.advancedinfo and "ENABLED" or "DISABLED")
end)

newButton("Join Discord",function()
    return "Joins The Simple Spy Discord"
end,
function()
    setclipboard("https://discord.com/invite/AWS6ez9")
    TextLabel.Text = "Copied invite to your clipboard"
    if request then
        request({Url = 'http://127.0.0.1:6463/rpc?v=1',Method = 'POST',Headers = {['Content-Type'] = 'application/json', Origin = 'https://discord.com'},Body = http:JSONEncode({cmd = 'INVITE_BROWSER',nonce = http:GenerateGUID(false),args = {code = 'AWS6ez9'}})})
    end
end)

if configs.supersecretdevtoggle then
    newButton("Load SSV2.2",function()
        return "Load's Simple Spy V2.2"
    end,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
    end)
    newButton("Load SSV3",function()
        return "Load's Simple Spy V3"
    end,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    end)
    local SuperSecretFolder = Create("Folder",{Parent = SimpleSpy3})
    newButton("SUPER SECRET BUTTON",function()
        return "You dont need a discription you already know what it does"
    end,
    function()
        SuperSecretFolder:ClearAllChildren()
        local random = listfiles("Music")
        local NotSound = Create("Sound",{Parent = SuperSecretFolder,Looped = false,Volume = math.random(1,5),SoundId = getsynasset(random[math.random(1,#random)])})
        NotSound:Play()
    end)
end