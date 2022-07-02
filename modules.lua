-- Enable prod modules for all tungsten plate and ore recipes

recipes = {"tungsten-plate", "tungsten-carbide", "rocket-engine-nozzle"}
if mods["Krastorio2"] then
  table.insert(recipes, "enriched-tungsten-plate")
  table.insert(recipes, "enriched-tungsten")
end
if mods["space-exploration"] then
  table.insert(recipes, "tungsten-smelting-vulcanite")
  table.insert(recipes, "molten-tungsten")
  if mods["Krastorio2"] then
    table.insert(recipes, "enriched-tungsten-smelting-vulcanite")
  end
end
if data.raw.recipe["tungsten-carbide-coal"] then
    table.insert(recipes, "tungsten-carbide-coal")
end

for i, recipe in pairs(recipes) do
  if data.raw.recipe[recipe] then
    for j, module in pairs(data.raw.module) do
      if module.effect then
        for effect_name, effect in pairs(module.effect) do
          if effect_name == "productivity" and effect.bonus > 0 and module.limitation and #module.limitation > 0 then
            table.insert(module.limitation, recipe)
          end
        end
      end
    end
  end
end
