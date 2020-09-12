data:extend(
{
	{
    type = "item",
    name = "charged-bitter",
    icons =
	{
        {icon = "__alien_power__/graphics/icons/charged-bitter.png"}
    },
    icon_size = 64,
    flags = {},
    subgroup = "alien-power",
    order = "a",
    stack_size = 300,
    fuel_category = 'alien',
    fuel_value = '250MJ',
    burnt_result = 'used-bitter'
	},
	{
    type = "item",
    name = "used-bitter",
    icons =
	{
        {icon = "__alien_power__/graphics/icons/bitter.png"},
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
    name = "bitter-gun",
    icon = "__alien_power__/graphics/icons/bitter-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    order = "d[bitter-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "net",
      movement_slow_down_factor = 0.8,
      cooldown = 10,
      projectile_creation_distance = 0.6,
      range = 36,
      projectile_center = {-0.17, 0},
      sound =
      {
        {
          filename = "__base__/sound/fight/rocket-launcher.ogg",
          volume = 0.7
        }
      }
    },
    stack_size = 5
	},
	{
    type = "ammo",
    name = "bitter-net",
    icon = "__alien_power__/graphics/icons/bitter-net.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      category = "net",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          }
        }
      }
    },
    subgroup = "alien-power",
    order = "d[bitter-gun]-a[basic]",
    stack_size = 200
	},
	{
    type = "item",
    name = "bitter-meat",
    icon = "__alien_power__/graphics/icons/meat.png",
    icon_size = 32,
    icon_mipmaps = 6,
    flags = {},
    subgroup = "alien-power",
    order = "a",
    stack_size = 200
	}
 })