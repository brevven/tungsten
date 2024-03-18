local util = require("__bztungsten__.data-util");

local cuw = "tungsten-plate"
if util.me.cuw() then cuw = "cuw" end

-- Lamps
util.add_prerequisite("optics", util.me.tungsten_processing)
util.set_tech_recipe("optics", {{"automation-science-pack", 1}, {"logistic-science-pack", 1}})
util.add_ingredient("small-lamp", "tungsten-plate", 1)

-- Rail signals use lamps
util.add_prerequisite("rail-signals", "optics")
util.add_ingredient("rail-signal", "small-lamp", 1)
util.add_ingredient("rail-chain-signal", "small-lamp", 1)

-- Ammunition
util.add_prerequisite("military-2", util.me.tungsten_processing)
util.replace_ingredient("piercing-rounds-magazine", "copper-plate", "tungsten-plate", 3)
util.replace_ingredient("piercing-shotgun-shell", "copper-plate", "tungsten-plate", 3)
util.replace_ingredient("cannon-shell", "copper-plate", "tungsten-plate")


-- Tooling
util.add_prerequisite("automation-2", util.me.tungsten_processing)
if mods.bzaluminum or mods.bzcarbon or mods.bzgas then
  util.replace_ingredient("assembling-machine-2", "steel-plate", "tungsten-carbide")
else
  util.replace_some_ingredient("assembling-machine-2", "steel-plate", 1, "tungsten-carbide", 1)
end
util.add_ingredient("assembling-machine-3", "tungsten-carbide", 4)
util.add_ingredient("electric-furnace", "tungsten-carbide", 1)

if (not mods.MoreScience or data.raw["assembling-machine"]["basic-chemical-plant"])
and (not (mods.omnimatter and mods.Krastorio2)) then
  util.add_ingredient("chemical-plant", "tungsten-carbide", 2)
  util.add_ingredient("chemical-plant", cuw, 5)
end

-- Electrodes & spark plugs
util.replace_ingredient("accumulator", "iron-plate", cuw)
util.add_ingredient("oil-refinery", cuw, 10)
util.add_prerequisite("engine", util.me.tungsten_processing)
util.add_ingredient("engine-unit", "tungsten-plate", 1)


-- Hot stuff
util.add_prerequisite("advanced-materials-processing-2", util.me.tungsten_processing)
util.replace_some_ingredient("electric-furnace", "steel-plate", 5, cuw, 5)
util.replace_some_ingredient("heat-exchanger", "copper-plate", 50, cuw, 50)
if not util.me.cuw() then
  -- keep old behvaior
  util.replace_some_ingredient("heat-pipe", "copper-plate", 10, "tungsten-plate", 10)
end
util.add_ingredient("nuclear-reactor", cuw, 500)
util.add_ingredient("flamethrower-turret", cuw, 5)
util.add_ingredient("flamethrower", cuw, 2)
util.add_ingredient("nuclear-fuel", "tungsten-plate", 1)

-- Rocket engine nozzle techs
util.add_effect("rocketry", { type =  "unlock-recipe", recipe = "rocket-engine-nozzle" })
util.add_prerequisite("rocket-silo", "rocketry")
if util.me.get_setting("bztungsten-avoid-military") == "yes" then
  util.set_tech_recipe("rocketry", {{"automation-science-pack", 1}, {"logistic-science-pack", 1}})
end

-- Rocket engine nozzle uses
util.add_ingredient("rocket-part", "rocket-engine-nozzle", mods["space-exploration"] and 5 or 10)
util.add_ingredient("rocket", "rocket-engine-nozzle", 1)
util.add_ingredient("satellite", "rocket-engine-nozzle", 10)
util.add_ingredient("artillery-shell", "rocket-engine-nozzle", 3)
util.add_ingredient("atomic-bomb", "rocket-engine-nozzle", 7)
util.add_ingredient("atomic-bomb", "tungsten-plate", 1)

-- Nuclear Fuel
util.add_ingredient("atomic-bomb-pu", "rocket-engine-nozzle", 7)
util.add_ingredient("atomic-bomb-pu", "tungsten-plate", 1)

