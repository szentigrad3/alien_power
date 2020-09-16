if mods["bobenemies"] then
data:extend(
{
 {
    type = "recipe",
    name = "bob-biter-generator-1",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"steel-plate", 75},
        {"stone-wall", 40},
        {"processing-unit", 50},
        {"iron-plate", 100},
		{"express-transport-belt", 30},
        {"iron-gear-wheel", 100}
    },
    results = {
        {"bob-biter-generator-1", 1}
    }
},
{
    type = "item",
    name = "bob-biter-generator-1",
    icon = "__base__/graphics/icons/market.png",
    icon_size = 64,
    icon_mipmaps=4,
    flags = {},
    subgroup = "alien-generators",
    order = "a",
    place_result = "bob-biter-generator-1",
    stack_size = 15
},
{
    type = "burner-generator",
    name = "bob-biter-generator-1",
    icon = "__base__/graphics/icons/market.png",
    icon_size = 32,
    icon_mipmaps=4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "bob-biter-generator-1"},
    max_health = 100,
    corpse = "big-remnants",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    energy_source =
		{
				type = "electric",
				usage_priority = "primary-output",
		},
	burner =
		{
			type = "burner",
			fuel_category = "alien-5",
			effectivity = 2,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
			emissions_per_minute = 0,
		},
	effectivity = 1,
	max_power_output = "252.7kW",
	animation = {
				filename = "__base__/graphics/entity/market/market.png",
				width = 156,
				height = 127,
				frame_count = 1,
				line_length = 1,
				shift = {0.00, -0.35}
						},

    min_perceived_performance = 0.1,
    performance_to_sound_speedup = 0.0,
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {
	{
      filename = "__base__/sound/creatures/biter-roar-1.ogg",
      volume = 0.80
    },
    {
      filename = "__base__/sound/creatures/biter-roar-2.ogg",
      volume = 0.80
    },
    {
      filename = "__base__/sound/creatures/biter-roar-3.ogg",
      volume = 0.80
    },
    {
      filename = "__base__/sound/creatures/biter-roar-4.ogg",
      volume = 0.80
    },
    {
      filename = "__base__/sound/creatures/biter-roar-5.ogg",
      volume = 0.80
    },
    {
      filename = "__base__/sound/creatures/biter-roar-6.ogg",
      volume = 0.80
    }
	},
        idle_sound = {filename = "__base__/sound/creatures/biter-roar-1.ogg", volume = 0.45},
        apparent_volume = 2.5
    }
	}
})
end