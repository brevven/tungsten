local util = require("__bztungsten__.tungsten-util");

-- Lamps
util.add_prerequisite("optics", "tungsten-processing")
util.set_tech_recipe("optics", {{"automation-science-pack", 1}, {"logistic-science-pack", 1}})
util.add_ingredient("small-lamp", "tungsten-plate", 1)

-- Rail signals use lamps
util.add_prerequisite("rail-signals", "optics")
util.add_ingredient("rail-signal", "small-lamp", 1)
util.add_ingredient("rail-chain-signal", "small-lamp", 1)

-- Ammunition
util.add_prerequisite("military-2", "tungsten-processing")
util.replace_ingredient("piercing-rounds-magazine", "copper-plate", "tungsten-plate")
util.replace_ingredient("piercing-shotgun-shell", "copper-plate", "tungsten-plate")
util.replace_ingredient("cannon-shell", "copper-plate", "tungsten-plate")


-- Tooling
util.add_prerequisite("automation-2", "tungsten-processing")
util.replace_some_ingredient("assembling-machine-2", "steel-plate", 1, "tungsten-carbide", 1)
util.add_ingredient("assembling-machine-3", "tungsten-carbide", 4)
util.add_ingredient("chemical-plant", "tungsten-carbide", 2)
util.add_ingredient("electric-furnace", "tungsten-carbide", 1)

-- Electrodes & spark plugs
util.replace_ingredient("accumulator", "iron-plate", "tungsten-plate")
util.add_ingredient("oil-refinery", "tungsten-plate", 1)
util.add_ingredient("chemical-plant", "tungsten-plate", 1)
util.add_prerequisite("engine", "tungsten-processing")
util.add_ingredient("engine-unit", "tungsten-plate", 1)


-- Hot stuff
util.add_prerequisite("advanced-materials-processing-2", "tungsten-processing")
util.replace_some_ingredient("electric-furnace", "stone-brick", 5, "tungsten-plate", 10)
util.replace_some_ingredient("heat-exchanger", "copper-plate", 50, "tungsten-plate", 50)
util.add_ingredient("nuclear-reactor", "tungsten-plate", 500)
util.add_ingredient("flamethrower-turret", "tungsten-plate", 5)

-- Rocket engine nozzle techs
util.add_effect("rocketry", { type =  "unlock-recipe", recipe = "rocket-engine-nozzle" })
util.add_prerequisite("rocket-silo", "rocketry")
if util.get_setting("bztungsten-avoid-military") == "yes" then
  util.set_tech_recipe("rocketry", {{"automation-science-pack", 1}, {"logistic-science-pack", 1}})
end

-- Rocket engine nozzle uses
util.add_ingredient("rocket-part", "rocket-engine-nozzle", mods["space-exploration"] and 5 or 10)
util.add_ingredient("rocket", "rocket-engine-nozzle", 1)
util.add_ingredient("satellite", "rocket-engine-nozzle", 10)
util.add_ingredient("artillery-shell", "rocket-engine-nozzle", 3)
util.add_ingredient("atomic-bomb", "rocket-engine-nozzle", 7)
util.add_ingredient("atomic-bomb", "tungsten-plate", 1)


-- Airplanes
util.add_prerequisite("afterburner", "rocketry")
util.add_ingredient("afterburner", "rocket-engine-nozzle", 1)

-- Jetpack
util.add_prerequisite("jetpack-1", "rocketry")
util.add_ingredient("jetpack-1", "rocket-engine-nozzle", 6)


-- Other lights
util.add_ingredient("balloon-light", "tungsten-plate", 1)
util.add_ingredient("short-balloon-light", "tungsten-plate", 1)
util.add_ingredient("LargeLamp", "tungsten-plate", 1)
util.add_ingredient("StadiumLamp", "tungsten-plate", 10)
util.set_tech_recipe("optics-2", {{"automation-science-pack", 1}, {"logistic-science-pack", 1}})
util.set_tech_recipe("bright-lamp", {{"automation-science-pack", 1}, {"logistic-science-pack", 1}})
util.add_ingredient("deadlock-large-lamp", "tungsten-plate", 2)
util.add_ingredient("deadlock-floor-lamp", "tungsten-plate", 2)


