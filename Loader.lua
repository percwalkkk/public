```lua
_G.Supported = {
    ["9498006165"] = {
        Game = "Tapping Simulator",
        Path = "TappingSimulator"
    },
    ["9030362964"] = {
        Game = "Field Goal Simulator",
        Path = "FieldGoalSimulator"
    },
    ["9049840490"] = {
        Game = "Sonic Speed Simulator",
        Path = "SonicSpeedSimulator"
    },
    ["7075737729"] = {
        Game = "Hoop Central 6",
        Path = "HoopCentral6"
    },
    ["11089644241"] = {
        Game = "Hoops Life 2",
        Path = "HoopsLife"
    },
    ["7540727946"] = {
        Game = "Hoops Life",
        Path = "HoopsLife"
    },
  ["7899881670"] = {
        Game = "RB World 4",
        Path = "RBWorld4"
    },
  ["6229116934"] = {
        Game = "Hoopz",
        Path = "Hoopz"
    },
  ["4779613061"] = {
        Game = "South London 2",
        Path = "SouthLondon2"
    },
}

local function detectgame()
   local UrlPath
   for i,v in pairs(_G.Supported) do
   if i == tostring(game.PlaceId) then
       UrlPath = v.Path
    end
end
return UrlPath
end

local function loadscript()
-- Github example: https://raw.githubusercontent.com/USERNAME/REPOSITORY/BRANCH/
-- Your own website example: https://websitename.com/FOLDERNAME/
loadstring(game:HttpGet("raw.githubusercontent.com/percwalkkk/paid/" .. detectgame() .. ".lua"))()
end

if detectgame() ~= nil then
   loadscript() 
else
    return print('Game is not supported')
end```
