ITEM {
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
}
ITEM {
    type = "item",
    name = "used-bitter",
    icons =
	{
        {icon = "__alien_power__/graphics/icons/bitter.png"},
        {icon = "__alien_power__/graphics/icons/tired.png"},
    },
	icon_size = 64,
    flags = {},
    subgroup = "alien-used",
    order = "x",
    stack_size = 1
}