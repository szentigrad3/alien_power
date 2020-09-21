biter_spawner_tint = {r=0.92, g=0.54, b=0, a=0.5}
data:extend(
  {
    {
      type = "recipe",
      name = "breeder-spawner",
      energy_required = 0.5,
      enabled = true,
      ingredients = {
        {"steel-plate", 75},
        {"stone-wall", 40},
        {"processing-unit", 50},
        {"iron-plate", 100},
        {"express-transport-belt", 30},
        {"iron-gear-wheel", 100}
      },
      results = {
        {"breeder-spawner", 1}
      }
    },
    {
      type = "item",
      name = "breeder-spawner",
      icon = "__base__/graphics/icons/spitter-spawner.png",
      icon_size = 64,
      icon_mipmaps=4,
      flags = {},
      subgroup = "alien-generators",
      order = "a",
      place_result = "breeder-spawner",
      stack_size = 15
    },
{
    type = "assembling-machine",
    name = "breeder-spawner",
    icon = "__base__/graphics/icons/spitter-spawner.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
	minable = {mining_time = 0.2, result = "assembling-machine-3"},
    max_health = 350,
    order="b-d-b",
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner-spitter.ogg",
          volume = 0.6
        }
      },
    },
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 1.0
      }
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
	open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.5},
    healing_per_tick = 0.02,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    map_generator_bounding_box = {{-4.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    corpse = "spitter-spawner-corpse",
    dying_explosion = "spitter-spawner-die",
    animation =
    {
        filename = "__base__/graphics/entity/spawner/spawner-idle.png",
		priority = "high",
        line_length = 4,
        width = 248,
        height = 180,
        frame_count = 8,
        animation_speed = 0.18,
        direction_count = 1,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(2, -4),
		hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-idle.png",
		  priority = "high",
          line_length = 4,
          width = 490,
          height = 354,
          frame_count = 8,
          animation_speed = 0.18,
          direction_count = 1,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(3, -2),
          scale = 0.5
        },
		{
        filename = "__base__/graphics/entity/spawner/spawner-idle-mask.png",
        flags = { "mask" },
        width = 140,
        height = 118,
        frame_count = 8,
        animation_speed = 0.18,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(-2, -14),
        line_length = 4,
        tint = biter_spawner_tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-idle-mask.png",
          flags = { "mask" },
          width = 276,
          height = 234,
          frame_count = 8,
          animation_speed = 0.18,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(-1, -14),
          line_length = 4,
          tint = biter_spawner_tint,
          scale = 0.5
        },
		{
        filename = "__base__/graphics/entity/spawner/spawner-idle-shadow.png",
        draw_as_shadow = true,
        width = 232,
        height = 176,
        frame_count = 8,
        animation_speed = 0.18,
        run_mode = "forward-then-backward",
        shift = util.by_pixel(36, -2),
        line_length = 4,
        hr_version =
        {
          filename = "__base__/graphics/entity/spawner/hr-spawner-idle-shadow.png",
          draw_as_shadow = true,
          width = 464,
          height = 406,
          frame_count = 8,
          animation_speed = 0.18,
          run_mode = "forward-then-backward",
          shift = util.by_pixel(36, 10),
          line_length = 4,
          scale = 0.5
        }
	}
}
},
	crafting_categories = {"alien-breeder"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 2
    },
    energy_usage = "375kW",
    module_specification =
    {
      module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
	},
})