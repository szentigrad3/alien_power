data:extend(
{
  {
    type = "technology",
    name = "bitter-power",
    localised_name = {"technology-name.bitter-power"},
    localised_description = {"technology-description.bitter-power"},
    icon_size = 128,
    icon = "__alien_power__/graphics/technology/bitter-power.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bitter-generator-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "rest-camp"
      },
	  {
        type = "unlock-recipe",
        recipe = "bitter-gun"
      },
	  {
        type = "unlock-recipe",
        recipe = "bitter-net"
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