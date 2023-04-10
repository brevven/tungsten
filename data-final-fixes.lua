require("modules")
require("tungsten-recipe-final-stacking")
require("tungsten-recipe-final-rrr")
-- require("tungsten-recipe-final-5d")



local util = require("__bztungsten__.data-util");

-- Only burners can make tungsten carbide in vanilla
for i, entity in pairs(data.raw.furnace) do
  if entity.energy_source.type == "burner" then
    if entity.name == "advanced-carbon-furnace" then
      table.insert(entity.crafting_categories, "smelting-carbon")
    end
    for j, category in pairs(entity.crafting_categories) do
      if category == "smelting" or category == "double-smelting" then
        if entity.name == "double-steel-furnace" then
          table.insert(entity.crafting_categories, "double-smelting-carbon")
        else
          table.insert(entity.crafting_categories, "smelting-carbon")
        end
      end
    end
  end
end 

if mods["space-exploration"] then 
  -- core mining balancing
  util.add_to_product("se-core-fragment-omni", "tungsten-ore", -3)

  if string.sub(mods["space-exploration"], 1, 3) == "0.6" then
    util.add_prerequisite("rocket-silo", "rocketry")
  end
end


-- SE + K2: Keep radar at red science level
util.remove_prerequisite("kr-radar", "optics")
util.add_prerequisite("kr-radar", "electricity")


-- SE don't gate tungsten
util.remove_prerequisite("tungsten-processing", "se-material-science-pack-1")

-- One more tier
util.add_ingredient("omt-electric-mining-drill", "tungsten-carbide", 10)


-- Junk Trains, no optics:
util.remove_prerequisite("automated-scrap-rail-transportation", "optics")
util.remove_ingredient("train-stop-scrap", "small-lamp")
util.remove_ingredient("rail-signal-scrap", "small-lamp")
util.remove_ingredient("rail-chain-signal-scrap", "small-lamp")


if mods["aai-industry"] and mods.bobplates then
  util.remove_prerequisite("tungsten-processing", "chemical-science-pack")
end