-- Plutonium Energy
util.add_ingredient("plutonium-atomic-bomb", "rocket-engine-nozzle", 7)
util.add_ingredient("plutonium-atomic-bomb", "tungsten-plate", 1)
util.add_ingredient("MOX-reactor", cuw, 400)

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
  if util.me.get_setting("bztungsten-avoid-military") == "yes" then
    util.set_tech_recipe("rocketry", {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}})
  end
  util.remove_prerequisite("kr-sentinel", "optics")


  util.add_prerequisite(util.me.tungsten_processing, "kr-mineral-water-gathering")
  util.remove_prerequisite("kr-mineral-water-gathering", "fluid-handling")

  -- engines come later with Tungsten.
  util.replace_ingredient("kr-filtration-plant", "engine-unit", "pipe")

  -- Heat related
  util.add_ingredient("kr-fusion-reactor", cuw, 350)
  util.add_ingredient("energy-control-unit", cuw, 3)
  util.replace_some_ingredient("kr-advanced-furnace", "rare-metals", 40, cuw, 40)

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
  util.replace_some_ingredient("se-heat-shielding", "steel-plate", 1, cuw, 3)
  util.replace_some_ingredient("se-heat-shielding-iridium", "stone-tablet", 3, cuw, 3)

  -- Hot stuff
  util.add_ingredient("se-space-electromagnetics-laboratory", "tungsten-plate", 20)
  util.add_ingredient("se-space-radiator", cuw, 4)
  util.add_ingredient("se-delivery-cannon-weapon-capsule", "tungsten-plate", 10)

  -- Data
  util.add_ingredient("se-electromagnetic-field-data", "tungsten-plate", 1)
  util.add_product("se-electromagnetic-field-data", {type="item", name="tungsten-plate", amount=1, probability=0.95})
  if mods.bzzirconium then
    util.add_ingredient("se-hot-thermodynamics-data", "zirconium-tungstate", 1)
    util.add_product("se-hot-thermodynamics-data", {type="item", name="zirconium-tungstate", amount=1, probability=0.50})
  else
    util.add_ingredient("se-hot-thermodynamics-data", cuw, 1)
    util.add_product("se-hot-thermodynamics-data", {type="item", name= cuw, amount=1, probability=0.50})
  end
  util.add_ingredient("se-particle-beam-shielding-data", cuw, 1)
  util.add_product("se-particle-beam-shielding-data", {type="item", name= cuw, amount=1, probability=0.20})

  --rocket
  if mods.Krastorio2 and string.sub(mods["space-exploration"], 1, 3) >= "0.6" then
    util.replace_ingredient("se-rocket-science-pack", "speed-module", "rocket-engine-nozzle", 8)
  else
    util.add_ingredient("se-rocket-science-pack", "rocket-engine-nozzle", 1)
  end
  util.add_ingredient("se-spaceship-rocket-engine", "rocket-engine-nozzle", 4)
  util.add_ingredient("se-cargo-rocket-section", "rocket-engine-nozzle", 5)
  util.add_ingredient("se-cargo-rocket-section-beryllium", "rocket-engine-nozzle", 5)
  util.add_ingredient("se-void-probe", "rocket-engine-nozzle", 1)

  --Tooling
  util.add_ingredient("se-space-assembling-machine", "tungsten-carbide", 8)
  util.add_ingredient("se-core-miner", "tungsten-carbide", 40)
  util.add_ingredient("se-space-mechanical-laboratory", "tungsten-carbide", 40)
  util.add_ingredient("se-recyling-facility", "tungsten-carbide", 10)

  util.add_ingredient("se-experimental-alloys-data", "tungsten-plate", 1)
  util.add_to_product("se-experimental-alloys-data", "se-experimental-alloys-data", 1)
  util.add_to_product("se-experimental-alloys-data", "se-scrap", 1)
  util.add_to_ingredient("se-experimental-alloys-data", "se-empty-data", 1)

end

