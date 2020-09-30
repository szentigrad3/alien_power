--DECLARE tables and "local" variables used only within this file
local biter_listing = {--[[name,health,icon,scale,tint1,tint2,fuel-category]]}
local healths = {}
local biter_splits = {}
local groups
local cut = {}

--fetching biter properties
--[[ For loop, i is index (table row), k is internal table, in pairs grabs each row from what is in bracket
i.e. in this case each data.raw.unit gets extracted (main table of units) and loops through each one]]
for i,k in pairs(data.raw.unit) do
  --check that it is actually an enemy and a "biter" type
  if k.subgroup == "enemies" -- == is equality, used fo check if equal, while a single one can be used to set the property
  and (string.find(i,"biter") or string.find(i,"scarab")) then
    --insert a new row at the end (this is the same as table.insert)
    --grab the requisite data from k and place those values in the biter_listing table    
    biter_listing[#biter_listing+1] = {
      name = k.name,
      health = k.max_health,
      icon = k.icon or k.icons,
      icon_size = k.icon_size or 32,
      scale = k.run_animation.layers[2].scale,
      tint_1 = k.run_animation.layers[2].tint,
      tint_2 = k.run_animation.layers[3].tint or nil
    }
    --also add the health to the healths table (a bit heavy handed here)
    --the extra layers are to stop duplicate values being added, for a more fair split
    --assume that we want to add it
    local add = true
    --run through existing table
    for _,j in pairs(healths) do
      --compare current health value, if already exists, skip (set add to false)
      if j[1]==k.max_health then
        add = false --the don't add trigger
        break --already found, may as well terminate loop
      end
    end
    --if add, then place health in table
    if add == true then
      healths[#healths+1]={k.max_health}
    end
  end
end

--
-- A PATHWORK table.sort based on internal value, not external number

--collect and sort the healths into an array to be sorted
function compare(a,b)
  return a[1] < b[1]
end
table.sort(healths,compare)
-- END SORT FUNCTION

--determine cut-points
groups = math.floor(#healths/4) --quarters
cut[1] = healths[groups] --everything lower than this gets group 1
cut[2] = healths[groups*2]
cut[3] = healths[groups*3] --everything greater than this gets group 4

--Add final property to biter listing (fuel category)
  -- YOU CAN USE THIS CATEGORY TO SET TIER BASED PROPERTIES

for i,b in pairs(biter_listing) do
  if b.health <= cut[1][1] then
    b.fuel_category = "alien-1"
  elseif b.health <= cut[2][1] then
    b.fuel_category = "alien-2"
  elseif b.health <= cut[3][1] then
    b.fuel_category = "alien-3"
  else
    b.fuel_category = "alien-4"
  end
end
--log(serpent.block(biter_listing)) --you can use this to see the final version of the table

------------------------------------
--actually add the items/recipes
------------------------------------
for _,biter in pairs(biter_listing) do
  --for each biter in the populated biter_listing table create items/recipes, and add to tech
  --Declare loop internal local variables 
  --local declarations inside loops cannot escape, and reset each loop
  local ics,icsu --can declare multiple empty variables like this
  local energy = 120
  local amount = 55

  --ICON EXTRACTOR (BASIC)
  if biter.icon[1] then --if icon in biter_listing is actually a table
    ics = biter.icon
  else --if icon is a string
    ics = {
      {icon = biter.icon, icon_size = biter.icon_size},
      {icon = biter.icon, icon_size = biter.icon_size, tint = biter.tint_1}
    }
  end
  --grab extracted icon, deepcopy it (to not modify the original), then add the tired overlay to a secondary
  icsu = table.deepcopy(ics)
  icsu[#icsu] = {icon = "__alien_power__/graphics/icons/tired.png", icon_size = 64}
  --SET TIER SPECIFIC PROPERTIES (energy/amount) using IF/ElseIF
  if biter.fuel_category == "alien-1" then
    energy = 30
	  amount = 5
  elseif biter.fuel_category == "alien-2" then
    energy = 60
	  amount = 15
  elseif biter.fuel_category == "alien-3" then
    energy = 90
	  amount = 45
  end

  --now that we have the dynamic properties, create the items/recipe and add to tech
  data:extend(
  {
    {
      type = "item",
      name = biter.name .."-power",
      localised_name = {"item-name.powered-biter",{"entity-name."..biter.name}},
      icons = ics,
      icon_size = biter.icon_size or 32,
      flags = {},
      subgroup = "alien-power",
      order = "a["..biter.name.."]",
      stack_size = 300,
      fuel_category = biter.fuel_category,
      fuel_value = biter.health .. "kJ",
      burnt_result = biter.name .."-used"
    },
    {
      type = "item",
      name = biter.name .."-used",
      localised_name = {"item-name.tired-biter",{"entity-name."..biter.name}},
      icons = icsu,
      icon_size = biter.icon_size or 32,
      flags = {},
      subgroup = "alien-power",
      order = "x["..biter.name.."]",
      stack_size = 1
    },
    {
      type = 'recipe',
      name = biter.name .."-recharging",
      energy_required = energy,
      localised_name = {"recipe-name.recharging",{"entity-name."..biter.name}},
      category = 'alien-recharge',
      enabled = true,
      hide_from_player_crafting = true,
      ingredients = {
        {type = 'item', name = biter.name .."-used", amount = 1},
        {type = 'item', name = 'biter-meat', amount = amount},
      },
      results = {
        {type = 'item', name = biter.name .."-power", amount = 1},
      },
    },
    {
      type = "recipe",
      name = biter.name .."-breeding",
      localised_name = {"recipe-name.breeding",{"entity-name."..biter.name}},
      category = "alien-breeder",
      energy_required = 300,
      enabled = false,
      ingredients =
      {
        {"biter-egg", 1},
      },
      results = {
        {type = 'item', name = biter.name .."-power", probability = 0.5, amount = 1},
      },
    },
    table.insert(data.raw["technology"]["capture-capsule-d"].effects, {type = "unlock-recipe", recipe = biter.name .."-breeding"})
  })
end
