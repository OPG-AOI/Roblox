-- The team names and buttons
local teams = {
    {name = "Bamboo's Army", button = nil},
    {name = "Furrballs Army", button = nil},
    {name = "Birch Tree's Army", button = nil}
}

-- Get the player's character and the player's GUI
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gui = player:WaitForChild("PlayerGui")

local button = script.Parent

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
