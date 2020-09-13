data:extend(
{
	{
    type = "item",
    name = "biter-power",
    icons =
	{
        {icon = "__alien_power__/graphics/icons/biter.png"}
    },
    icon_size = 64,
    flags = {},
    subgroup = "alien-power",
    order = "a",
    stack_size = 300,
    fuel_category = 'alien',
    fuel_value = '250MJ',
    burnt_result = 'used-biter'
	},
	{
    type = "item",
    name = "used-biter",
    icons =
	{
        {icon = "__alien_power__/graphics/icons/biter.png"},
        {icon = "__alien_power__/graphics/icons/tired.png"},
    },
	icon_size = 64,
    flags = {},
    subgroup = "alien-power",
    order = "x",
    stack_size = 1
	},
	{
    type = "gun",
    name = "biter-gun",
    icon = "__alien_power__/graphics/icons/biter-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "d[biter-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      movement_slow_down_factor = 0.8,
      cooldown = 90,
      projectile_creation_distance = 0.6,
      range = 36,
      sound =
      {
        {
          filename = "__alien_power__/sounds/biter-gun.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 5
	},
	{
    type = "ammo",
    name = "biter-net",
    icon = "__alien_power__/graphics/icons/biter-net.png",
    icon_size = 128,
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          projectile = "biter-net",
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[biter-gun]-a[basic]",
    stack_size = 200
	},
	{
    type = "item",
    name = "biter-meat",
    icon = "__alien_power__/graphics/icons/meat.png",
    icon_size = 32,
    icon_mipmaps = 6,
    flags = {},
    subgroup = "alien-power",
    order = "a",
    stack_size = 200
	}
 })