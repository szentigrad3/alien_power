require("config")
---------------------------------------------------------
--add generic capture check
--basically, add biters to the list
function is_biter(name)
  --only triggers if not in the prebuilt table
  if string.find(name,"biter") or string.find("scarab") then -- this should add to the table each time a new biter is found
    AlienFarmDict[name]= {order = "b["..name.."]", catchRate = 0.25, requiresMaster = false}
  end
end
---------------------------------------------------------
-- Keep track of capsule-created objects
function triggerEntity(event)
	local ent = event.entity
	local name = ent.name
	if AlienFarmCapsules[name] then -- if this is a capture-capsule, try to catch something
    captureAlien(ent)
  else
    is_biter(ent,name)
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
		if AlienFarmDict[potentialAlien.name] or is_biter(potentialAlien.name) then
			local catchRate = AlienFarmCapsules[capsule.name].efficiency * AlienFarmDict[potentialAlien.name].catchRate -- the catch rate is (capsule efficieny) * (alien catch rate)
			
			-- handle behemoths who require a master capsule
			if AlienFarmDict[potentialAlien.name].requiresMaster and capsule.name ~= "capture-capsule-4" then 
				potentialAlien.surface.create_entity({name = "flying-text", position = potentialAlien.position, text = "needs a master net!", color = {r = 1, g = 0, b = 0}})
				catchRate = 0
				return
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

local function find_all_entities(args)
  local entities = {}
  for _,surface in pairs(game.surfaces) do
    for chunk in surface.get_chunks() do
        local top, left = chunk.x * 32, chunk.y * 32
        local bottom, right = top + 32, left + 32
        args.area={{top, left}, {bottom, right}}
        for _, ent in pairs(surface.find_entities_filtered(args)) do
            entities[#entities+1] = ent
        end
    end
  end
  return entities
end

local loot_to_entity
local evo_spawn

local function maybe_hatch(entity,loot_name,probability)
  if math.random() < probability then
    -- list of biters that can spawn right now and can drop this loot, with their spawn weight/probability
    local total_weight = 0
    local can_spawn = {}
    for entity_name,entity_weight in pairs(loot_to_entity[loot_name]) do
      if evo_spawn[entity_name] and evo_spawn[entity_name]>0 then
        can_spawn[entity_name] = evo_spawn[entity_name] * entity_weight
        total_weight = total_weight + evo_spawn[entity_name] * entity_weight
      end
    end
    -- pick one of those biters at random, weighted
    local target = math.random() * total_weight
    local picked
    for name,weight in pairs(can_spawn) do
      if target < weight then
        picked = name
        break
      end
      target = target - weight
    end
    -- hatch it!
    if entity.surface.create_entity{
      name=picked,
      position=entity.position,
      force='enemy'
    } then
      -- debug("hatched "..picked.." at "..pos2s(entity.position))
      local area = {
        {entity.position.x-artifact_clearing_radius, entity.position.y-artifact_clearing_radius}, 
        {entity.position.x+artifact_clearing_radius, entity.position.y+artifact_clearing_radius}
      }
      for _, ent in pairs(entity.surface.find_entities_filtered{area=area,name="item-on-ground"}) do
        if ent.valid then ent.destroy() end
      end
    end
  end
end

local function onTick(event)
local artifact_polling_delay = math.max(artifact_polling_delay_secs,1)*60
local polling_remainder = math.random(artifact_polling_delay)-1
  if event.tick%artifact_polling_delay == polling_remainder then
    -- initialization code, runs once
    -- make a mapping from each loot item to how likely each entity name is to drop it
    if not loot_to_entity then
      loot_to_entity = {}
      for name,entity in pairs(game.entity_prototypes) do
        if entity.type == "unit" then
          if entity.loot then
            for _,loot in pairs(entity.loot) do
              if string.find(loot.item,"biter%-egg") then
                if not loot_to_entity[loot.item] then
                  loot_to_entity[loot.item] = {}
                end
                if loot_to_entity[loot.item][name] then
                  loot_to_entity[loot.item][name] =
                    loot_to_entity[loot.item][name] + 
                    loot.probability * (loot.count_min + loot.count_max) / 2
                else
                  loot_to_entity[loot.item][name] =
                    loot.probability * (loot.count_min + loot.count_max) / 2
                end
              end
            end
          end
        end
      end
    end

    -- make a list of what can spawn at the current evolution factor
    evo_spawn = {}
    local evo = game.forces.enemy.evolution_factor or 0.2
    for _,entity in pairs(game.entity_prototypes) do
      if entity.type == "unit-spawner" then
        for _,usd in pairs(entity.result_units) do
          local low_e, low_w, w
          -- spawn_points is a list of {evolution_factor,weight} coords to be interpolated between
          for _,spawn_point in pairs(usd.spawn_points) do
            if spawn_point.evolution_factor == evo then
              -- perfect match
              w = spawn_point.weight
              break
            elseif low_e then
              -- we already found the entry below our target
              -- interpolate from there toward this entry, stop at our target
              w = low_w + 
                (spawn_point.weight - low_w) * 
                ( (evo - low_e) / (spawn_point.evolution_factor - low_e) )
              break
            else
              low_e = spawn_point.evolution_factor
              low_w = spawn_point.weight
            end
          end
          if not w then
            w = low_w
          end
          if not evo_spawn[usd.unit] then
            evo_spawn[usd.unit] = w
          else
            evo_spawn[usd.unit] = evo_spawn[usd.unit] + w
          end
        end
      end
    end

    for _,entity in pairs(find_all_entities{name="item-on-ground"}) do
      if entity.valid then
        if loot_to_entity[entity.stack.name] then
          -- direct loot hatches as expected
          maybe_hatch(entity,entity.stack.name,artifact_hatching_chance)
        end
      end
    end

  end
end

script.on_event(defines.events.on_tick, onTick)
