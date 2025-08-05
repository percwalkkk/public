local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local speedMultiplier = 1.6 -- Adjust this to control the boost strength
local boostActive = false

-- Detect key press to toggle speed (for example, LeftShift)
uis.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T then
    if boostActive == false and keysp == 'autox' then
        boostActive = true
        print("Boost Enabled")
        elseif boostActive == true then
        boostActive = false
        print("Boost Disabled")
        end 

    end
end)

--[[uis.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.X then
        boostActive = false
    end
end)]]

-- Main loop
runService.RenderStepped:Connect(function()
    if boostActive and char:FindFirstChild("Humanoid") and char.Humanoid.MoveDirection.Magnitude > 0 then
        -- Boost movement
        local moveDirection = char.Humanoid.MoveDirection
        hrp.AssemblyLinearVelocity = moveDirection * char.Humanoid.WalkSpeed * speedMultiplier + Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
    end
end)
