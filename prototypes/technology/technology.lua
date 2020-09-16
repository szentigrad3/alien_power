data:extend(
{
  	{
		type = "technology",
		name = "capture-capsule-1",
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
		name = "capture-capsule-2",
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
		prerequisites = {"capture-capsule-1", "advanced-electronics"},
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
		name = "capture-capsule-3",
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
		prerequisites = {"capture-capsule-2", "battery"},
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
		name = "capture-capsule-4",
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
		},
		prerequisites = {"capture-capsule-3"},
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
if mods["bobenemies"] then
data:extend(
{
		{
		type = "technology",
		name = "bob-biter-generator-1",
		icon = "__alien_power__/graphics/icons/capture-capsule-4.png",
		icon_size = 64,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bob-biter-generator-1"
			},
		},
		prerequisites = {"capture-capsule-4"},
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
		{
		type = "technology",
		name = "bob-biter-generator-2",
		icon = "__alien_power__/graphics/icons/capture-capsule-4.png",
		icon_size = 64,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bob-biter-generator-2"
			},
		},
		prerequisites = {"bob-biter-generator-1"},
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
		{
		type = "technology",
		name = "bob-biter-generator-3",
		icon = "__alien_power__/graphics/icons/capture-capsule-4.png",
		icon_size = 64,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bob-biter-generator-3"
			},
		},
		prerequisites = {"bob-biter-generator-2"},
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
end