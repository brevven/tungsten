local util = require("__bztungsten__.tungsten-util");

if mods["Rich-Rocks-Requiem"] then
  if data.raw.recipe["rrr-stone-processing"] then
    table.insert(data.raw.recipe["rrr-stone-processing"].results,
      {name = "tungsten-ore", probability = 0.05, amount = 2}
    )
  end

  if data.raw.recipe["rrr-raw-ores-processing"] then
    table.insert(data.raw.recipe["rrr-raw-ores-processing"].results,
      {name = "tungsten-ore", probability = 0.50, amount = 10}
    )
  end
end
