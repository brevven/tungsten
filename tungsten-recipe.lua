-- Tungsten smelting

local util = require("__bztungsten__.tungsten-util");

data:extend({
  { type = "recipe-category", name = "smelting-carbon"},
})
data:extend(
{
  {
    type = "recipe",
    name = util.tungsten_plate,
    category = "smelting",
    subgroup = "raw-material",
    order = "d[tungsten-plate]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128, icon_mipmaps = 3, },
          { icon = "__bztungsten__/graphics/icons/tungsten-ore.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-8, -8}},
        } or {
          { icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 128, icon_mipmaps = 3, },
        }
),
    normal = (mods["Krastorio2"] and
        {
          enabled = false,
          energy_required = 24,
          ingredients = {{"tungsten-ore", 15}},
          result = util.tungsten_plate,
          result_count = 5,
        } or
        {
          enabled = false,
          energy_required = 32/15,
          ingredients = {{"tungsten-ore", 2}},
          result = util.tungsten_plate,
        }),
    expensive =
    {
      enabled = false,
      energy_required = 9.6,
      ingredients = {{"tungsten-ore", 3}},
      result = util.tungsten_plate
    }
  },
  {
    type = "item",
    name = util.tungsten_plate,
    icon = "__bztungsten__/graphics/icons/tungsten-plate.png",
    icon_size = 128, icon_mipmaps = 3,
    subgroup = "raw-material",
    order = "b[tungsten-plate]",
    stack_size = util.get_stack_size(100)
  },
  {
    type = "technology",
    name = "tungsten-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__bztungsten__/graphics/technology/tungsten-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = util.tungsten_plate
      },
      {
        type =  "unlock-recipe",
        recipe = "tungsten-carbide",
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
        {type="item", name = util.tungsten_plate, amount=50},
      }
    },
    expensive =
    {
      enabled = false,
      energy_required = 15, --TODO
      ingredients = {{"tungsten-ore", 99}},
      results = {
        {type="item", name = util.tungsten_plate, amount=33},
      }
    }
  } or nil,
})

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
    type = "recipe",
    name = "tungsten-carbide",
    category = (mods["Krastorio2"] and "smelting" or "smelting-carbon"),
    subgroup = "raw-material",
    order = "z[tungsten-carbide]",
    icons = { { icon = "__bztungsten__/graphics/icons/tungsten-carbide.png", icon_size = 128} },
    normal = (mods["Krastorio2"] and
        {
          enabled = false,
          energy_required = 48,
          ingredients = {{"tungsten-plate", 10}, {"coke", 5}},
          result = "tungsten-carbide",
          result_count = 4,
        } or
        {
          enabled = false,
          energy_required = 64/3,
          ingredients = {{"tungsten-plate", 5}},
          result = "tungsten-carbide",
          result_count = 2,
        }),
    expensive =
    {
      enabled = false,
      energy_required = 25.6,
      ingredients = {{"tungsten-plate", 5}},
      result = "tungsten-carbide",
    }
  },
})

local nozzle_i = {{"tungsten-plate", 2}}

if mods.bzzirconium then
  table.insert(nozzle_i, {"zirconium-plate", 1})
end

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
    energy_required = 5 * #nozzle_i,
    ingredients = nozzle_i,
    result = "rocket-engine-nozzle",
    result_count = #nozzle_i
  }
})

