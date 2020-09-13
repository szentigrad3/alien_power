data:extend(
{
 {
    type = "projectile",
    name = "biter-net",
    flags = {"not-on-map"},
    acceleration = 0,
	direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 12, type = "impact"}
          },
		}
	  }
	},  
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__alien_power__/graphics/entity/biter-net.png",
      frame_count = 1,
      width = 9,
      height = 35,
      priority = "high"
    },
    shadow =
    {
      filename = "__alien_power__/graphics/entity/biter-net-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
    },
  }
})