---- K2
if mods["Krastorio2"] then
  util.set_tech_recipe("engine", {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}})
  util.set_tech_recipe("fluid-handling", {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}})
  util.set_tech_recipe("optics", {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}})
  util.set_tech_recipe("oil-processing", {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}})
  util.set_tech_recipe("plastics", {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}})
  if util.get_setting("bztungsten-avoid-military") == "yes" then
    util.set_tech_recipe("rocketry", {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}})
  end
  util.remove_prerequisite("kr-sentinel", "optics")


  util.add_prerequisite("tungsten-processing", "kr-mineral-water-gathering")
  util.remove_prerequisite("kr-mineral-water-gathering", "fluid-handling")

  -- engines come later with Tungsten.
  util.replace_ingredient("kr-filtration-plant", "engine-unit", "pipe")

  -- Heat related
  util.add_ingredient("kr-fusion-reactor", "tungsten-plate", 350)
  util.add_ingredient("energy-control-unit", "tungsten-plate", 3)
  util.replace_some_ingredient("kr-advanced-furnace", "rare-metals", 40, "tungsten-plate", 40)

  -- Other
  util.add_ingredient("matter-research-data", "tungsten-plate", 5)

  -- Ammunition
  util.replace_ingredient("piercing-rounds-magazine", "steel-plate", "tungsten-plate")
  util.replace_ingredient("piercing-shotgun-shell", "steel-plate", "tungsten-plate")
  util.replace_ingredient("armor-piercing-rifle-magazine", "steel-plate", "tungsten-plate")
  util.replace_ingredient("armor-piercing-anti-material-rifle-magazine", "steel-plate", "tungsten-plate")
  util.replace_ingredient("basic-railgun-shell", "steel-plate", "tungsten-plate")

  -- Rocket things
  util.add_ingredient("heavy-rocket", "rocket-engine-nozzle", 4)
  util.add_ingredient("explosive-turret-rocket", "rocket-engine-nozzle", 3)

  -- Tooling
  util.add_ingredient("kr-electric-mining-drill-mk2", "tungsten-carbide", 5)
  util.add_ingredient("kr-quarry-drill", "tungsten-carbide", 20)
  util.replace_some_ingredient("kr-advanced-chemical-plant", "rare-metals", 40, "tungsten-carbide", 20)
end


-- SE
if mods["space-exploration"] then
  -- Heat Shielding
  util.replace_some_ingredient("se-heat-shielding", "steel-plate", 1, "tungsten-plate", 3)
  util.replace_some_ingredient("se-heat-shielding-iridium", "stone-tablet", 3, "tungsten-plate", 3)

  -- Hot stuff
  util.add_ingredient("se-space-electromagnetics-laboratory", "tungsten-plate", 20)
  util.add_ingredient("se-space-radiator", "tungsten-plate", 4)
  util.add_ingredient("se-delivery-cannon-weapon-capsule", "tungsten-plate", 10)

  -- Data
  util.add_ingredient("se-electromagnetic-field-data", "tungsten-plate", 1)
  util.add_product("se-electromagnetic-field-data", {name="tungsten-plate", amount=1, probability=0.95})
  util.add_ingredient("se-hot-thermodynamics-data", "tungsten-plate", 1)
  util.add_product("se-hot-thermodynamics-data", {name="tungsten-plate", amount=1, probability=0.50})
  util.add_ingredient("se-particle-beam-shielding-data", "tungsten-plate", 1)
  util.add_product("se-particle-beam-shielding-data", {name="tungsten-plate", amount=1, probability=0.20})

  --rocket
  util.add_ingredient("se-rocket-science-pack", "rocket-engine-nozzle", 1)
  util.add_ingredient("se-spaceship-rocket-engine", "rocket-engine-nozzle", 4)
  util.add_ingredient("se-cargo-rocket-section", "rocket-engine-nozzle", 5)
  util.add_ingredient("se-cargo-rocket-section-beryllium", "rocket-engine-nozzle", 5)

  --Tooling
  util.add_ingredient("se-space-assembling-machine", "tungsten-carbide", 8)
  util.add_ingredient("se-core-miner", "tungsten-carbide", 40)
  util.add_ingredient("se-space-mechanical-laboratory", "tungsten-carbide", 40)
  util.add_ingredient("se-recyling-facility", "tungsten-carbide", 10)
end
if mods["aai-industry"]then
  util.add_ingredient("area-mining-drill", "tungsten-carbide", 8)
end
  
