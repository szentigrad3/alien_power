require("prototypes.buildings.generator-1")
require("prototypes.buildings.generator-2")
require("prototypes.buildings.generator-3")
require("prototypes.buildings.generator-4")
require("prototypes.buildings.rest-camp")
require("prototypes.fuel-categories")
require("prototypes.recipe-categories")
require("prototypes.items.itemgroups")
require("prototypes.items.items")
require("prototypes.recipes.biter")
require("prototypes.capsule")
require("prototypes.technology.technology")
require("prototypes.buildings.breeder-building")

function AddMeatToEnemies()
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

function AddEggsToEnemies()
  for i,k in pairs(data.raw.unit) do
    if k.subgroup == "enemies" then
      if k.loot then
        if not k.loot["biter-egg"] then
		  table.insert(k.loot, { item = "biter-egg", probability = 0.5, count_min = 1, count_max = math.floor(5 + 0.5) })
        end
      else
		k.loot = {{ item = "biter-egg", probability = 0.5, count_min = 1, count_max = math.floor(5 + 0.5) }}
      end
    end
  end
end