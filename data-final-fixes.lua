require("modules")
require("tungsten-recipe-final-stacking")
require("tungsten-recipe-final-rrr")
-- require("tungsten-recipe-final-5d")



local util = require("__bztungsten__.util");

-- Only burners can make tungsten carbide in vanilla
for i, entity in pairs(data.raw.furnace) do
  if entity.energy_source.type == "burner" then
     table.insert(entity.crafting_categories,"smelting-carbon")
  end
end 
