
-- Find Closest Part
local function findClosestPart(group, position)
	local closestPart, closestPartMagnitude ; local tmpMagnitude 
	for i, v in pairs(group:GetChildren()) do
		if closestPart then
			tmpMagnitude = (position - v.Position).magnitude
			if tmpMagnitude < closestPartMagnitude then
				closestPart = v
				closestPartMagnitude = tmpMagnitude 
			end
		else
			closestPart = v
			closestPartMagnitude = (position - v.Position).magnitude
		end
	end
	return closestPart --[[, closestPartMagnitude]]
end

-- ex. print(findClosestPart(workspace.Folder, workspace.Part2.Position)) 
-- Will find the closest part to Part2 that's in the Folder
local Player = game.Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local HumanoidRootPart = Character.HumanoidRootPart
local ReplicatedStorage = game:GetService("ReplicatedStorage")