-- AAI 
util.add_ingredient("area-mining-drill", "tungsten-carbide", 8)
util.add_ingredient("vehicle-miner-mk3", "tungsten-carbide", 5)
util.add_ingredient("vehicle-flame-tumbler", "flamethrower", 1)



util.replace_some_ingredient("superheater", "copper-plate", 10, cuw, 10)

-- Expanded rocket payloads
util.add_ingredient("radioisotope-thermoelectric-generater", cuw, 100)
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
-- King Jo vehicles
util.replace_some_ingredient("kj_40kbaneblade", "steel-plate", 25, "tungsten-plate", 25)
util.replace_some_ingredient("kj_40kpredator", "steel-plate", 25, "tungsten-plate", 25)
util.replace_some_ingredient("kj_40kdreadnought", "steel-plate", 25, "tungsten-plate", 25)
util.replace_some_ingredient("kj_40klemanruss", "steel-plate", 25, "tungsten-plate", 25)

-- additional turrets
util.add_ingredient("at-acidthrower-turret", cuw, 5)
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
util.add_prerequisite("advanced-mining-drill",util.me.tungsten_processing)
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
util.add_ingredient("edrill-1to2", "tungsten-carbide", tcamount)
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
util.add_ingredient("omega-drill-mk2", "tungsten-carbide", 50)
util.add_ingredient("passive-furnace", "tungsten-carbide", 2)
util.add_ingredient("quarry-mk3", "tungsten-carbide", 20)


-- Geothermal
util.replace_some_ingredient("geothermal-heat-exchanger", "copper-plate", 120, cuw, 120)

-- FastFurnaces
util.replace_some_ingredient("reika-fast-electric-mining-drill", "steel-plate", 10, "tungsten-carbide", 10)

-- Nuclear furnaces
util.add_ingredient("nuclear-furnace-3", cuw, 200)

-- Mega Furnace
util.add_ingredient("mega-furnace", cuw, 5)

-- Mundas
util.add_ingredient("munda_big_machine", "tungsten-carbide", 32)
util.add_prerequisite("munda_big_machine", util.me.tungsten_processing)


-- Realistic reactors
util.add_ingredient("realistic-reactor", cuw, 500)
util.add_ingredient("breeder-reactor", cuw, 500)



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


-- Rampant Industry
util.add_ingredient("advanced-chemical-plant-rampant-industry", "tungsten-carbide", 10)
util.add_ingredient("advanced-oil-refinery-rampant-industry", "tungsten-carbide", 10)


-- Endgame Combat
util.replace_ingredient("sulfur-bullet-magazine", "copper-plate", "tungsten-plate")


-- FE+
if util.fe_plus("Machines") then
  util.add_ingredient("oil-refinery-mk2", "tungsten-carbide", 1)
end

-- Bob's machines
util.add_ingredient("chemical-plant-2", "tungsten-carbide", 2)
util.add_ingredient("chemical-plant-3", "tungsten-carbide", 2)
util.add_ingredient("chemical-plant-4", "tungsten-carbide", 2)
util.add_ingredient("electronics-machine-2", "tungsten-carbide", 1)
util.add_ingredient("electronics-machine-3", "tungsten-carbide", 1)
util.add_ingredient("oil-refinery-2", "tungsten-carbide", 1)
util.add_ingredient("bob-mining-drill-2", "tungsten-carbide", 1)
util.add_ingredient("bob-area-mining-drill-2", "tungsten-carbide", 1)
util.add_ingredient("bob-mining-drill-2", "tungsten-carbide", 3)
util.add_ingredient("bob-area-mining-drill-2", "tungsten-carbide", 3)
util.add_ingredient("bob-mining-drill-2", "tungsten-carbide", 3)
util.add_ingredient("bob-area-mining-drill-2", "tungsten-carbide", 3)


-- RFP
if not util.me.cuw() then
  -- keep old behvaior
  util.add_ingredient("rfp-pipe", "tungsten-plate", 2)
  util.add_ingredient("rfp-pipe-to-ground", "tungsten-plate", 6)
