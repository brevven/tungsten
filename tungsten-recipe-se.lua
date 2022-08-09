-- Additional recipes if Space Exploration mod is enabled
local util = require("data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["tungsten-ore"] = {name= "tungsten-ore"}
  se_delivery_cannon_recipes["tungsten-plate"] = {name= "tungsten-plate"}
  se_delivery_cannon_recipes["tungsten-carbide"] = {name= "tungsten-carbide"}
  if util.me.cuw() then
    se_delivery_cannon_recipes["cuw"] = {name= "cuw"}
  end

  data:extend({
  {
    type = "recipe",
    icons = {
      { icon = "__base__/graphics/icons/landfill.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = "__bztungsten__/graphics/icons/tungsten-ore.png", icon_size = 64, scale = 0.25},
    },
    name = "landfill-tungsten-ore",
    category = "hard-recycling",
    order = "z-b-tungsten",
    subgroup = "terrain",
    result = "landfill",
    ingredients = {{"tungsten-ore", 50}},
  }
  })

if string.sub(mods["space-exploration"], 1, 3) >= "0.6" then
  data:extend({
  {
    type = "item-subgroup",
    name = "tungsten",
    group = "resources",
    order = "a-h-z-a",
  }
  })
  util.set_item_subgroup("tungsten-plate", "tungsten")
  util.set_item_subgroup("tungsten-carbide", "tungsten")
  util.set_item_subgroup("cuw", "tungsten")
  data:extend({
  {
    type = "item",
    name = "tungsten-ingot",
    icons = {{icon = "__bztungsten__/graphics/icons/tungsten-ingot.png", icon_size = 128}},
    order = "b-b",
    stack_size = 50,
    subgroup = "tungsten",
  },

  util.me.sinter() and {
    type = "item",
    name = "tungsten-powder",
    icons = {{icon = "__bztungsten__/graphics/icons/tungsten-powder.png", icon_size = 64, icon_mipmaps = 3}},
    order = "b-a-x",
    subgroup = "tungsten",
    stack_size = util.get_stack_size(200),
  } or {
    type = "fluid",
    name = "molten-tungsten",
    default_temperature = 3422,
    max_temperature = 3422,
    base_color = {r=255, g=160, b=60},
    flow_color = {r=255, g=160, b=60},
    icons = {{icon = "__bztungsten__/graphics/icons/molten-tungsten.png", icon_size = 128}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  util.me.sinter() and {
    type = "recipe",
    category = "smelting",
    name = "tungsten-powder",
    subgroup = "tungsten",
    results = {
      {type = "item", name = "tungsten-powder", amount = mods.Krastorio2 and 30 or 36},
    },
    energy_required = 60,
    ingredients = {
      {name = mods.Krastorio2 and "enriched-tungsten" or "tungsten-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  } or {
    type = "recipe",
    category = "smelting",
    name = "molten-tungsten",
    subgroup = "tungsten",
    results = {
      {type = "fluid", name = "molten-tungsten", amount = mods.Krastorio2 and 750 or 900},
    },
    energy_required = 60,
    ingredients = {
      {name = mods.Krastorio2 and "enriched-tungsten" or "tungsten-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "tungsten-ingot",
    category = "casting",
    results = {{"tungsten-ingot", 1}},
    energy_required = 18,
    ingredients = {
      util.me.sinter() and {type = "item", name = "tungsten-powder", amount = 15} or
      {type = "fluid", name = "molten-tungsten", amount = 375},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    name = "tungsten-carbide-casting",
    category = "casting",
    icons = {
      {icon = "__bztungsten__/graphics/icons/tungsten-carbide.png", icon_size = 128},
      util.me.sinter() and
      {icon = "__bztungsten__/graphics/icons/tungsten-powder.png", icon_size = 64, scale = 0.25, shift = {-8, -8}} or
      {icon = "__bztungsten__/graphics/icons/molten-tungsten.png", icon_size = 128, scale = 0.125, shift = {-8, -8}},
    },
    results = {{"tungsten-carbide", 4}},
    energy_required = 40,
    ingredients = {
      data.raw.item["coke"] and {"coke", 8} or {"coal", 16},
      util.me.sinter() and {type = "item", name = "tungsten-powder", amount = 15} or
      {type = "fluid", name = "molten-tungsten", amount = 375},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "crafting",
    name = "tungsten-ingot-to-plate",
    icons = {
      {icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128},
      {icon = "__bztungsten__/graphics/icons/tungsten-ingot.png", icon_size = 128, scale = 0.125, shift = {-8, -8}},
    },
    results = {
      {name = "tungsten-plate", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {name = "tungsten-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-tungsten"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tungsten-powder"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tungsten-ingot"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tungsten-ingot-to-plate"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "tungsten-carbide-casting"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "molten-tungsten"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tungsten-ingot"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tungsten-ingot-to-plate"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tungsten-carbide-casting"})
  util.add_prerequisite(data.raw.technology["se-processing-vulcanite"], util.me.tungsten_processing)
  if mods["Krastorio2"] then
    util.set_item_subgroup("enriched-tungsten", "tungsten")
    data.raw.recipe["enriched-tungsten-plate"].order= "d[tungsten-plate]"
    se_delivery_cannon_recipes["enriched-tungsten"] = {name= "enriched-tungsten"}
  end

else
  data.raw.item["tungsten-plate"].subgroup = "plates"
  data.raw.item["tungsten-carbide"].subgroup = "plates"
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
        {name = util.me.tungsten_plate, amount = 8},
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
        {name = util.me.tungsten_plate, amount = 12},
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
end

if mods["aai-industry"] and not mods["Krastorio2"] and not mods.bzfoundry then
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
      ingredients = {{"tungsten-plate", 4}, {"coal", 1}},
      result = "tungsten-carbide",
      result_count = 2,
    },
    expensive = {
      enabled = false,
      energy_required = 50,
      ingredients = {{"tungsten-plate", 4}, {"coal", 1}},
      result = "tungsten-carbide",
    },
  }
  })
  util.add_effect(util.me.tungsten_processing, {type = "unlock-recipe", recipe= "tungsten-carbide-coal"})
end
