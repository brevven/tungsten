local util = require("__bztungsten__.data-util");

if mods["5dim_core"] then

  data.raw.item["tungsten-plate"].subgroup = "plates-plates"
  data.raw.recipe["tungsten-plate"].subgroup = "plates-plates"
  data.raw.recipe["tungsten-carbide"].subgroup = "plates-misc"
  data.raw.item["tungsten-carbide"].subgroup = "plates-misc"
  data.raw.item["tungsten-ore"].subgroup = "plates-ore"

  -- Industrial furnace
  if data.raw["recipe-category"]["industrial-furnace"] then
    data:extend({
      {
        type = "recipe",
        name = "tungsten-plate-industrial-ore",
        category = "industrial-furnace",
        subgroup = "plates-industrial-ore",
        order = "ad[tungsten-plate]",
        icon = "__bztungsten__/graphics/icons/tungsten-plate.png",
        icon_size = 128, icon_mipmaps = 3,
        enabled = true,
        energy_required = 50,
        ingredients = {{"tungsten-ore", 85}},
        result = "tungsten-plate",
        result_count = 50,
      }
    })
  end

  -- Tungsten dust
  if data.raw["recipe-category"]["mashering"] then
  data:extend(
    {
        {
            type = "item",
            name = "tungsten-dust",
            subgroup = "plates-dust",
            order = "d[tungsten-plate]",
            icon = "__bztungsten__/graphics/icons/tungsten-powder.png",
            icon_size = 64, icon_mipmaps = 3,
            stack_size = 200
        },
        {
            type = "recipe",
            name = "tungsten-plate-dust",
            icon = "__bztungsten__/graphics/icons/tungsten-plate.png",
            icon_size = 128, icon_mipmaps = 3,
            subgroup = "plates-plates2",
            order = "d[tungsten-plate]",
            category = "smelting",
            energy_required = 32/15,
            enabled = true,
            ingredients = {
                {"tungsten-dust", 2}
            },
            result = "tungsten-plate",
        },
        {
            type = "recipe",
            name = "tungsten-dust",
            icon = "__bztungsten__/graphics/icons/tungsten-powder.png",
            icon_size = 64, icon_mipmaps = 3,
            category = "mashering",
            subgroup = "",
            order = "d[tungsten-plate]",
            energy_required = 3.2,
            enabled = true,
            ingredients = {
                {"tungsten-ore", 1}
            },
            results = {
              {type="item", name = "tungsten-dust", amount=2},
            }
        },
        {
          type = "recipe",
          name = "tungsten-plate-industrial-dust",
          category = "industrial-furnace",
          subgroup = "plates-industrial-dust",
          order = "ad[tungsten-plate]",
          icon = "__bztungsten__/graphics/icons/tungsten-plate.png",
          icon_size = 128, icon_mipmaps = 3,
          enabled = true,
          energy_required = 50,
          ingredients = {{"tungsten-dust", 85}},
          result = util.me.tungsten_plate,
          result_count = 50,
        },
        {
          type = "recipe",
          name = "tungsten-carbide-industrial-dust",
          category = "industrial-furnace",
          subgroup = "plates-industrial-ore",
          order = "ae[tungsten-carbide]",
          icon = "__bztungsten__/graphics/icons/tungsten-carbide.png",
          icon_size = 128, icon_mipmaps = 3,
          enabled = true,
          energy_required = 500,
          ingredients = {{"tungsten-plate", 85}},
          result = util.me.tungsten_plate,
          result_count = 20,
        }
  })
  end

  local mks = {"02", "03", "04", "05", "06", "07", "08", "09", "10"}
  local items = {"5d-electric-mining-drill-", "5d-chemical-plant-"}
  for i, mk in pairs(mks) do
    for j, item in pairs(items) do 
      util.add_ingredient(item..mk, "tungsten-carbide", 1)
    end
  end

  local mks = {"04", "05", "06", "07", "08", "09", "10"}
  local items = {"5d-assembling-machine-"}
  for i, mk in pairs(mks) do
    for j, item in pairs(items) do 
      util.add_ingredient(item..mk, "tungsten-carbide", 2)
    end
  end

  local mks = {"02", "03", "04", "05", "06", "07", "08", "09", "10"}
  local items = {"5d-electric-furnace-"}
  for i, mk in pairs(mks) do
    for j, item in pairs(items) do 
      util.add_ingredient(item..mk, "tungsten-plate", 5)
    end
  end

  local mks = {"02", "03", "04", "05", "06", "07", "08", "09", "10"}
  local items = {"5d-heat-pipe-"}
  for i, mk in pairs(mks) do
    for j, item in pairs(items) do 
      util.replace_some_ingredient(item..mk, "copper-plate", 10, "tungsten-plate", 10)
    end
  end

  local mks = {"02", "03", "04", "05", "06", "07", "08", "09", "10"}
  local items = {"5d-heat-exchanger-"}
  for i, mk in pairs(mks) do
    for j, item in pairs(items) do 
      util.replace_some_ingredient(item..mk, "copper-plate", 50, "tungsten-plate", 50)
    end
  end

  local mks = {"02", "03", "04", "05", "06", "07", "08", "09", "10"}
  local items = {"5d-nuclear-reactor-"}
  for i, mk in pairs(mks) do
    for j, item in pairs(items) do 
      util.add_ingredient(item..mk, "tungsten-plate", 400)
    end
  end

end