end
util.add_ingredient("rfp-pump", cuw, 5)
util.add_ingredient("rfp-heater", cuw, 500)
util.add_ingredient("rfp-heat-exchanger", cuw, 200)
util.add_ingredient("rfp-aneutronic-reactor", cuw, 5000)
util.add_ingredient("rfp-direct-energy-converter", cuw, 500)
util.add_ingredient("rfp-particle-accelerator", cuw, 1000)
util.add_ingredient("rfp-particle-decelerator", cuw, 1000)
util.add_ingredient("rfp-antimatter-reactor", cuw, 2000)
util.add_ingredient("rfw-plasma-thrower", cuw, 10)
util.add_ingredient("rfw-plasma-thrower-turret", cuw, 20)
util.add_ingredient("rfw-thermonuclear-bomb", "rocket-engine-nozzle", 7)
util.add_ingredient("rfw-thermonuclear-artillery-shell", "rocket-engine-nozzle", 7)
util.add_ingredient("rfw-fusion-bomb", "rocket-engine-nozzle", 7)
util.add_ingredient("rfw-fusion-artillery-shell", "rocket-engine-nozzle", 7)
util.add_ingredient("rfw-antimatter-bomb", "rocket-engine-nozzle", 7)
util.add_ingredient("rfw-antimatter-artillery-shell", "rocket-engine-nozzle", 7)
util.add_ingredient("rfw-small-antimatter-rocket", "rocket-engine-nozzle", 1)


-- Rocket Silo Construction
util.add_ingredient("rsc-excavation-site", "tungsten-carbide", 100)


-- Useful Equipment
util.add_ingredient("craft-assistent", "tungsten-carbide", 1)


-- True Nukes
util.add_ingredient("really-very-small-atomic-bomb", "rocket-engine-nozzle", 2)
util.add_ingredient("very-small-atomic-bomb", "rocket-engine-nozzle", 3)
util.add_ingredient("small-atomic-bomb", "rocket-engine-nozzle", 5)


-- Schall
util.add_ingredient("Schall-napalm-bomb", "rocket-engine-nozzle", 1)
util.replace_ingredient("Schall-sniper-piercing-rounds-magazine", "copper-plate", "tungsten-plate")
util.add_ingredient("Schall-satellite-astro-2", "rocket-engine-nozzle", 20)
util.add_ingredient("Schall-satellite-bio-2", "rocket-engine-nozzle", 20)
util.add_ingredient("Schall-uranium-mining-drill", "tungsten-carbide", 2)
util.replace_ingredient("Schall-armoured-locomotive", "steel-plate", "tungsten-plate")
util.replace_ingredient("Schall-armoured-cargo-wagon", "steel-plate", "tungsten-plate")
util.replace_ingredient("Schall-armoured-fluid-wagon", "steel-plate", "tungsten-plate")

-- Space solar panel
util.add_ingredient("space-solar-panel", "rocket-engine-nozzle", 10)


-- Power Armor Mk3
util.add_ingredient("pamk3-pamk3", "tungsten-plate", 20)
-- Leion Power Armor Mk3
util.add_ingredient("power-armor-mk3", "tungsten-plate", 20)
-- Simply Power Armor Mk3
util.add_ingredient("simply-power-armor-mk3", "tungsten-plate", 20)


-- Cargo Ships
util.add_prerequisite("water_transport_signals", "optics")
util.add_ingredient("buoy", "small-lamp", 1)
util.add_ingredient("chain_buoy", "small-lamp", 1)
util.add_ingredient("oil_rig", "tungsten-carbide", 5)

-- High caliber guns
util.replace_ingredient("penetrator-shell", "steel-plate", "tungsten-plate")
util.add_to_ingredient("penetrator-shell", "tungsten-plate", 2)
util.replace_ingredient("basic-ammo-crate", "copper-plate", "tungsten-plate")

if mods["expanded-rocket-paylods"] then
  util.replace_some_ingredient("advanced-assembler", "steel", 100, "tungsten-carbide", 100)
end
