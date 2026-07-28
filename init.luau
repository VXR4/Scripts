local Games = {
    MM2 = {
        PlaceId = 142823291,
        Script = "https://raw.githubusercontent.com/VXR4/Scripts/refs/heads/main/src/MM2/main.lua",
    },
	
    KnifeDuels = {
        GameId = 9641502068,
        Script = "https://raw.githubusercontent.com/VXR4/Scripts/refs/heads/main/src/Knife%20Duels/main.lua",
    }
}

for _, Game in pairs(Games) do
    local Match = false

    if Game.PlaceId then
        Match = game.PlaceId == Game.PlaceId
    elseif Game.GameId then
        Match = game.GameId == Game.GameId
    end

    if Match and Game.Script ~= "" then
        loadstring(game:HttpGet(Game.Script))()
        break
    end
end
