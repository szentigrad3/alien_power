data:extend(
{
{
    type = "recipe",
    name = "rest-camp",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"steel-plate", 50},
        {"iron-plate", 50},
        {"wood", 50},
        {"electronic-circuit", 10},
        {"iron-gear-wheel", 50},
    },
    results = {
        {"rest-camp", 1}
    }
},
{
    type = "item",
    name = "rest-camp",
    icon = "__alien_power__/graphics/icons/rest-camp.png",
    icon_size = 32,
    flags = {},
    subgroup = "alien-generators",
    order = "z",
    place_result = "rest-camp",
    stack_size = 10
},
{
    type = "assembling-machine",
    name = "rest-camp",
    icon = "__alien_power__/graphics/icons/rest-camp.png",
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "rest-camp"},
    fast_replaceable_group = "rest-camp",
    max_health = 100,
    corpse = "medium-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.8, -4.8}, {4.8, 4.8}},
    selection_box = {{-5.0, -5.0}, {5.0, 5.0}},
    --draw_entity_info_icon_background = false,
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"speed","consumption"},
    crafting_categories = {"alien-recharge"},
    crafting_speed = 2.5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = -0.1,
    },
    energy_usage = "100kW",
    ingredient_count = 10,
	animation =
		{			
			north = { filename = "__alien_power__/graphics/entity/rest-camp/cage_v14.png", width = 192, height = 192, shift = {0.375, -0.125}, frame_count = 36, line_length = 9, animation_speed=0.25, },						
			south = { filename = "__alien_power__/graphics/entity/rest-camp/cage_v14.png", width = 192, height = 192, shift = {0.375, -0.125}, frame_count = 36, line_length = 9, animation_speed=0.25, },						
			east = { filename = "__alien_power__/graphics/entity/rest-camp/cage_h14.png", width = 192, height = 192, shift = {0.125, -0.5}, frame_count = 36, line_length = 9, animation_speed=0.25, }	,								
			west = { filename = "__alien_power__/graphics/entity/rest-camp/cage_h14.png", width = 192, height = 192, shift = {0.125, -0.5}, frame_count = 36, line_length = 9, animation_speed=0.25, }	,					
		},		
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__alien_power__/sounds/rest-camp.ogg", volume = 2.5},
        idle_sound = {filename = "__alien_power__/sounds/rest-camp.ogg", volume = 1.5},
        apparent_volume = 2.5
    }
}
})