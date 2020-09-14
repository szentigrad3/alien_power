data:extend(
{
  {
    type = "sticker",
    name = "net-slowdown-sticker",
    --icon = "__base__/graphics/icons/slowdown-sticker.png",
    icon_size = 32,
    flags = {},
    animation = {
      filename = "__alien_power__/graphics/entity/biter-net.png",
      priority = "extra-high",
      frame_count = 1,
      width = 128,
      height = 128,
      --tint = {r = 0.250, g = 0.663, b = 0.000, a = 0.694},
      --shift = util.by_pixel (2,-1),
      hr_version = 
      {
        filename = "__alien_power__/graphics/entity/biter-net.png",
        frame_count = 1,
        width = 128,
        height = 128,
        --tint = {r = 0.250, g = 0.663, b = 0.000, a = 0.694},
        --shift = util.by_pixel(2, -0.5),
        scale = 0.5
      }
    },
    duration_in_ticks = 30 * 60,
    target_movement_modifier = 0.01
    --damage_per_tick = { amount = 0 / 60, type = "bio" },
  },
  {
    type = "projectile",
    name = "biter-net",
    flags = {"not-on-map"},
	collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
    acceleration = -0.001,
    direction_only = true,
    action = {
      type = "direct",
      ignore_collision_condition = false,
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = {amount = 10, type = "physical"},
            apply_damage_to_trees = false,
            show_in_tooltip = true
          },
          {
            type = "damage",
            damage = {amount = 2, type = "impact"},
            apply_damage_to_trees = true,
            show_in_tooltip = true
          },
          {
            type = "create-sticker",
            sticker = "net-slowdown-sticker",
            show_in_tooltip = false
          },
        }
      },
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__alien_power__/graphics/entity/biter-net.png",
      frame_count = 1,
      width = 128,
      height = 128,
      priority = "high"
    },
  }
})