-- Deadlock stacking recipes

local util = require("__bztungsten__.data-util");

if deadlock then
  deadlock.add_stack("tungsten-ore",  "__bztungsten__/graphics/icons/stacked/tungsten-ore-stacked.png", "deadlock-stacking-2", 64)
  deadlock.add_stack("tungsten-plate", "__bztungsten__/graphics/icons/stacked/tungsten-plate-stacked.png" , "deadlock-stacking-2", 128)
  deadlock.add_stack("tungsten-carbide", "__bztungsten__/graphics/icons/stacked/tungsten-carbide-stacked.png" , "deadlock-stacking-2", 128)
  deadlock.add_stack("rocket-engine-nozzle", "__bztungsten__/graphics/icons/stacked/rocket-engine-nozzle-stacked.png" , "deadlock-stacking-2", 128)
  if mods["Krastorio2"] then
    deadlock.add_stack("enriched-tungsten", "__bztungsten__/graphics/icons/stacked/enriched-tungsten-stacked.png" , "deadlock-stacking-2", 64)
  end
  if data.raw.item["tungsten-ingot"] then
    deadlock.add_stack("tungsten-ingot", nil, "deadlock-stacking-2", nil)
  end
  if util.me.cuw() then
    deadlock.add_stack("cuw", "__bztungsten__/graphics/icons/stacked/cuw-stacked.png" , "deadlock-stacking-2", 128)
  end
  if data.raw.item["tungsten-powder"] then
    deadlock.add_stack("tungsten-powder", nil, "deadlock-stacking-2", nil)
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("tungsten-ore", "deadlock-crating-2")
  deadlock_crating.add_crate("tungsten-plate", "deadlock-crating-2")
  deadlock_crating.add_crate("tungsten-carbide", "deadlock-crating-2")
  deadlock_crating.add_crate("rocket-engine-nozzle", "deadlock-crating-2")
  if mods["Krastorio2"] then
    deadlock_crating.add_crate("enriched-tungsten", "deadlock-crating-2")
  end
  if data.raw.item["tungsten-ingot"] then
    deadlock_crating.add_crate("tungsten-ingot", "deadlock-crating-2")
  end
  if util.me.cuw() then
    deadlock_crating.add_crate("cuw", "deadlock-crating-2")
  end
  if data.raw.item["tungsten-powder"] then
    deadlock_crating.add_crate("tungsten-powder", "deadlock-crating-2")
  end
end

