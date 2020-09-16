require("config")

local ent  -- placeholder for building each entity

---------------------------------------------------------
-- Capture capsules --

-- Recapture capsule
data:extend(
{
  -- Capture capsule item
  {
    type = "capsule",
    name = "recapture-capsule",
    icon = "__alien_power__/graphics/icons/recapture-capsule.png",
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
              projectile = "recapture-projectile",
              starting_speed = 0.5
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "e",
    stack_size = 100
  },
  
  -- Capture capsule projectile (when thrown)
  {
    type = "projectile",
    name = "recapture-projectile",
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
            entity_name = "recapture-capsule",
			trigger_created_entity = "true",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__alien_power__/graphics/icons/recapture-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
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
  
  -- Capture capsule smoke/explosion
  {
    type = "explosion",
    name = "recapture-capsule",
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

-- Capture capsules 1, 2, 3, 4
local orderDict = {["1"] = "a", ["2"] = "b", ["3"] = "c", ["4"] = "d"} -- match 1=a, etc, for creating the capsule item order
for index, order in pairs(orderDict) do
	ent = util.table.deepcopy(data.raw["capsule"]["recapture-capsule"])
	ent.name = "capture-capsule-" .. index
	ent.icon = "__alien_power__/graphics/icons/capture-capsule-" .. index .. ".png"
	ent.order = order
	ent.capsule_action.attack_parameters.ammo_type.action.action_delivery.projectile = "capture-projectile-" .. index
	data:extend({ent})

	ent = util.table.deepcopy(data.raw["projectile"]["recapture-projectile"])
	ent.name = "capture-projectile-" .. index
	ent.animation.filename = "__alien_power__/graphics/icons/capture-capsule-" .. index .. ".png"
	ent.action.action_delivery.target_effects[1].entity_name = "capture-capsule-" .. index
	data:extend({ent})

	ent = util.table.deepcopy(data.raw["explosion"]["recapture-capsule"])
	ent.name = "capture-capsule-" .. index
	data:extend({ent})
end