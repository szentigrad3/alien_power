data:extend(
{
 {
    type = 'recipe',
    name = 'biter-recharge-1',
    category = 'alien-recharge',
    enabled = true,
	hide_from_player_crafting = true,
    energy_required = 30,
    ingredients = {
        {type = 'item', name = 'small-used-biter', amount = 1},
        {type = 'item', name = 'biter-meat', amount = 5},
    },
    results = {
        {type = 'item', name = 'small-biter-power', amount = 1},
    },
},
 {
    type = 'recipe',
    name = 'biter-recharge-2',
    category = 'alien-recharge',
    enabled = true,
	hide_from_player_crafting = true,
    energy_required = 30,
    ingredients = {
        {type = 'item', name = 'medium-used-biter', amount = 1},
        {type = 'item', name = 'biter-meat', amount = 5},
    },
    results = {
        {type = 'item', name = 'medium-biter-power', amount = 1},
    },
},
 {
    type = 'recipe',
    name = 'biter-recharge-3',
    category = 'alien-recharge',
    enabled = true,
	hide_from_player_crafting = true,
    energy_required = 30,
    ingredients = {
        {type = 'item', name = 'big-used-biter', amount = 1},
        {type = 'item', name = 'biter-meat', amount = 5},
    },
    results = {
        {type = 'item', name = 'big-biter-power', amount = 1},
    },
},
 {
    type = 'recipe',
    name = 'biter-recharge-4',
    category = 'alien-recharge',
    enabled = true,
	hide_from_player_crafting = true,
    energy_required = 30,
    ingredients = {
        {type = 'item', name = 'behemoth-used-biter', amount = 1},
        {type = 'item', name = 'biter-meat', amount = 5},
    },
    results = {
        {type = 'item', name = 'behemoth-biter-power', amount = 1},
    },
},
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
})