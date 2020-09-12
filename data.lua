require("prototypes.buildings.generator")
require("prototypes.buildings.rest-camp")
require("prototypes.fuel-categories")
require("prototypes.ammo-categories")
require("prototypes.recipe-categories")
require("prototypes.items.itemgroups")
require("prototypes.items.items")
require("prototypes.recipes.bitter")
require("prototypes.technology.technology")

local unit_types = {"unit-spawner", "unit", "turret"}

for _, types in pairs(unit_types) do
    for _, unit in pairs(data.raw[types]) do
        if is_entity_with_health then
		if unit.name:find("biter") or unit.name:find("spitter") or unit.name:find("worm") then
            --log(unit.name)
            if not unit.loot then unit.loot = {} end
            local probability = .1
            if unit.type == "unit-spawner" then
                probability = .2
            end
            unit.loot[#unit.loot+1] = {
                count_max = math.max(1, (math.min(unit.max_health, 1000)/100)/2),
                count_min = 1,
                item = "bitter-meat",
                probability = probability
            }
		end
        end
    end
end
