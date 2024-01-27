local KeySystemUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/dhbsjxjwf/dnjdje/main/unt.lua"))()
KeySystemUI.New({
    ApplicationName = "ShifeScripts", -- Your Key System Application Name
    Name = "ShifeScripts", -- Your Script name
    Info = "Get Key For ShifeScripts", -- Info text in the GUI, keep empty for default text.
    DiscordInvite = "", -- Optional.
    AuthType = "clientid" -- Can select verifycation with ClientId or IP ("clientid" or "ip")
})
repeat task.wait() until KeySystemUI.Finished() or KeySystemUI.Closed
if KeySystemUI.Finished() and KeySystemUI.Closed == false then
    print("Key verified, can load script")
loadstring(game:HttpGet("https://pastebin.com/raw/ubtQAA9b"))()
    -- your script
else
    print("Player closed the GUI.")
end