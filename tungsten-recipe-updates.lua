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
util.replace_some_ingredient("heat-pipe", "copper-plate", 10, "tungsten-plate", 10)
util.add_ingredient("nuclear-reactor", "tungsten-plate", 500)
util.add_ingredient("flamethrower-turret", "tungsten-plate", 5)
util.add_ingredient("nuclear-fuel", "tungsten-plate", 1)

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
util.add_ingredient("aircraft-afterburner", "rocket-engine-nozzle", 1)

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
  if mods.bzzirconium then
    util.add_ingredient("matter-research-data", "zirconium-tungstate", 5)
  else
    util.add_ingredient("matter-research-data", "tungsten-plate", 5)
  end

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
  if mods.bzzirconium then
    util.add_ingredient("se-hot-thermodynamics-data", "zirconium-tungstate", 1)
    util.add_product("se-hot-thermodynamics-data", {name="zirconium-tungstate", amount=1, probability=0.50})
  else
    util.add_ingredient("se-hot-thermodynamics-data", "tungsten-plate", 1)
    util.add_product("se-hot-thermodynamics-data", {name="tungsten-plate", amount=1, probability=0.50})
  end
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


util.replace_some_ingredient("superheater", "copper-plate", 10, "tungsten-plate", 10)

-- Expanded rocket payloads
util.add_ingredient("radioisotope-thermoelectric-generater", "tungsten-plate", 100)
util.add_ingredient("satellite-thruster", "rocket-engine-nozzle", 12)

  
if mods["WeaponPack"] then
  util.replace_ingredient("5,56x45", "iron-plate", "tungsten-plate")
  util.replace_ingredient("5,45x39", "iron-plate", "tungsten-plate")
  util.replace_ingredient("7,62x51", "iron-plate", "tungsten-plate")
  util.replace_ingredient("5,7 × 28", "iron-plate", "tungsten-plate")
  util.replace_ingredient("12gauge", "iron-plate", "tungsten-plate")
  util.replace_ingredient("45acp", "iron-plate", "tungsten-plate")
end

if mods["More_Ammo"] then
  util.replace_ingredient("acid-ammo-recipe", "iron-plate", "tungsten-plate")
  util.replace_ingredient("fire-ammo-recipe", "iron-plate", "tungsten-plate")
  util.replace_ingredient("fmj-ammo-recipe", "iron-plate", "tungsten-plate")
  util.replace_ingredient("he-ammo-recipe", "iron-plate", "tungsten-plate")
end
-- rampant arsenal
util.add_ingredient("suppression-cannon-item-rampant-arsenal", "tungsten-plate", 30)

util.add_ingredient("orbital-ion-cannon", "rocket-engine-nozzle", 12)

-- King Jo
util.replace_ingredient("kj_pak_penetration", "steel-plate", "tungsten-plate")
util.replace_ingredient("kj_bolt", "steel-plate", "tungsten-plate")
util.replace_ingredient("kj_40kdreadnought_normal", "steel-plate", "tungsten-plate")
util.replace_some_ingredient("kj_predator_normal", "steel-plate", 1, "tungsten-plate", 1)
util.replace_some_ingredient("kj_lemanruss_normal", "steel-plate", 3, "tungsten-plate", 3)
util.replace_some_ingredient("kj_baneblade_normal", "steel-plate", 3, "tungsten-plate", 3)
util.replace_ingredient("kj_75kwk40_penetration", "steel-plate", "tungsten-plate")
util.replace_ingredient("kj_120kwk_penetration", "steel-plate", "tungsten-plate")
util.replace_ingredient("kj_120kwk_penetration_highexplosive", "steel-plate", "tungsten-plate")
util.replace_ingredient("kj_280SK34_penetration", "steel-plate", "tungsten-plate")
util.add_ingredient("bolt75mk2","tungsten-plate", 1)
util.add_ingredient("bolt100mk2","tungsten-plate", 1)
util.replace_ingredient("bolt75kraken", "steel-plate", "tungsten-plate")
util.replace_ingredient("bolt100kraken", "steel-plate", "tungsten-plate")

-- additional turrets
util.add_ingredient("at-acidthrower-turret", "tungsten-plate", 5)
util.replace_some_ingredient("small-cannon-shell", "steel-plate", 2, "tungsten-plate", 2)
util.add_ingredient("small-rocket","rocket-engine-nozzle", 1)
util.add_ingredient("Artillery_mk1_Ammo", "tungsten-plate", 2)



