Constants = require("constants")

data:extend(
    {
        {
            group = "intermediate-products",
            name = "biter-liquefaction",
            order = "c",
            type = "item-subgroup"
        }
    }
)

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

local function add_oil_recipe(ingredient, ing_qty, recipe_energy, order, tint)
    local body_oil_recipe = {
        name = ingredient .. "-biter-liquefaction",
        allow_decomposition = false,
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = recipe_energy,
        icon_mipmaps = 4,
        icon_size = 64,
        icons = {
            {icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png", icon_mipmaps = 4, icon_size = 64},
            {icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png", icon_mipmaps = 4, icon_size = 64, tint = {a = 0.75, b = 0, g = 0, r = 0}},
            {icon = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png", icon_mipmaps = 4, icon_size = 64, tint = {a = 0.5, b = 0.5, g = 0.5, r = 0.5}},
            {icon = "__base__/graphics/icons/fluid/crude-oil.png", icon_mipmaps = 4, icon_size = 64, scale = 0.25, shift = {4, -8}},
            {icon = "__base__/graphics/icons/medium-biter-corpse.png", tint = tint, icon_mipmaps = 4, icon_size = 64, scale = 0.25, shift = {-4, -8}}
        },
        ingredients = {
            {amount = 50, catalyst_amount = 50, name = "steam", type = "fluid"},
            {amount = ing_qty, name = "monster-body-" .. ingredient, type = "item"},
            {amount = 1, catalyst_amount = 1, name = "empty-barrel", type = "item"}
        },
        order = "c[fill-crude-oil-barrel]" .. order,
        results = {
            {amount = 1, catalyst_amount = 1, name = "crude-oil-barrel", type = "item"}
        },
        subgroup = "biter-liquefaction",
        type = "recipe"
    }

    data:extend({body_oil_recipe})

    local tech = data.raw.technology["fluid-handling"]
    table.insert(tech.effects, {recipe = body_oil_recipe.name, type = "unlock-recipe"})
end

add_smelter_recipe("monster-body-small", 1, "coal", 1, 1, "a")
add_smelter_recipe("monster-body-medium", 1, "coal", 8, 8, "b")
add_smelter_recipe("monster-body-big", 1, "coal", 16, 16, "c")
add_smelter_recipe("monster-body-behemoth", 1, "coal", 32, 32, "d")

add_oil_recipe("small", 125, 10, "a", nil)
add_oil_recipe("medium", 25, 10, "b", {r = 255, g = 0, b = 0})
add_oil_recipe("big", 5, 10, "c", {r = 0, g = 0, b = 255})
add_oil_recipe("behemoth", 1, 10, "d", {r = 0, g = 255, b = 0})
