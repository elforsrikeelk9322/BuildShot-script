local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Rayfield/refs/heads/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Blind Shot | Titan Hub",
   LoadingTitle = "Titan Hub Interface",
   LoadingSubtitle = "by Titan Dev",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "TitanHub",
      FileName = "BlindShotConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

local CombatTab = Window:CreateTab("Combat", 4483362458)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

local AimEnabled = false
local SilentAim = false
local TriggerBot = false
local NoRecoil = false
local RapidFire = false
local InfAmmo = false

CombatTab:CreateToggle({
   Name = "Aimbot Enabled",
   CurrentValue = false,
   Flag = "AimbotToggle",
   Callback = function(Value)
        AimEnabled = Value
   end,
})

CombatTab:CreateToggle({
   Name = "Silent Aim",
   CurrentValue = false,
   Flag = "SilentAimToggle",
   Callback = function(Value)
        SilentAim = Value
   end,
})

CombatTab:CreateToggle({
   Name = "Trigger Bot",
   CurrentValue = false,
   Flag = "TriggerBotToggle",
   Callback = function(Value)
        TriggerBot = Value
   end,
})

CombatTab:CreateSection("Weapon Mods")

CombatTab:CreateToggle({
   Name = "No Recoil",
   CurrentValue = false,
   Flag = "NoRecoilToggle",
   Callback = function(Value)
        NoRecoil = Value
   end,
})

CombatTab:CreateToggle({
   Name = "Infinite Ammo",
   CurrentValue = false,
   Flag = "InfAmmoToggle",
   Callback = function(Value)
        InfAmmo = Value
   end,
})

CombatTab:CreateToggle({
   Name = "Rapid Fire",
   CurrentValue = false,
   Flag = "RapidFireToggle",
   Callback = function(Value)
        RapidFire = Value
   end,
})

local ESPEnabled = false
local BoxESP = false
local NameESP = false
local TracerESP = false
local SkeletonESP = false
local FullBright = false

VisualsTab:CreateToggle({
   Name = "Enable ESP",
   CurrentValue = false,
   Flag = "ESPToggle",
   Callback = function(Value)
        ESPEnabled = Value
   end,
})

VisualsTab:CreateToggle({
   Name = "Box ESP",
   CurrentValue = false,
   Flag = "BoxESPToggle",
   Callback = function(Value)
        BoxESP = Value
   end,
})

VisualsTab:CreateToggle({
   Name = "Name ESP",
   CurrentValue = false,
   Flag = "NameESPToggle",
   Callback = function(Value)
        NameESP = Value
   end,
})

VisualsTab:CreateToggle({
   Name = "Tracers",
   CurrentValue = false,
   Flag = "TracersToggle",
   Callback = function(Value)
        TracerESP = Value
   end,
})

VisualsTab:CreateToggle({
   Name = "Skeleton ESP",
   CurrentValue = false,
   Flag = "SkeletonESPToggle",
   Callback = function(Value)
        SkeletonESP = Value
   end,
})

VisualsTab:CreateSection("World Visuals")

VisualsTab:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
   Flag = "FullbrightToggle",
   Callback = function(Value)
        FullBright = Value
        if FullBright then
            game.Lighting.Brightness = 2
            game.Lighting.ClockTime = 14
            game.Lighting.FogEnd = 100000
            game.Lighting.GlobalShadows = false
            game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            game.Lighting.Brightness = 1
            game.Lighting.ClockTime = 14
            game.Lighting.FogEnd = 10000
            game.Lighting.GlobalShadows = true
            game.Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        end
   end,
})

local WalkSpeedVal = 16
local JumpPowerVal = 50
local Noclip = false
local InfJump = false
local Fly = false

PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 250},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider",
   Callback = function(Value)
        WalkSpeedVal = Value
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
   end,
})

PlayerTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 300},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "JumpPowerSlider",
   Callback = function(Value)
        JumpPowerVal = Value
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
   end,
})

PlayerTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJumpToggle",
   Callback = function(Value)
        InfJump = Value
   end,
})

PlayerTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
        Noclip = Value
   end,
})

PlayerTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "FlyToggle",
   Callback = function(Value)
        Fly = Value
   end,
})

PlayerTab:CreateButton({
   Name = "Reset Character",
   Callback = function()
        game.Players.LocalPlayer.Character:BreakJoints()
   end,
})

MiscTab:CreateButton({
   Name = "Unlock All Skins",
   Callback = function()
   end,
})

MiscTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
   end,
})

MiscTab:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
   end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if Noclip then
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

Rayfield:LoadConfiguration()