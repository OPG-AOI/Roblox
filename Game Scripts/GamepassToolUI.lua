-- Made by BambooYT
local gamepassId = 123456789

-- The ID of the tool to be given to the player
local toolId = 987654321

-- Get the player's character and the player's GUI
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gui = player:WaitForChild("PlayerGui")

-- Create the UI button
local button = Instance.new("TextButton")
button.Text = "Buy Gamepass"
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Parent = gui

-- When the button is clicked
button.MouseButton1Click:Connect(function()
    -- Check if the player already owns the gamepass
    if player:HasGamePass(gamepassId) then
        print("You already own this gamepass!")
    else
        -- Attempt to purchase the gamepass
        local success, result = pcall(function()
            return game.MarketplaceService:PromptGamePassPurchase(player, gamepassId)
        end)

        if success and result then
            -- Give the player the tool
            local tool = game:GetService("InsertService"):LoadAsset(toolId):GetChildren()[1]
            tool.Parent = character
            print("You have purchased the gamepass and received a tool!")
        else
            print("Sorry, there was an error purchasing the gamepass.")
        end
    end
end)
