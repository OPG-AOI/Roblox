-- The team names and buttons
local teams = {
    {name = "Bamboo's Army", button = nil},
    {name = "Furrballs Army", button = nil},
}

-- Get the player's character and the player's GUI
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gui = player:WaitForChild("PlayerGui")

-- Create the UI buttons
for _, team in ipairs(teams) do
    local button = Instance.new("TextButton")
    button.Text = "Join " .. team.name
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5 + 60 * (_ - 1 - #teams / 2), -25)
    button.Parent = gui
    team.button = button

    -- When the button is clicked
    button.MouseButton1Click:Connect(function()
        -- Get the team to join
        local teamObject = game:GetService("Teams"):FindFirstChild(team.name)

        if teamObject then
            -- Join the team
            teamObject:AddPlayer(player)
            print("You have joined the " .. team.name .. " team!")

            -- Remove the button
            button:Destroy()
        else
            warn("Sorry, the " .. team.name .. " team could not be found.")
        end
    end)
end
