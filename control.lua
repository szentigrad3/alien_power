--require("defines")

---------------------------------------------------------
-- Keep track of capsule-created objects
function triggerEntity(event)
	local ent = event.entity
	local name = ent.name
	if name == "capture-smoke-1" or name == "capture-smoke-2" or name == "capture-smoke-3" or name == "capture-smoke-4" then
		captureAlien(ent)
	end
end

script.on_event(defines.events.on_trigger_created_entity, triggerEntity)

---------------------------------------------------------
-- The efficiency of the capture capsule.
-- 0.60 denotes 60% efficiency, and efficiency can go beyond 1.00
local capsuleCatchRates =
	{
		["capture-smoke-1"] = 0.20,
		["capture-smoke-2"] = 0.40,
		["capture-smoke-3"] = 0.60,
		["capture-smoke-4"] = 1.00,
	}
-- The catch rate of a particular alien at 100% capsule efficiency
-- ex: the medium-biter will be caught 60% of the time when using a capture-capsule-4 
local alienCatchRates =
	{
		["small-biter"] = 1.00,
		["medium-biter"] = 0.70,
		["big-biter"] = 0.40,
		["behemoth-biter"] = 0.10,
		["small-spitter"] = 1.00,
		["medium-spitter"] = 0.70,
		["big-spitter"] = 0.40,
		["behemoth-spitter"] = 0.10,
		["small-worm-turret"] = 1.00,
		["medium-worm-turret"] = 0.70,
		["big-worm-turret"] = 0.40,
		--["behemoth-worm-turret"] = 0.10,
	}

---------------------------------------------------------
-- Capture Capsule: Use a capture capsule to catch wild pokemon!
function captureAlien(captureSmoke)
	local r = 1 																							-- capture radius (it's a box)
	local posx = captureSmoke.position["x"]
	local posy = captureSmoke.position["y"]
	local capturePotentials = captureSmoke.surface.find_entities{{posx - r, posy - r}, {posx + r, posy + r}}
	for __, potentialAlien in pairs(capturePotentials) do
		if alienCatchRates[potentialAlien.name] then 														-- if the entity is an alien, try to catch it
			local catchRate = capsuleCatchRates[captureSmoke.name] * alienCatchRates[potentialAlien.name] 	-- the catch rate is (capsule efficieny) * (alien catch rate)
			if math.random() <= catchRate then 																-- if successful catch, destroy the alien and give the player the appropriate spawn capsule
				--game.player.insert{name = (potentialAlien.name .. "-capsule"), count = 1}
				game.players[1].insert{name = (potentialAlien.name .. "-power"), count = 1}
				
				potentialAlien.surface.create_entity({name = "flying-text", position = potentialAlien.position, text = "caught!", color = {r = 1, g = 0, b = 0}})
				potentialAlien.destroy()
			else
				potentialAlien.surface.create_entity({name = "flying-text", position = potentialAlien.position, text = "miss", color = {r = 1, g = 1, b = 1}})
			end
			return 																							-- only allow one capture attempt per capsule
		end
	end
end
