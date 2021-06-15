require("modules")
require("tungsten-recipe-final-stacking")
require("tungsten-recipe-final-rrr")
-- require("tungsten-recipe-final-5d")



local util = require("__bztungsten__.tungsten-util");

-- Only burners can make tungsten carbide in vanilla
for i, entity in pairs(data.raw.furnace) do
  if entity.energy_source.type == "burner" then
     table.insert(entity.crafting_categories,"smelting-carbon")
  end
end 

if mods["space-exploration"] then 
  -- Organization
  data.raw.item["tungsten-plate"].subgroup = "plates"
  data.raw.recipe["tungsten-plate"].subgroup = "plates"
end


-- SE + K2: Keep radar at red science level
util.remove_prerequisite("kr-radar", "optics")
util.add_prerequisite("kr-radar", "electricity")


-- SE don't gate tungsten
util.remove_prerequisite("tungsten-processing", "se-material-science-pack-1")
