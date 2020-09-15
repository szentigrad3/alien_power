local ent  -- placeholder for building each entity

---------------------------------------------------------
-- Capture capsules --

-- Capture capsule 1
data:extend(
{
  -- Capture capsule item
  {
    type = "capsule",
    name = "capture-capsule-1",
    icon = "__alien_power__/graphics/icons/capture-capsule-1.png",
	icon_size = 64,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "capture-capsule-1",
              starting_speed = 0.5
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "h[capture-capsules]-a[capture-capsule-1]",
    stack_size = 100
  },
  
  -- Capture capsule projectile
  {
    type = "projectile",
    name = "capture-capsule-1",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            show_in_tooltip = false,
            entity_name = "capture-smoke-1",
			trigger_created_entity = "true",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__alien_power__/graphics/icons/capture-capsule-1.png",
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/destroyer-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  
  -- Capture capsule smoke entity
  {
    type = "explosion",
    name = "capture-smoke-1",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__alien_power__/graphics/entity/capture-smoke.png",
        priority = "extra-high",
        width = 34,
        height = 38,
        frame_count = 13,
        animation_speed = 0.5,
        shift = {0, -0.3125}
      }
    },
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },
})

-- Capture capsules 2, 3, 4, which are clones of 1
local orderDict = {["2"] = "b", ["3"] = "c", ["4"] = "d"} -- match 2=b, etc, for creating the capsule item order
for index, order in pairs(orderDict) do
	ent = util.table.deepcopy(data.raw["capsule"]["capture-capsule-1"])
	ent.name = "capture-capsule-" .. index
	ent.icon = "__alien_power__/graphics/icons/capture-capsule-" .. index .. ".png"
	ent.order = "h[capture-capsules]-" .. order .. "[capture-capsule-" .. index .. "]"
  ent.capsule_action.attack_parameters.ammo_type.action.action_delivery.projectile = "capture-capsule-" .. index
  ent.capsule_action.attack_parameters.range= tonumber(index) * ent.capsule_action.attack_parameters.range
	data:extend({ent})

	ent = util.table.deepcopy(data.raw["projectile"]["capture-capsule-1"])
	ent.name = "capture-capsule-" .. index
	ent.animation.filename = "__alien_power__/graphics/icons/capture-capsule-" .. index .. ".png"
	ent.action.action_delivery.target_effects[1].entity_name = "capture-smoke-" .. index
	data:extend({ent})

	ent = util.table.deepcopy(data.raw["explosion"]["capture-smoke-1"])
	ent.name = "capture-smoke-" .. index
	data:extend({ent})
end

---------------------------------------------------------
-- Alien capsules --
--[[local alienDict = -- lists all aliens and their order to appear in item screens
	{
		["small-biter"] = "a", ["medium-biter"] = "b", ["big-biter"] = "c", ["behemoth-biter"] = "d",
		["small-spitter"] = "e", ["medium-spitter"] = "f", ["big-spitter"] = "g", ["behemoth-spitter"] = "h",
		["small-worm-turret"] = "i", ["medium-worm-turret"] = "j", ["big-worm-turret"] = "k", --["behemoth-worm-turret"] = "l",
	}
for alien, order in pairs(alienDict) do
	ent = util.table.deepcopy(data.raw["capsule"]["capture-capsule-1"])
	ent.name = alien .. "-power"
	ent.icon = "__base__/graphics/icons/biter.png"
	ent.order = "h[alien-power]-" .. order .. "[" .. alien .. "-power]"
	ent.capsule_action.attack_parameters.ammo_type.action.action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "create-entity",
				show_in_tooltip = false,
				entity_name = alien,
				trigger_created_entity = "true",
			  },
			}
		  }
	data:extend({ent})
end --]]