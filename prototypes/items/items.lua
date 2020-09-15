data:extend(
{
	{
    type = "item",
    name = "small-biter-power",
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
    burnt_result = 'small-used-biter'
	},
	{
    type = "item",
    name = "small-used-biter",
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
    type = "item",
    name = "small-biter-meat",
    icon = "__alien_power__/graphics/icons/meat.png",
    icon_size = 32,
    icon_mipmaps = 6,
    flags = {},
    subgroup = "alien-power",
    order = "a",
    stack_size = 200
	}
 })