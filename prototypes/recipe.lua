require("constants")

local function add_smelter_recipe(ingredient, ing_qty, res, res_qty, recipe_energy)
    local recipe = {
        type = "recipe",
        name = ingredient,
        category = "smelting",
        energy_required = recipe_energy,
        ingredients = {{ingredient, ing_qty}},
        products = {{res, res_qty}},
        result = res,
        result_count = res_qty
    }

    data:extend({recipe})
end

add_smelter_recipe("monster-body-small", 1, "coal", 1, 1)
add_smelter_recipe("monster-body-medium", 1, "coal", 8, 8)
add_smelter_recipe("monster-body-big", 1, "coal", 16, 16)
add_smelter_recipe("monster-body-behemoth", 1, "coal", 32, 32)

local body_oil_recipe = {
    type = "recipe",
    name = "biter-liquefaction",
    category = "oil-processing",
    enabled = true,
    energy_required = 60,
    ingredients =
    {
        {type="fluid", name="steam", amount=500},
	{type="item", name="monster-body-behemoth", amount=100}
    },
    results=
    {
	{type="fluid", name="heavy-oil", amount=50},
    },
    icon = Constants.AssetModName .. "/graphics/icons/recipe/biter-liquefaction.png",
    icon_size = 32,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-d[biter-liquefaction]",
    allow_decomposition = false

}

data:extend({body_oil_recipe})

