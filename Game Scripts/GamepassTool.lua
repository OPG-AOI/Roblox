local gamePassId = 12345678
local vipPlayers = {"YoBambooCool"}
local toolNames = {"Fly", "RPG", "Nimbus Cloud"}

local function isVipPlayer(playerName)
    for _, name in ipairs(vipPlayers) do
        if name == playerName then
            return true
        end
    end
    return false
end

game.Players.PlayerAdded:Connect(function(player)
    local hasGamePass = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, gamePassId)
    if hasGamePass or isVipPlayer(player.Name) then
        player.CharacterAdded:Connect(function(character)
            for _, toolName in ipairs(toolNames) do
                local tool = game:GetService("ServerStorage"):FindFirstChild(toolName)
                if tool then
                    tool:Clone().Parent = player.Backpack
                end
            end
        end)

        for _, toolName in ipairs(toolNames) do
            if not player.Backpack:FindFirstChild(toolName) then
                local tool = game:GetService("ServerStorage"):FindFirstChild(toolName)
                if tool then
                    tool:Clone().Parent = player.Backpack
                end
            end
        end
    end
end)
