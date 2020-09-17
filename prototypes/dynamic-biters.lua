--fetching biter properties
local biter_listing={--[[name,health,icon,scale,tint1,tint2]]}
local healths={}
--local biter_define={}
for i,k in pairs(data.raw.unit) do
  if k.subgroup == "enemies" and string.find(i,"biter") then
    --[[local icons ="__base__/graphics/icons/small-biter.png"
    if k.icon then
      icons=k.icon
    elseif k.icons then
      icons=k.icons
    end]]
    biter_listing[#biter_listing+1] = {
      name = k.name,
      health = k.max_health,
      icon = k.icon or k.icons,
      icon_size = k.icon_size or 32,
      scale = k.run_animation.layers[2].scale,
      tint_1 = k.run_animation.layers[2].tint, 
      tint_2 = k.run_animation.layers[3].tint or nil
    }
    local add = true
    for _,j in pairs(healths) do
      if j[1]==k.max_health then
        add = false
        break
      end
    end
    if add == true then
      healths[#healths+1]={k.max_health}
    end
    --biter_define[#biter_define+1]=k
  end
end
--collect and sort the healths into an array to be sorted
function compare(a,b)
  return a[1] < b[1]
end
table.sort(healths,compare)
--determine cut-points
local groups = math.floor(#healths/4)
local cut={}
cut[1]=healths[groups] --everything lower than this gets group 1
cut[2]=healths[groups*2]
cut[3]=healths[groups*3] --everything greater than this gets group 4
--log(serpent.block(healths))
local biter_splits={}
for i,b in pairs(biter_listing) do
  if b.health < cut[1][1] then
    b.fuel_category="alien-1"
  elseif b.health < cut[2][1] then
    b.fuel_category="alien-2"
  elseif b.health < cut[3][1] then
    b.fuel_category="alien-3"
  else
    b.fuel_category="alien-4"
  end
end
--log(serpent.block(biter_listing))
------------------------------------
--actually add the items/recipes
------------------------------------
for _,biter in pairs(biter_listing) do
  local ics,icsu
  if biter.icon[1] then
    ics=biter.icon
  else
    ics={
      {icon = biter.icon, icon_size = biter.icon_size},
      {icon = biter.icon, icon_size = biter.icon_size, tint=biter.tint_1}
    }
  end
  icsu=table.deepcopy(ics)
  icsu[#icsu]={icon = "__alien_power__/graphics/icons/tired.png",icon_size = 64}
  data:extend(
    {
      {
        type = "item",
        name = biter.name .."-power",
        localised_name = {"item-name.powered-biter",biter.name},
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
        localised_name = {"item-name.tired-biter",biter.name},
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
      localised_name = {"recipe-name.recharging",biter.name},
      category = 'alien-recharge',
      enabled = true,
      hide_from_player_crafting = true,
      energy_required = 30, --possibly think about setting this per tier?
      ingredients = {
        {type = 'item', name = biter.name .."-used", amount = 1},
        {type = 'item', name = 'biter-meat', amount = 5}, --possibly think about setting this per tier?
      },
      results = {
        {type = 'item', name = biter.name .."-power", amount = 1},
      },
    }
  })
end