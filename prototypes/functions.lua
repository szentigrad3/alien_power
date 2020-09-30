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