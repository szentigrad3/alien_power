data:extend(
{
 {
    type = 'recipe',
    name = 'biter-recharge',
    category = 'alien-recharge',
    enabled = true,
    energy_required = 30,
    ingredients = {
        {type = 'item', name = 'used-biter', amount = 1},
        {type = 'item', name = 'biter-meat', amount = 5},
    },
    results = {
        {type = 'item', name = 'biter-power', amount = 1},
    },
},
{
    type = 'recipe',
    name = 'biter-gun',
    category = 'alien-power',
    enabled = false,
    energy_required = 30,
    ingredients = {
        {type = 'item', name = 'iron-plate', amount = 1},
    },
    results = {
        {type = 'item', name = 'biter-gun', amount = 1},
    },
},
{
    type = 'recipe',
    name = 'biter-net',
    category = 'alien-power',
    enabled = false,
    energy_required = 30,
    ingredients = {
        {type = 'item', name = 'iron-plate', amount = 1},
    },
    results = {
        {type = 'item', name = 'biter-net', amount = 1},
    },
}
})