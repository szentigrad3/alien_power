--fetching biter properties
local biter_listing={--[[name,health,icon,scale,tint1,tint2]]}
local healths={}
--local biter_define={}
for i,k in pairs(data.raw.unit) do
  if k.subgroup == "enemies" and string.find(i,"biter") then
    biter_listing[#biter_listing+1] = {
      name = k.name,
      health = k.max_health,
      icon = k.icon or k.icons,
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
    b.fuel_category="biter-1"
  elseif b.health < cut[2][1] then
    b.fuel_category="biter-2"
  elseif b.health < cut[3][1] then
    b.fuel_category="biter-3"
  else
    b.fuel_category="biter-4"
  end
end
--log(serpent.block(biter_listing))