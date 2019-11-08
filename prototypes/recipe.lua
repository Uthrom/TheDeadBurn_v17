local function add_smelter_recipe( ingredient, ing_qty, res, res_qty, recipe_energy)
  local recipe = {
    type = "recipe",
    name = ingredient,
    category = "smelting",
    energy_required = recipe_energy,
    ingredients = {{ ingredient, ing_qty}},
    products = {{ res, res_qty }},
    result = res,
    result_count = res_qty,
  }

  log(serpent.block(recipe))
  data:extend({recipe})
end

add_smelter_recipe("monster-body-small", 1, "coal", 1,  1)
add_smelter_recipe("monster-body-medium", 1, "coal", 2,  2)
add_smelter_recipe("monster-body-big", 1, "coal", 4,  4)
add_smelter_recipe("monster-body-behemoth", 1, "coal", 8,  8)