-- vortik's deep core mining
util.add_ingredient("vtk-deepcore-mining-moho", "tungsten-carbide", 10)
util.add_ingredient("vtk-deepcore-mining-drone", "tungsten-carbide", 1)
util.add_ingredient("vtk-deepcore-mining-drill", "tungsten-carbide", 20)
util.add_ingredient("vtk-deepcore-mining-drill-advanced", "tungsten-carbide", 50)



-- Advanced Mining Drills
util.add_ingredient("advanced-mining-drill", "tungsten-carbide", 1)
util.add_prerequisite("advanced-mining-drill", "tungsten-processing")
util.add_ingredient("elite-mining-drill", "tungsten-carbide", 5)
util.add_ingredient("ultimate-mining-drill", "tungsten-carbide", 10)

-- Skandragon
util.add_ingredient("skan-advanced-mining-drill", "tungsten-carbide", 4)
util.add_ingredient("skan-elite-mining-drill", "tungsten-carbide", 4)
util.add_ingredient("skan-ultimate-mining-drill", "tungsten-carbide", 4)

-- Hiladdar
util.add_ingredient("hsmd-electric-mining-drill-mk2", "tungsten-carbide", 3)
util.add_ingredient("hsmd-electric-mining-drill-mk3", "tungsten-carbide", 3)
util.add_ingredient("hsmd-electric-mining-drill-mk4", "tungsten-carbide", 3)
util.add_ingredient("hsmd-electric-mining-drill-mk5", "tungsten-carbide", 3)
util.add_ingredient("hsmd-electric-mining-drill-mk6", "tungsten-carbide", 3)


-- Extended vanilla (and mk2), Zombies
local tcamount = 10
if mods["zombiesextended-core"] then
  tcamount = 2
  util.add_ingredient("electric-mining-drill-mk1", "tungsten-carbide", tcamount)
  util.add_ingredient("assembling-machine-mk1", "tungsten-carbide", tcamount)
  util.add_ingredient("assembling-machine-mk2", "tungsten-carbide", tcamount)
  util.add_ingredient("assembling-machine-mk3", "tungsten-carbide", tcamount)
  util.add_ingredient("heat-pipe-mk1", "tungsten-plate", 1)
end
util.add_ingredient("electric-mining-drill-mk2", "tungsten-carbide", tcamount)
util.add_ingredient("edrill-1to2", "tungsten-carbide", 10)
util.add_ingredient("electric-mining-drill-mk3", "tungsten-carbide", tcamount)
util.add_ingredient("electric-mining-drill-mk4", "tungsten-carbide", tcamount)
util.add_ingredient("electric-mining-drill-mk5", "tungsten-carbide", tcamount)
util.add_ingredient("electric-mining-drill-mk6", "tungsten-carbide", tcamount)

-- Tiny
util.add_ingredient("tiny-electric-mining-drill-1", "tungsten-carbide", 1)
util.add_ingredient("tiny-electric-mining-drill-3", "tungsten-carbide", 2)
util.add_ingredient("tiny-electric-mining-drill-5", "tungsten-carbide", 3)

-- TA Miners
util.add_ingredient("crust_extractor", "tungsten-carbide", 50)
util.add_ingredient("moho_extractor", "tungsten-carbide", 50)
util.add_ingredient("mantle_extractor", "tungsten-carbide", 100)

-- other mining drills
util.add_ingredient("electric-mining-drill-lv2", "tungsten-carbide", 5)
util.add_ingredient("advanced-electric-mining-drill", "tungsten-carbide", 10)
util.add_ingredient("omega-drill", "tungsten-carbide", 25)
util.add_ingredient("passive-furnace", "tungsten-carbide", 2)
util.add_ingredient("quarry-mk3", "tungsten-carbide", 20)


-- Geothermal
util.replace_some_ingredient("geothermal-heat-exchanger", "copper-plate", 120, "tungsten-plate", 120)

-- FastFurnaces
util.replace_some_ingredient("reika-fast-electric-mining-drill", "steel-plate", 10, "tungsten-carbide", 10)

-- Nuclear furnaces
util.add_ingredient("nuclear-furnace-3", "tungsten-plate", 200)

-- Mega Furnace
util.add_ingredient("mega-furnace", "tungsten-plate", 5)

-- Mundas
util.add_ingredient("munda_big_machine", "tungsten-carbide", 32)
util.add_prerequisite("munda_big_machine", "tungsten-processing")



-- Asteroid mining
function startswith(s, start)
   return string.sub(s, 1, string.len(start))==start
end

if mods["Asteroid_Mining"] then
  for i, recipe in pairs(data.raw.recipe) do 
    if startswith(recipe.name, "miner-module") then
      util.add_ingredient(recipe.name, "tungsten-carbide", 20)
      util.add_ingredient(recipe.name, "rocket-engine-nozzle", 12)
    end
  end
end
