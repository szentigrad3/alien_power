data:extend(
{
  	{
		type = "technology",
		name = "capture-capsule-a",
		icon = "__alien_power__/graphics/icons/capture-capsule-1.png",
		icon_size = 64,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "capture-capsule-1"
			},
			{
				type = "unlock-recipe",
				recipe = "biter-generator-1"
			},
			{
				type = "unlock-recipe",
				recipe = "rest-camp"
			},
		},
		prerequisites = {},
		unit =
		{
			count = 10,
			ingredients =
			{
				{"automation-science-pack", 1},
			},
			time = 10
		},
		order = "a[capture-capsules]-a[capture-capsule-1]"
	},
	{
		type = "technology",
		name = "capture-capsule-b",
		icon = "__alien_power__/graphics/icons/capture-capsule-2.png",
		icon_size = 64,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "capture-capsule-2"
			},
			{
				type = "unlock-recipe",
				recipe = "biter-generator-2"
			},
		},
		prerequisites = {"capture-capsule-a", "advanced-electronics"},
		unit =
		{
			count = 10,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			},
			time = 10
		},
		order = "a[capture-capsules]-b[capture-capsule-2]"
	},
	{
		type = "technology",
		name = "capture-capsule-c",
		icon = "__alien_power__/graphics/icons/capture-capsule-3.png",
		icon_size = 64,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "capture-capsule-3"
			},
			{
				type = "unlock-recipe",
				recipe = "biter-generator-3"
			},
		},
		prerequisites = {"capture-capsule-b", "battery"},
		unit =
		{
			count = 10,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
			},
			time = 10
		},
		order = "a[capture-capsules]-c[capture-capsule-3]"
	},
	{
		type = "technology",
		name = "capture-capsule-d",
		icon = "__alien_power__/graphics/icons/capture-capsule-4.png",
		icon_size = 64,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "capture-capsule-4"
			},
			{
				type = "unlock-recipe",
				recipe = "biter-generator-4"
			},
			{
				type = "unlock-recipe",
				recipe = "breeder-spawner"
			},
		},
		prerequisites = {"capture-capsule-c"},
		unit =
		{
			count = 10,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 10
		},
		order = "a[capture-capsules]-d[capture-capsule-4]"
	},
	}
)
