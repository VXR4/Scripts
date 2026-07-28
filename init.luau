getgenv().AutoExec=getgenv().AutoExec~=false

local function n(t)
	warn("[Loader Error]",t)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title="Loader Error",
			Text=t,
			Duration=math.huge,
			Button1="Close"
		})
	end)
end

if getgenv().AutoExec and not getgenv().Queued then
	getgenv().Queued=true

	local s=[[
		getgenv().AutoExec=true
		getgenv().Queued=nil
		loadstring(game:HttpGet("https://raw.githubusercontent.com/VXR4/Scripts/refs/heads/main/init.luau"))()
	]]

	local ok,e=pcall(function()
		if queue_on_teleport then
			queue_on_teleport(s)
		elseif syn and syn.queue_on_teleport then
			syn.queue_on_teleport(s)
		elseif fluxus and fluxus.queue_on_teleport then
			fluxus.queue_on_teleport(s)
		else
			error("queue_on_teleport not supported")
		end
	end)

	if not ok then n(e) end
end

local g={
	MM2={p=142823291,s="https://raw.githubusercontent.com/VXR4/Scripts/refs/heads/main/src/MM2/main.lua"},
	KnifeDuels={g=9641502068,s="https://raw.githubusercontent.com/VXR4/Scripts/refs/heads/main/src/Knife%20Duels/main.lua"}
}

local f=false

for k,v in pairs(g) do
	local m=v.p and game.PlaceId==v.p or v.g and game.GameId==v.g

	if m then
		f=true
		local ok,e=pcall(function()
			loadstring(game:HttpGet(v.s))()
		end)

		if not ok then n(k..": "..e) end
		break
	end
end

if not f then
	n("Unsupported Game\nPlaceId: "..game.PlaceId.."\nGameId: "..game.GameId)
end
