local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local util = require("__bztungsten__.tungsten-util");

if mods["FactorioExtended-Plus-Core"] then
  util.remove_raw("item", "tungsten-ore")
end

data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "tungsten-ore",
    richness = true,
    order = "b-e"
	},
	{
    type = "noise-layer",
    name = "tungsten-ore"
	},
	{
    type = "resource",
    icon_size = 64, icon_mipmaps = 3,
    name = "tungsten-ore",
    icon = "__bztungsten__/graphics/icons/tungsten-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.90, g=0.90, b=0.80},
    minable =
    {
      hardness = 1,
      mining_particle = "tungsten-ore-particle",
      mining_time = 2,
      fluid_amount=(mods["Krastorio2"] and 1 or 10),
      required_fluid=(mods["Krastorio2"] and "mineral-water" or "water"),
      result = "tungsten-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "tungsten-ore",
      order = "b-z",
      base_density = 4,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1.2
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
      filename = "__bztungsten__/graphics/entity/ores/tungsten-ore.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
      filename = "__bztungsten__/graphics/entity/ores/hr-tungsten-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
          }
    },
  },
  {
      type = "item",
      name = "tungsten-ore",
      icon_size = 64, icon_mipmaps = 3,
      icon = "__bztungsten__/graphics/icons/tungsten-ore.png",
      pictures = {
        {filename="__bztungsten__/graphics/icons/tungsten-ore.png", size=64, scale=0.25},
        {filename="__bztungsten__/graphics/icons/tungsten-ore-2.png", size=64, scale=0.25},
        {filename="__bztungsten__/graphics/icons/tungsten-ore-3.png", size=64, scale=0.25},
        {filename="__bztungsten__/graphics/icons/tungsten-ore-4.png", size=64, scale=0.25},
      },
      subgroup = "raw-resource",
      order = "t-c-a",
      stack_size = util.get_stack_size(50)
  },
})

-- Wolframite becomes 20% richer past 1000 tiles, 60% richer past 10000 tiles
local richness = data.raw.resource["tungsten-ore"].autoplace.richness_expression  
data.raw.resource["tungsten-ore"].autoplace.richness_expression = 
  richness * noise.if_else_chain(
      noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(1000)), 1,
      noise.less_than(noise.distance_from(noise.var("x"), noise.var("y"), noise.var("starting_positions")), noise.to_noise_expression(10000)), 1.2,
      1.6)
