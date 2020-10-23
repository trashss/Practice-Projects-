-- dont delete this is for synapse and finding functions
local function FindLocal(Name)
    for I,V in pairs(getgc()) do
        if type(V) == "function" and not is_synapse_function(V) then
            for I2,V2 in pairs(debug.getupvalues(V)) do
                if I2 == Name and type(V2) == "number" then return V2 end
            end
        end
    end
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))() 
--confusing piece of shit//Gotta work on this later (10/22/20) <-- if i have time
local w = library:CreateWindow("Speed Run Simulator") -- Creates the window

local b = w:CreateFolder("Functions") -- Makes a new  folder i think idont fukenknow

local c= w:CreateFolder("Credit")

local sToggle = false


c:Label("Script: yogurts",{
    TextSize = 17; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining(RBG chart for dumbasses if udont know)
    BgColor = Color3.fromRGB(30, 30, 30); -- Self Explaining(RBG chart for dumbasses if udont know)
}) 

c:Label("UI: Aiken",{
    TextSize = 17; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining(RBG chart for dumbasses if u dont know)
    BgColor = Color3.fromRGB(30, 30, 30); -- Self Explaining(RBG chart for dumbasses if u dont know)
}) 



b:Slider("Delay: 0 - 1 Seconds",{
    min = 0; -- min value of the slider
    max = 1; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    sValue = value
end)

b:Toggle("Auto Speed",function(bool)
--[[    shared.toggle = bool
    print(shared.toggle)]]--
    sToggle = bool
end)


b:Button("Auto Rebirth",function()
    print("Auto Rebirth")
    while wait(1) do
        local rebirth = string.split(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.RebirthUI.UI.RebirthThing.Display.Text, "/") --rebirth
        local maxR = tonumber(rebirth[2])
        local currentR = tonumber(rebirth[1])

        if currentR >= maxR then
            

            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
            local args = {
                [1] = "Rebirths"
            }

            game:GetService("ReplicatedStorage").Remotes.PersonalBest:FireServer(unpack(args))
            print("Status: ".. "Rebirth  Success")
        end
    end
end)


b:DestroyGui()

--------------------------------------------------------------------------------------------------------------------------------------
--Scripts--
--Auto Speed
while wait() do
    if sToggle == true then
        wait(sValue)
        game:GetService("ReplicatedStorage").Remotes.AddSpeed:FireServer() --autofarm speed
    end
end

-------------------------------------------------------------------------------------------------------------------------
