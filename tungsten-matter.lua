-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local util = require("__bztungsten__.data-util");
local matter = require("__Krastorio2__/lib/public/data-stages/matter-util")

data:extend(
{
  {
    type = "technology",
    name = "tungsten-matter-processing",
    icons =
    {
      {
        icon = util.k2assets().."/technologies/matter-stone.png",
        icon_size = 256,
      },
      {
        icon = "__bztungsten__/graphics/icons/tungsten-ore.png",
        icon_size = 64, icon_mipmaps = 3,
        scale = 1.25,
      }
    },
    prerequisites = {"kr-matter-processing"},
    unit =
  	{
      count = 350,
      ingredients =
      {
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"matter-tech-card", 1}
      },
      time = 45
    }
  },
})

local tungsten_ore_matter = 
	{
    item_name = "tungsten-ore",
    minimum_conversion_quantity = 10,
    matter_value = 6,
    energy_required = 1,
    need_stabilizer = false,
    unlocked_by_technology = "tungsten-matter-processing"
	}
matter.createMatterRecipe(tungsten_ore_matter)


local tungsten_plate_matter = 
	{
    item_name = "tungsten-plate",
    minimum_conversion_quantity = 10,
    matter_value = 10,
    energy_required = 2,
    only_deconversion = true,
    need_stabilizer = true,
    unlocked_by_technology = "tungsten-matter-processing"
	}
matter.createMatterRecipe(tungsten_plate_matter)

end
