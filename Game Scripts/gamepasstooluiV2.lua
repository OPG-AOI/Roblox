local gamepassId = 123456789
local tool = script.GetChildren

local player = game.Players.LocalPlayer
local character = player.character or player.CharacterAdded:Wait()

script.parent.MouseButton1Click:Connect:function()
    if player:HasGamePass(gamepassId) then
        print("Number 15: Burger king foot lettuce. You are now a bozo, bozo.")
    else
        local success, result = pcall(function()
            return game.MarketplaceService:PromptGamePassPurchase(player, gamepassId)
        end)
     if success and result then
            -- Give the player the tool
            local tool = game:GetService("InsertService"):LoadAsset(toolId):GetChildren()[1]
            tool.Parent = character
            print("You have purchased the gamepass and received a tool!")
        else
            print("Sorry, there was an error purchasing the gamepass. You are now a bozo.")
        end
    end
end