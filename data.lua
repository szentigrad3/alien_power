require("prototypes.buildings.generator-1")
require("prototypes.buildings.generator-2")
require("prototypes.buildings.generator-3")
require("prototypes.buildings.generator-4")
--require("prototypes.buildings.bob-generator-1")
--require("prototypes.buildings.bob-generator-2")
--require("prototypes.buildings.bob-generator-3")
require("prototypes.buildings.rest-camp")
require("prototypes.fuel-categories")
require("prototypes.recipe-categories")
require("prototypes.items.itemgroups")
require("prototypes.items.items")
require("prototypes.recipes.biter")
require("prototypes.capsule")
require("prototypes.technology.technology")

function AddLootToEntity(entityType, entityName, probability, countMin, countMax)
	if data.raw[entityType] ~= nil then
		if data.raw[entityType][entityName] ~= nil then
			if data.raw[entityType][entityName].loot == nil then
				data.raw[entityType][entityName].loot = {}
			end
			table.insert(data.raw[entityType][entityName].loot, { item = "biter-meat", probability = probability, count_min = countMin, count_max = math.floor(countMax + 0.5) })
		end
	end
end

function AddLootToVanillaEnemies()
	local SMALL_LOOT_PROBABILITY = 0.33
	local MEDIUM_LOOT_PROBABILITY = 0.66
	local BIG_LOOT_PROBABILITY = 0.83

	local AMOUNT = 1

	AddLootToEntity("unit", "small-spitter", SMALL_LOOT_PROBABILITY, 1, 1 * AMOUNT)
	AddLootToEntity("unit", "small-biter", SMALL_LOOT_PROBABILITY, 1, 1 * AMOUNT)

	AddLootToEntity("unit", "medium-spitter", MEDIUM_LOOT_PROBABILITY, 1, 2 * AMOUNT)
	AddLootToEntity("unit", "medium-biter", MEDIUM_LOOT_PROBABILITY, 1, 2 * AMOUNT)

	AddLootToEntity("unit", "big-spitter", BIG_LOOT_PROBABILITY, 2, 5 * AMOUNT)
	AddLootToEntity("unit", "big-biter", BIG_LOOT_PROBABILITY, 2, 5 * AMOUNT)

	AddLootToEntity("unit", "behemoth-spitter", 1, 5, 10 * AMOUNT)
	AddLootToEntity("unit", "behemoth-biter", 1, 5, 10 * AMOUNT)

	AddLootToEntity("turret", "little-worm-turret", 1, 1, 2 * AMOUNT)
	AddLootToEntity("turret", "medium-worm-turret", 1, 1, 4 * AMOUNT)
	AddLootToEntity("turret", "big-worm-turret", 1, 1, 6 * AMOUNT)

	--AddLootToEntity("unit-spawner", "biter-spawner", 1, 15, 20 * AMOUNT)
	--AddLootToEntity("unit-spawner", "spitter-spawner", 1, 15, 20 * AMOUNT)
end

-- This is for the Natural Expansion Mod
function AddLootToNEEnemies()
	local amount_setting = 1

	for i = 1, 20 do
		local loot_probability = math.min(i * 0.04, 1) -- 80 % at highest tier
		local max_loot_amount = math.floor(math.max(i * 0.101, 1)) * amount_setting

		AddLootToEntity("unit", "ne-biter-breeder-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-biter-fire-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-biter-fast-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-biter-wallbreaker-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-biter-tank-" .. i, loot_probability, 1, max_loot_amount)

		AddLootToEntity("unit", "ne-spitter-breeder-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-spitter-fire-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-spitter-ulaunch-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-spitter-webshooter-" .. i, loot_probability, 1, max_loot_amount)
		AddLootToEntity("unit", "ne-spitter-mine-" .. i, loot_probability, 1, max_loot_amount)
	end

	for i = 2, 3 do
		local MEDIUM_LOOT_PROBABILITY = 0.5
		local BIG_LOOT_PROBABILITY = 1

		AddLootToEntity("unit", "small-spitter-Mk" .. i, MEDIUM_LOOT_PROBABILITY, 1, 1 * amount_setting)
		AddLootToEntity("unit", "small-biter-Mk" .. i, MEDIUM_LOOT_PROBABILITY, 1, 1 * amount_setting)
		AddLootToEntity("unit", "medium-spitter-Mk" .. i, BIG_LOOT_PROBABILITY, 1, 2 * amount_setting)
		AddLootToEntity("unit", "medium-biter-Mk" .. i, BIG_LOOT_PROBABILITY, 1, 2 * amount_setting)
		AddLootToEntity("unit", "big-spitter-Mk" .. i, BIG_LOOT_PROBABILITY, 1, 5 * amount_setting)
		AddLootToEntity("unit", "big-biter-Mk" .. i, BIG_LOOT_PROBABILITY, 1, 5 * amount_setting)
	end

	-- boss unit from NE
	AddLootToEntity("unit", "ne-biter-megladon", 1, 50, 200)
end

-- Rampant mod enemies
function AddLootToRampantEnemies()
	local amount_setting = 1

	for t = 1, 10 do
		for v = 1, 20 do
			local loot_probability = math.min(t * 0.08, 1) -- 80 % at highest tier
			local max_loot_amount = 1 * amount_setting

			AddLootToEntity("unit", "neutral-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "neutral-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "acid-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "acid-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "physical-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "electric-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "suicide-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "nuclear-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "fire-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "fire-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "inferno-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "troll-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "troll-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "fast-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "fast-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "laser-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "laser-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "wasp-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "spawner-spitter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("unit", "spawner-biter-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)

			AddLootToEntity("turret", "neutral-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "acid-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "physical-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "electric-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "suicide-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "nuclear-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "fire-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "inferno-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "troll-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "fast-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "laser-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "wasp-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
			AddLootToEntity("turret", "spawner-worm-v" .. v .. "-t" .. t .. "-rampant", loot_probability, 1, max_loot_amount)
		end
	end
end

function AddLootToGenericEnemies()
  for i,k in pairs(data.raw.unit) do
    if k.subgroup == "enemies" then
      if k.loot then
        if not k.loot["biter-meat"] then
          table.insert(k.loot, { item = "biter-meat", probability = 0.5, count_min = 1, count_max = math.floor(5 + 0.5) })
        end
      else
        k.loot = {{ item = "biter-meat", probability = 0.5, count_min = 1, count_max = math.floor(5 + 0.5) }}
      end
    end
  end
end

AddLootToVanillaEnemies()
AddLootToNEEnemies()
AddLootToRampantEnemies()
