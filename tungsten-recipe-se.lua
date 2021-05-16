-- Additional recipes if Space Exploration mod is enabled
local util = require("__bztungsten__.util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["tungsten-ore"] = {name= "tungsten-ore"}
  se_delivery_cannon_recipes["tungsten_plate"] = {name= "tungsten_plate"}
  if mods["Krastorio2"] then
    data:extend({
    {
      type = "recipe",
      name = "enriched-tungsten-smelting-vulcanite",
      category = "smelting",
      order = "d[tungsten-plate]",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "enriched-tungsten", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = util.tungsten_plate, amount = 12},
      },
      icons =
      {
        { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 64, icon_mipmaps = 3 },
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "enriched-tungsten-smelting-vulcanite"})
    data.raw.recipe["enriched-tungsten-plate"].order= "d[tungsten-plate]"
    se_delivery_cannon_recipes["enriched-tungsten"] = {name= "enriched-tungsten"}
  else
    data:extend({
    {
      type = "recipe",
      name = "tungsten-smelting-vulcanite",
      category = "smelting",
      order = "d[tungsten-plate]",
      energy_required = 48,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "tungsten-ore", amount = 20},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = util.tungsten_plate, amount = 30},
      },
      icons =
      {
        { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 64, icon_mipmaps = 3,},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "tungsten-smelting-vulcanite"})
  end
end
