-- Additional recipes if Space Exploration mod is enabled
local util = require("__bztungsten__.data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["tungsten-ore"] = {name= "tungsten-ore"}
  se_delivery_cannon_recipes["tungsten-plate"] = {name= "tungsten-plate"}
  se_delivery_cannon_recipes["tungsten-carbide"] = {name= "tungsten-carbide"}
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
        {name = util.tungsten_plate, amount = 8},
      },
      icons =
      {
        { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128, icon_mipmaps = 3 },
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
      energy_required = 16,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "tungsten-ore", amount = 16},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = util.tungsten_plate, amount = 12},
      },
      icons =
      {
        { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128, icon_mipmaps = 3,},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    util.add_effect("se-processing-vulcanite", {type = "unlock-recipe", recipe= "tungsten-smelting-vulcanite"})
  end
end
if mods["aai-industry"] and not mods["Krastorio2"] then
  data:extend({
    {
    type = "recipe",
    name = "tungsten-carbide-coal",
    category = "smelting",
    order = "z[tungsten-carbide]",
    icons =
    {
      { icon = "__bztungsten__/graphics/icons/tungsten-carbide.png", icon_size = 128 },
      { icon = "__base__/graphics/icons/coal.png", icon_size = 64, icon_mipmaps=4, scale=0.25, shift= {-10, -10}},
    },
    normal = {
      enabled = false,
      energy_required = 50,
      ingredients = {{"tungsten-plate", 5}, {"coal", 1}},
      result = "tungsten-carbide",
      result_count = 2,
    },
    expensive = {
      enabled = false,
      energy_required = 50,
      ingredients = {{"tungsten-plate", 5}, {"coal", 1}},
      result = "tungsten-carbide",
    },
  }
  })
  util.add_effect(util.tungsten_processing, {type = "unlock-recipe", recipe= "tungsten-carbide-coal"})
end
