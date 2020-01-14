Constants = require("constants")

local function add_smelter_recipe(ingredient, ing_qty, res, res_qty, recipe_energy, order)
    local recipe = {
        type = "recipe",
        name = ingredient,
        category = "smelting",
        energy_required = recipe_energy,
        ingredients = {{ingredient, ing_qty}},
        products = {{res, res_qty}},
        order = "biter-bodies-" .. order,
        main_product = "",
        subgroup = "raw-resource",
        result = res,
        result_count = res_qty
    }
    local coal_item = data.raw.item["coal"]
    recipe.icons = {{icon = coal_item.icon, icon_size = coal_item.icon_size}}
    for _, icon_layer in pairs(data.raw.item[ingredient].icons) do
        table.insert(recipe.icons, icon_layer)
    end

    data:extend({recipe})
end

add_smelter_recipe("monster-body-small", 1, "coal", 1, 1, "a")
add_smelter_recipe("monster-body-medium", 1, "coal", 8, 8, "b")
add_smelter_recipe("monster-body-big", 1, "coal", 16, 16, "c")
add_smelter_recipe("monster-body-behemoth", 1, "coal", 32, 32, "d")

local body_oil_recipe = {
    type = "recipe",
    name = "biter-liquefaction",
    category = "oil-processing",
    enabled = true,
    energy_required = 60,
    ingredients = {
        {type = "fluid", name = "steam", amount = 500},
        {type = "item", name = "monster-body-behemoth", amount = 100}
    },
    results = {
        {type = "fluid", name = "heavy-oil", amount = 50}
    },
    main_product = "",
    icon = Constants.AssetModName .. "/graphics/icons/recipe/biter-liquefaction.png",
    icon_size = 32,
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-d[biter-liquefaction]",
    allow_decomposition = false
}

data:extend({body_oil_recipe})
