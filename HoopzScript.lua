local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local toggled = false
local isMovingManually = false

-- Track manual movement input
local movementKeys = {
	[Enum.KeyCode.W] = true,
	[Enum.KeyCode.A] = true,
	[Enum.KeyCode.S] = true,
	[Enum.KeyCode.D] = true,
}

-- Handle input
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if key == 'speedx' then
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.X then
		toggled = not toggled
		print("AutoGuard: " .. (toggled and "ON" or "OFF"))
	end

	if movementKeys[input.KeyCode] then
		isMovingManually = true
	end
    end
end)

UserInputService.InputEnded:Connect(function(input)
	if movementKeys[input.KeyCode] then
		local stillMoving = false
		for key in pairs(movementKeys) do
			if UserInputService:IsKeyDown(key) then
				stillMoving = true
				break
			end
		end
		isMovingManually = stillMoving
	end
end)

-- Find closest opponent with the ball
local function getClosestOpponentWithBall()
	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end

	local closest = nil
	local shortestDist = math.huge

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			if player.Character:FindFirstChild("Basketball") then
				local dist = (myChar.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
				if dist < shortestDist then
					closest = player
					shortestDist = dist
				end
			end
		end
	end

	return closest
end

-- Main logic
RunService.RenderStepped:Connect(function()
	if not toggled then return end

	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") or not myChar:FindFirstChildOfClass("Humanoid") then return end

	if myChar:FindFirstChild("Basketball") then
		toggled = false
		print("AutoGuard: OFF (you got the ball)")
		return
	end

	if isMovingManually then return end

	local myHRP = myChar.HumanoidRootPart
	local humanoid = myChar:FindFirstChildOfClass("Humanoid")

	local targetPlayer = getClosestOpponentWithBall()
	if not (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then return end

	local targetHRP = targetPlayer.Character.HumanoidRootPart
	local velocity = targetHRP.Velocity

	-- If opponent is not moving, fallback to LookVector
	if velocity.Magnitude < 1 then
		velocity = targetHRP.CFrame.LookVector * 2
	end

	-- Get flat direction of their actual movement
	local opponentMoveDir = Vector3.new(velocity.X, 0, velocity.Z).Unit
	local spacingDistance = 7 -- how far ahead to stay

	-- Target position = ahead of opponent along their path
	local targetPosition = targetHRP.Position + opponentMoveDir * spacingDistance

	-- Determine direction to that position
	local toTarget = targetPosition - myHRP.Position
	local moveDir = Vector3.new(toTarget.X, 0, toTarget.Z)

	-- Only move if not already close enough
	if moveDir.Magnitude > 1 then
		humanoid:Move(moveDir.Unit, false)
	else
		humanoid:Move(Vector3.zero, false)
	end
end)
