local gamepassId = 76026698
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
            tool.Parent = character
            print("You have purchased the gamepass and received a tool! Congradulations! Your not a bozo!")
        else
            print("Lets just say that you are under 13 years old and that you are now a bozo.")
        end
    end
end