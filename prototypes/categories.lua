--Recipe Categories
data:extend(
{
  {
        type = "recipe-category",
        name = "alien-power"
    },
	    {
        type = "recipe-category",
        name = "alien-recharge"
    },
	{
		type = "recipe-category",
		name = "alien-breeder"
  }
})
--Fuel Categories
data:extend(
{
	{
    type = "fuel-category",
    name = "alien-1"
	},
    {
    type = "fuel-category",
    name = "alien-2"
	},
    {
    type = "fuel-category",
    name = "alien-3"
	},
    {
    type = "fuel-category",
    name = "alien-4"
	},
	{
    type = "fuel-category",
    name = "alien-5"
	},
	{
    type = "fuel-category",
    name = "alien-6"
	},
	{
    type = "fuel-category",
    name = "alien-7"
	}
})
--Item subgroups
data:extend({
  {
      type = "item-subgroup",
      name = "alien-power",
      group = "production",
      order = "zz"
    },
    {
      type = "item-subgroup",
      name = "alien-generators",
      group = "production",
      order = "zz"
    },
    {
      type = "item-subgroup",
      name = "alien-breeder",
      group = "production",
      order = "zz"
    },
  })