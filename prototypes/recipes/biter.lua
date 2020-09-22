data:extend(
{
  {
    type = "recipe",
    name = "capture-capsule-1",
    enabled = "false",
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-plate", 1},
      {"copper-cable", 2},
    },
    result = "capture-capsule-1"
  },
  {
    type = "recipe",
    name = "capture-capsule-2",
    enabled = "false",
    ingredients =
    {
      {"advanced-circuit", 1},
      {"iron-plate", 1},
      {"red-wire", 2},
    },
    result = "capture-capsule-2"
  },
  {
    type = "recipe",
    name = "capture-capsule-3",
    enabled = "false",
    ingredients =
    {
      {"advanced-circuit", 1},
      {"iron-plate", 1},
      {"battery", 1},
      {"red-wire", 2},
    },
    result = "capture-capsule-3"
  },
  {
    type = "recipe",
    name = "capture-capsule-4",
    enabled = "false",
    ingredients =
    {
      {"processing-unit", 1},
      {"iron-plate", 1},
      {"battery", 1},
      {"red-wire", 1},
      {"green-wire", 1},
      {"biter-meat", 1},
    },
    result = "capture-capsule-4"
  },
  {
    type = "recipe",
    name = "recapture-capsule",
    enabled = "false",
    hide_from_player_crafting = true,
    ingredients =
    {
      {"electronic-circuit", 2},
      {"iron-plate", 3},
      {"green-wire", 3},
    },
    result = "recapture-capsule",
    result_count = 10
  },
    {
    type = "recipe",
    name = "breed-biter",
	category = "alien-breeder",
	energy_required = 300,
    enabled = "false",
    ingredients =
    {
      {"biter-egg", 1},
    },
    result = "small-biter-power"
  },
})
