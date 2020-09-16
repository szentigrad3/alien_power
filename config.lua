
---------------------------------------------------------
-- This file contains global constants which the user can
-- change to their liking. Please be careful, and only  
-- assign expected values. 					 
---------------------------------------------------------

---------------------------------------------------------
-- This table holds all capturable aliens
-- Add or change aliens following the pattern
-- "order" is the item order of the capsule
-- "catchRate" is the capture chance at 100% capsule efficiency 
-- "incubationTime" is the expected time to hatch, in seconds
-- "dropRate" is the rate at which artificially-spawned aliens drop alien artifacts
-- "evolveResult" is the entity which an incubator may randomly spawn instead of this one
-- "evolveRate" is the rate at which random evolution occurs
AlienFarmDict = {}

if bobmods and bobmods.enemies then
	AlienFarmDict =
	{
		["small-biter"] = {order = "a[vanilla]-a", catchRate = 1.00, requiresMaster = false, incubationTime = 5, dropRate = 0.13, evolveResult = "medium-biter", evolveRate = 0.05},
		["medium-biter"] = {order = "a[vanilla]-b", catchRate = 0.70, requiresMaster = false, incubationTime = 20, dropRate = 0.20, evolveResult = "big-biter", evolveRate = 0.03},
		["big-biter"] = {order = "a[vanilla]-c", catchRate = 0.40, requiresMaster = false, incubationTime = 60, dropRate = 0.50, evolveResult = "behemoth-biter", evolveRate = 0.02},
		["behemoth-biter"] = {order = "a[vanilla]-d", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["small-spitter"] = {order = "a[vanilla]-e", catchRate = 1.00, requiresMaster = false, incubationTime = 5, dropRate = 0.13, evolveResult = "medium-spitter", evolveRate = 0.05},
		["medium-spitter"] = {order = "a[vanilla]-f", catchRate = 0.70, requiresMaster = false, incubationTime = 20, dropRate = 0.20, evolveResult = "big-spitter", evolveRate = 0.03},
		["big-spitter"] = {order = "a[vanilla]-g", catchRate = 0.40, requiresMaster = false, incubationTime = 60, dropRate = 0.50, evolveResult = "behemoth-spitter", evolveRate = 0.02},
		["behemoth-spitter"] = {order = "a[vanilla]-h", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["small-worm-turret"] = {order = "a[vanilla]-i", catchRate = 1.00, requiresMaster = false, incubationTime = 5, dropRate = 0.13, evolveResult = "medium-worm-turret", evolveRate = 0.05},
		["medium-worm-turret"] = {order = "a[vanilla]-j", catchRate = 0.40, requiresMaster = false, incubationTime = 20, dropRate = 0.20, evolveResult = "big-worm-turret", evolveRate = 0.03},
		["big-worm-turret"] = {order = "a[vanilla]-k", catchRate = 0.40, requiresMaster = false, incubationTime = 60, dropRate = 0.50, evolveResult = nil, evolveRate = 0},
		--["behemoth-worm-turret"] = {order = "a[vanilla]-l", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},

		-- Bob's Mod Enemies
		["bob-big-piercing-biter"] = {order = "b[bobs]-a", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-huge-acid-biter"] = {order = "b[bobs]-b", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-huge-explosive-biter"] = {order = "b[bobs]-c", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-giant-poison-biter"] = {order = "b[bobs]-d", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-giant-fire-biter"] = {order = "b[bobs]-e", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-titan-biter"] = {order = "b[bobs]-f", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-behemoth-biter"] = {order = "b[bobs]-g", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-leviathan-biter"] = {order = "b[bobs]-h", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		
		["bob-big-electric-spitter"] = {order = "b[bobs]-i", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-huge-explosive-spitter"] = {order = "b[bobs]-j", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-huge-acid-spitter"] = {order = "b[bobs]-k", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-giant-fire-spitter"] = {order = "b[bobs]-l", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-giant-poison-spitter"] = {order = "b[bobs]-m", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-titan-spitter"] = {order = "b[bobs]-n", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-behemoth-spitter"] = {order = "b[bobs]-o", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-leviathan-spitter"] = {order = "b[bobs]-p", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		
		["bob-big-explosive-worm-turret"] = {order = "b[bobs]-q", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-big-fire-worm-turret"] = {order = "b[bobs]-r", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-big-poison-worm-turret"] = {order = "b[bobs]-s", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
	}
else
	AlienFarmDict =
	{
		["small-biter"] = {order = "a[vanilla]-a", catchRate = 1.00, requiresMaster = false, incubationTime = 5, dropRate = 0.13, evolveResult = "medium-biter", evolveRate = 0.05},
		["medium-biter"] = {order = "a[vanilla]-b", catchRate = 0.70, requiresMaster = false, incubationTime = 20, dropRate = 0.20, evolveResult = "big-biter", evolveRate = 0.03},
		["big-biter"] = {order = "a[vanilla]-c", catchRate = 0.40, requiresMaster = false, incubationTime = 60, dropRate = 0.50, evolveResult = "behemoth-biter", evolveRate = 0.02},
		["behemoth-biter"] = {order = "a[vanilla]-d", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["small-spitter"] = {order = "a[vanilla]-e", catchRate = 1.00, requiresMaster = false, incubationTime = 5, dropRate = 0.13, evolveResult = "medium-spitter", evolveRate = 0.05},
		["medium-spitter"] = {order = "a[vanilla]-f", catchRate = 0.70, requiresMaster = false, incubationTime = 20, dropRate = 0.20, evolveResult = "big-spitter", evolveRate = 0.03},
		["big-spitter"] = {order = "a[vanilla]-g", catchRate = 0.40, requiresMaster = false, incubationTime = 60, dropRate = 0.50, evolveResult = "behemoth-spitter", evolveRate = 0.02},
		["behemoth-spitter"] = {order = "a[vanilla]-h", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["small-worm-turret"] = {order = "a[vanilla]-i", catchRate = 1.00, requiresMaster = false, incubationTime = 5, dropRate = 0.13, evolveResult = "medium-worm-turret", evolveRate = 0.05},
		["medium-worm-turret"] = {order = "a[vanilla]-j", catchRate = 0.40, requiresMaster = false, incubationTime = 20, dropRate = 0.20, evolveResult = "big-worm-turret", evolveRate = 0.03},
		["big-worm-turret"] = {order = "a[vanilla]-k", catchRate = 0.40, requiresMaster = false, incubationTime = 60, dropRate = 0.50, evolveResult = nil, evolveRate = 0},
		--["behemoth-worm-turret"] = {order = "a[vanilla]-l", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
	}
end

---------------------------------------------------------
-- This table holds the efficiency of capture capsules
-- If adding tiers, be sure to add associated graphics, recipe, and technology
-- "efficiency" affects the rate at which aliens are captured
AlienFarmCapsules = 
{
	["capture-capsule-1"] = {efficiency = 0.20},
	["capture-capsule-2"] = {efficiency = 0.60},
	["capture-capsule-3"] = {efficiency = 1.00},
	["capture-capsule-4"] = {efficiency = 2.00},
	["recapture-capsule"] = {efficiency = 2.00},
}
