require("config")

---------------------------------------------------------
-- Keep track of capsule-created objects
function triggerEntity(event)
	local ent = event.entity
	local name = ent.name
	if AlienFarmCapsules[name] then -- if this is a capture-capsule, try to catch something
		captureAlien(ent)
	end
end
script.on_event(defines.events.on_trigger_created_entity, triggerEntity)

---------------------------------------------------------
-- Capture Capsule: Use a capture capsule to catch wild pokemon!
function captureAlien(capsule)
	local r = 1 -- capture radius (it's a box)
	local posx = capsule.position.x
	local posy = capsule.position.y
	local capturePotentials = capsule.surface.find_entities{{posx - r, posy - r}, {posx + r, posy + r}}
	for __, potentialAlien in pairs(capturePotentials) do
		-- if the entity is an alien, try to catch it
		if AlienFarmDict[potentialAlien.name] then
			local catchRate = AlienFarmCapsules[capsule.name].efficiency * AlienFarmDict[potentialAlien.name].catchRate -- the catch rate is (capsule efficieny) * (alien catch rate)
			
			-- handle behemoths who require a master capsule
			if AlienFarmDict[potentialAlien.name].requiresMaster and capsule.name ~= "capture-capsule-4" then 
				catchRate = 0
			end
			
			-- if successful catch, destroy the alien and give the player the appropriate spawn capsule
			if math.random() <= catchRate then
				game.players[1].insert{name = (potentialAlien.name .. "-power"), count = 1}
				potentialAlien.surface.create_entity({name = "flying-text", position = potentialAlien.position, text = "caught!", color = {r = 1, g = 0, b = 0}})
				potentialAlien.destroy()
			else
				potentialAlien.surface.create_entity({name = "flying-text", position = potentialAlien.position, text = "miss", color = {r = 1, g = 1, b = 1}})
			end
			return 																													-- only allow one capture attempt per capsule
		end
	end
end

-- This function returns the name of a alien that can be incubated from an item, or nil if none can
-- We expect capsules to be named like "small-biter-capsules"
local capsuleSuffix = "-capsule"
local capsuleSuffixLen = string.len(capsuleSuffix)
function getResultAlien(itemName)
	itemNameLen = string.len(itemName)
	if itemNameLen <= capsuleSuffixLen then return nil end -- return nil if the item name is too short
	if not string.sub(itemName, itemNameLen - capsuleSuffixLen + 1, itemNameLen) == capsuleSuffix then -- check if the item name ends with "-capsule"
		return nil
	else
		local potentialName = string.sub(itemName, 1, itemNameLen - capsuleSuffixLen) -- the item name without "-capsule"
		if AlienFarmDict[potentialName] == nil then -- check if the name is a valid alien
			return nil
		else
			return potentialName
		end
	end
end
