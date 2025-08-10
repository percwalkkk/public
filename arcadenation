-- example script by https://github.com/mstudio45/LinoriaLib/blob/main/Example.lua and modified by deivid
-- You can suggest changes with a pull request or something

local courts = workspace.Courts;
local findOpponent = function()
    local values = {court, opponent};
   for __, court in pairs (game.Workspace.Courts:GetDescendants()) do
   if string.find(court.Name, 'Player') and court.Value == game.Players.LocalPlayer.Name then
    values.court = court.Parent.Parent.Name

    if court.Name == 'Player2' then
    values.opponent = game.Players[court.Parent.Player1.Value]
        elseif court.Name == 'Player1' then
        values.opponent = game.Players[court.Parent.Player2.Value]
            end
        end
    end
    return values
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false -- Forces AddToggle to AddCheckbox
Library.ShowToggleFrameInKeybinds = true -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)

local Window = Library:CreateWindow({


	Title = "percsploit",
	Footer = "version: Arcade Basketball",
	Icon = 84596925267744,
	NotifySide = "Right",
	ShowCustomCursor = false,
})

local Tabs = {
	-- Creates a new tab titled Main
	Main = Window:AddTab("Main", "user"),
	--Key = Window:AddKeyTab("Key System"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local AimbotGroupBox = Tabs.Main:AddLeftGroupbox("Aimbots")
local OffenseGroupBox = Tabs.Main:AddLeftGroupbox("Offense")
local Offense2GroupBox = Tabs.Main:AddRightGroupbox("Offense 2")
local DefenseGroupBox = Tabs.Main:AddRightGroupbox("Defense")
local MiscGroupBox = Tabs.Main:AddRightGroupbox("Practice")


AimbotGroupBox:AddToggle("Aimbot", {
	Text = "Aimbot",
	Tooltip = "", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		getgenv().Aimbot = Value
	end,
})


local InfStam = OffenseGroupBox:AddButton({
    Text = "Infinite Stamina",
    Func = function()
        local infstam ; infstam = hookmetamethod(game, '__index', function(Self,Key)
	if Key == 'Value' and Self == game:GetService("Players").LocalPlayer.Values.Stamina then
		return math.huge
	end
	return infstam(Self,Key)
end)
    end,
    DoubleClick = false -- Requires double-click for risky actions
})


OffenseGroupBox:AddToggle("AutoSprnt", {
	Text = "Auto Sprint",
	Tooltip = "", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		getgenv().AutoSprint = Value
	end,
})

OffenseGroupBox:AddDivider()

OffenseGroupBox:AddToggle("AntiOOB", {
	Text = "Anti Out Of Bounds",
	Tooltip = "", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
	for _, part in pairs(workspace:GetDescendants()) do
    if part:IsA("BasePart") and part.Name:lower():find("outofbounds") or part.Name:lower():find("courtborder") and part:IsA("BasePart") then
        part.CanTouch = not Value
        part.CanCollide = not Value
    end
end

		Library:Notify("Anti Out of Bounds is set to " .. tostring(Value), 3)
		getgenv().AntiOOB = Value
	end,
})

OffenseGroupBox:AddDivider()

OffenseGroupBox:AddToggle("SpeedBoost", {
	Text = "Speed Boost",
	Tooltip = "", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		Library:Notify("Speed Boost is set to " .. tostring(Value), 3)
		getgenv().SpeedBoost = Value
	end,
})

local WalkSpeed = OffenseGroupBox:AddSlider("SpeedBoost", {
    Text = "Speed Boost",
    Default = 0.3,
    Min = 0.1,
    Max = 2,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
	getgenv().SpeedMultiplier = Value
    end
})

local DG = Offense2GroupBox:AddToggle("DribbleGlide", {
	Text = "Dribble Glide",
	Tooltip = "", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		getgenv().DribbleGlide = Value
		Library:Notify("Dribble Glide is set to " .. tostring(Value), 3)
	end,
})

DG:AddKeyPicker("DribbleGlideKey", {
    Default = "N",
    Mode = "Toggle",
    Text = "Dribble Glide",
    Callback = function(Value)
        DG:SetValue(Value)
    end
})

local DGSpeed = Offense2GroupBox:AddSlider("DribbleGlideSpeed", {
    Text = "Dribble Glide Speed",
    Default = 12,
    Min = 0,
    Max = 30,
    Rounding = 1,
    Compact = false,
	Disabled = true,
    Callback = function(Value)
        getgenv().GlideSpeed = Value
    end
})

local AGToggle = DefenseGroupBox:AddToggle("AutoGuard", {
	Text = "Auto Guard",
	Tooltip = "", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		Library:Notify("Auto Guard is set to " .. tostring(Value), 3)
		getgenv().AutoGuard = Value
	end,
})

AGToggle:AddKeyPicker("AutoGuardKey", {
    Default = "B",
    Mode = "Toggle",
    Text = "Auto Guard",
    Callback = function(Value)
        AGToggle:SetValue(Value)
    end
})

local ABToggle = DefenseGroupBox:AddToggle("AutoBlock", {
	Text = "Auto Block",
	Tooltip = "", -- Information shown when you hover over the toggle
	DisabledTooltip = "I am disabled!", -- Information shown when you hover over the toggle while it's disabled

	Default = false, -- Default value (true / false)
	Disabled = false, -- Will disable the toggle (true / false)
	Visible = true, -- Will make the toggle invisible (true / false)
	Risky = false, -- Makes the text red (the color can be changed using Library.Scheme.Red) (Default value = false)

	Callback = function(Value)
		Library:Notify("Auto Block is set to " .. tostring(Value), 3)
		getgenv().AutoBlock = Value
	end,
})

local GPBButton = MiscGroupBox:AddButton({
    Text = "Get Practice Ball",
    Func = function()
        local currentPos;

		currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Practice_Court.BallRack.CFrame; wait(2)
		fireproximityprompt(workspace.Practice_Court.BallRack.ProximityPrompt); wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
    end,
    DoubleClick = false -- Requires double-click for risky actions
})


local APB = MiscGroupBox:AddToggle("APB", {
    Text = "Auto Pickup Ball",
    Default = false,
    Tooltip = "Automatically grabs the closest ball to you when you don't have a ball in your hand'",
    Callback = function(Value)
        getgenv().AutoPickupBall = Value
    end
})

APB:AddKeyPicker("AutoPickupKey", {
    Default = "M",
    Mode = "Toggle",
    Text = "Auto Pickup Ball",
    Callback = function(Value)
        APB:SetValue(Value)
    end
})

-- UI Settings
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})
MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",

	Text = "Notification Side",

	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})
MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",

	Text = "DPI Scale",

	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)

		Library:SetDPIScale(DPI)
	end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

ThemeManager:SetLibrary(Library)

ThemeManager:SetDefaultTheme({
    BackgroundColor = Color3.fromRGB(15, 15, 15),
    MainColor = Color3.fromRGB(25, 25, 25),
    AccentColor = Color3.fromRGB(176, 84, 255),
    OutlineColor = Color3.fromRGB(40, 40, 40),
    FontColor = Color3.new(1, 1, 1),
    FontFace = Enum.Font.Fantasy,
})


-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place") -- if the game has multiple places inside of it (for example: DOORS)
-- you can use this to save configs for those places separately
-- The path in this script would be: MyScriptHub/specific-game/settings/specific-place
-- [ This is optional ]

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs["UI Settings"])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs["UI Settings"])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

loadstring(game:HttpGet("https://github.com/percwalkkk/ArcadeNation/raw/refs/heads/main/DribbleGlide.lua"))()
loadstring(game:HttpGet("https://github.com/percwalkkk/ArcadeNation/raw/refs/heads/main/SpeedBoost.lua"))()
loadstring(game:HttpGet("https://github.com/percwalkkk/ArcadeNation/raw/refs/heads/main/AutoSprint.lua"))()
loadstring(game:HttpGet("https://github.com/percwalkkk/ArcadeNation/raw/refs/heads/main/Aimbot.lua"))()
loadstring(game:HttpGet("https://github.com/percwalkkk/ArcadeNation/raw/refs/heads/main/AutoPickupBall.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/percwalkkk/ArcadeNation/refs/heads/main/AutoGuard.lua"))()
