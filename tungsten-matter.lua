-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("data-util");

  util.k2matter({
    k2matter = {
      item_name = "tungsten-ore",
      matter_value = 6,
      energy_required = 1,
      need_stabilizer = false,
      unlocked_by_technology = "tungsten-matter-processing",
    },
    k2baseicon = "stone",
    icon = {icon = "__bztungsten__/graphics/icons/tungsten-ore.png", icon_size = 64, scale = 1.25}
  })

  util.k2matter({
    k2matter = {
      item_name = "tungsten-plate",
      matter_value = 10,
      energy_required = 2,
      only_deconversion = true,
      need_stabilizer = true,
      unlocked_by_technology = "tungsten-matter-processing",
    },
  })
end
