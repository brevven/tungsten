-- Tungsten smelting

local util = require("__bztungsten__.data-util");

data:extend({
  { type = "recipe-category", name = "smelting-carbon"},
})

if not mods.bobplates then
data:extend({
  {
    type = "item",
    name = "tungsten-carbide",
    icon = "__bztungsten__/graphics/icons/tungsten-carbide.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "z[tungsten-carbide]",
    stack_size = util.get_stack_size(100)
  },
  {
    type = "item",
    name = util.me.tungsten_plate,
    icon = "__bztungsten__/graphics/icons/tungsten-plate.png",
    icon_size = 128, icon_mipmaps = 3,
    subgroup = "raw-material",
    order = "b[tungsten-plate]",
    stack_size = util.get_stack_size(100)
  }
})
end

data:extend({
  {
    type = "recipe",
    name = util.me.tungsten_plate,
    main_product = util.me.tungsten_plate,
    category = "smelting",
    order = "d[tungsten-plate]",
    icons = (mods["Krastorio2"] and {
          { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128, icon_mipmaps = 3, },
          { icon = "__bztungsten__/graphics/icons/tungsten-ore.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-8, -8}},
        } or mods.bobplates and {
          { icon = "__bobplates__/graphics/icons/plate/tungsten-plate.png", icon_size = 32},
        } or
        {
          { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128},
        }),
    normal = (mods["Krastorio2"] and
        {
          enabled = false,
          energy_required = 24,
          ingredients = {{"tungsten-ore", 15}},
          result = util.me.tungsten_plate,
          result_count = 5,
        } or
        {
          enabled = false,
          energy_required = 32/15,
          ingredients = {{"tungsten-ore", mods.bobplates and 4 or 2}},
          result = util.me.tungsten_plate,
        }),
    expensive = (mods["Krastorio2"] and
        {
          enabled = false,
          energy_required = 32,
          ingredients = {{"tungsten-ore", 20}},
          result = util.me.tungsten_plate,
          result_count = 5,
        } or
        {
          enabled = false,
          energy_required = 48/15,
          ingredients = {{"tungsten-ore", mods.bobplates and 6 or 3}},
          result = util.me.tungsten_plate,
        }),
  },
  {
    type = "technology",
    name = util.me.tungsten_processing,
    icons = {{ icon =
      mods.bobplates
      and "__bobplates__/graphics/icons/technology/tungsten-processing.png"
      or "__bztungsten__/graphics/technology/tungsten-processing.png",
      icon_size = mods.bobplates and 64 or 256,
    }},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = util.me.tungsten_plate
      },
      {
        type =  "unlock-recipe",
        recipe = util.me.tungsten_carbide_recipe,
      },
      mods["TheBigFurnace"] and {
        type = "unlock-recipe",
        recipe = "big-tungsten-plate",
      } or nil,
    },
    unit =
    {
      count = 75,
      ingredients = 
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
      time = 30,
    },
    prerequisites = {"advanced-material-processing"},
    order = "b-b"
  },
  mods["TheBigFurnace"] and {
    type = "recipe",
    name = "big-tungsten-plate",
    icons = { { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128 }, },
    subgroup = "raw-material",
    category = "big-smelting",
    order = "d[tungsten-plate]",
    normal =
    {
      enabled = false,
      energy_required = 6, --TODO
      ingredients = {{"tungsten-ore", 100}},
      results = {
        {type="item", name = util.me.tungsten_plate, amount=50},
      }
    },
    expensive =
    {
      enabled = false,
      energy_required = 15, --TODO
      ingredients = {{"tungsten-ore", 99}},
      results = {
        {type="item", name = util.me.tungsten_plate, amount=33},
      }
    }
  } or nil,
})

data:extend({
  {
    type = "recipe",
    name = util.me.tungsten_carbide_recipe,
    main_product = util.me.tungsten_carbide_recipe,
    category = (mods["Krastorio2"] and "smelting" or "smelting-carbon"),
    order = "z[tungsten-carbide]",
    icons = { mods.bobplates and 
      { icon = "__bobplates__/graphics/icons/plate/tungsten-carbide-plate.png", icon_size = 64}
      or { icon = "__bztungsten__/graphics/icons/tungsten-carbide.png", icon_size = 128}
    },
    normal = (mods["Krastorio2"] and
        {
          enabled = false,
          energy_required = 48,
          ingredients = {{"tungsten-plate", 10}, {"coke", 5}},
          result = "tungsten-carbide",
          result_count = 4,
        } or {
          enabled = false,
          energy_required = 64/3,
          ingredients = {{"tungsten-plate", 5}},
          result = "tungsten-carbide",
          result_count = 2,
        }),
    expensive = (mods["Krastorio2"] and
    {
      enabled = false,
      energy_required = 48,
      ingredients = {{"tungsten-plate", 10}, {"coke", 5}},
      result = "tungsten-carbide",
      result_count = 2,
    } or {
      enabled = false,
      energy_required = 64/3,
      ingredients = {{"tungsten-plate", 5}},
      result = "tungsten-carbide",
    }),
  },
})

data:extend({
  {
    type = "item",
    name = "rocket-engine-nozzle",
    icon = "__bztungsten__/graphics/icons/rocket-engine-nozzle.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "z[rocket-engine-nozzle]",
    stack_size = util.get_stack_size(100)
  },
  {
    type = "recipe",
    name = "rocket-engine-nozzle",
    category = "crafting",
    subgroup = "intermediate-product",
    order = "z[rocket-engine-nozzle]",
    icons = {
          { icon = "__bztungsten__/graphics/icons/rocket-engine-nozzle.png", icon_size = 128}
    },
    enabled = false,
    energy_required = 5,
    ingredients =  {{"tungsten-plate", 2}},
    results = {{"rocket-engine-nozzle", 1}},
  }
})

