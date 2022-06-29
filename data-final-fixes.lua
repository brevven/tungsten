require("modules")
require("tungsten-recipe-final-stacking")
require("tungsten-recipe-final-rrr")
-- require("tungsten-recipe-final-5d")



local util = require("__bztungsten__.data-util");

-- Only burners can make tungsten carbide in vanilla
for i, entity in pairs(data.raw.furnace) do
  if entity.energy_source.type == "burner" then
     table.insert(entity.crafting_categories,"smelting-carbon")
  end
end 

if mods["space-exploration"] then 
  -- core mining balancing
  util.add_to_product("se-core-fragment-omni", "tungsten-ore", -3)
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
