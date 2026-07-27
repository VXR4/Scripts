local Games = {
    MM2 = {
        PlaceId = 142823291,
        Script = "mm2",
    },

    Flick = {
        PlaceId = 123456789,
        Script = "",
    },
}

for _, Game in pairs(Games) do
    if game.PlaceId == Game.PlaceId and Game.Script ~= "" then
        loadstring(game:HttpGet(Game.Script))()
        break
    end
end
