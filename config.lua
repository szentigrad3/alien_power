
---------------------------------------------------------
-- This file contains global constants which the user can
-- change to their liking. Please be careful, and only  
-- assign expected values.
-- THIS DATA IS USED FOR THE CONTROL STAGE, and for capsule creation in DATA STAGE 					 
---------------------------------------------------------

AlienFarmDict = {}

	AlienFarmDict =
	{
		["small-biter"]               = {order = "a[vanilla]-a", catchRate = 1.00, requiresMaster = false},
		["medium-biter"]              = {order = "a[vanilla]-b", catchRate = 0.70, requiresMaster = false},
		["big-biter"]                 = {order = "a[vanilla]-c", catchRate = 0.40, requiresMaster = false},
		["behemoth-biter"]            = {order = "a[vanilla]-d", catchRate = 0.25, requiresMaster = true},
		-- Bob's Mod Enemies
		["bob-big-piercing-biter"]    = {order = "b[bobs]-a", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-huge-acid-biter"]       = {order = "b[bobs]-b", catchRate = 0.25, requiresMaster = true, incubationTime = 120, dropRate = 1.00, evolveResult = nil, evolveRate = 0},
		["bob-huge-explosive-biter"]  = {order = "b[bobs]-c", catchRate = 0.25, requiresMaster = true},
		["bob-giant-poison-biter"]    = {order = "b[bobs]-d", catchRate = 0.25, requiresMaster = true},
		["bob-giant-fire-biter"]      = {order = "b[bobs]-e", catchRate = 0.25, requiresMaster = true},
		["bob-titan-biter"]           = {order = "b[bobs]-f", catchRate = 0.25, requiresMaster = true},
		["bob-behemoth-biter"]        = {order = "b[bobs]-g", catchRate = 0.25, requiresMaster = true},
		["bob-leviathan-biter"]       = {order = "b[bobs]-g", catchRate = 0.25, requiresMaster = true},
}


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
}

-- seconds between artifact hatching checks
artifact_polling_delay_secs = 20

-- probability of an artifact hatching when checked
artifact_hatching_chance = 0.05

-- radius around a hatched artifact where other items get eaten
artifact_clearing_radius = 0.5
