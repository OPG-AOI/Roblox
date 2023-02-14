-- The name of the team to join
local teamName = "Red Team"

-- Get the player's character and the player's GUI
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gui = player:WaitForChild("PlayerGui")

-- Create the UI button
local button = Instance.new("TextButton")
button.Text = "Join " .. teamName
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Parent = gui

-- When the button is clicked
button.MouseButton1Click:Connect(function()
    -- Get the team to join
    local team = game.Teams:FindFirstChild(teamName)

    if team then
        -- Join the team
        team:AddPlayer(player)
        print("You have joined the " .. teamName .. " team!")

        -- Remove the button
        button:Destroy()
    else
        print("Sorry, the " .. teamName .. " team could not be found.")
    end
end)
