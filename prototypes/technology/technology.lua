data:extend(
{
  {
    type = "technology",
    name = "biter-power",
    localised_name = {"technology-name.biter-power"},
    localised_description = {"technology-description.biter-power"},
    icon_size = 128,
    icon = "__alien_power__/graphics/technology/biter-power.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "biter-generator-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "rest-camp"
      },
	  {
        type = "unlock-recipe",
        recipe = "biter-gun"
      },
	  {
        type = "unlock-recipe",
        recipe = "biter-net"
      }
    },
    unit =
    {
      count = 75,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 10
    },
    prerequisites = {"advanced-electronics"},
    order = "c-a"
  },
 }
)