require("tungsten-recipe-updates")
require("tungsten-matter")
require("omni")
require("map-gen-preset-updates")
require("tungsten-recipe-5d")
require("strange-matter")
require("compatibility/248k")

local util = require("data-util");

if mods["aai-industry"] then
  util.add_prerequisite("pumpjack", "tinned-cable")
  util.add_prerequisite("oil-processing", "pumpjack")
  util.add_prerequisite("oil-processing", "tungsten-processing")
  util.remove_recipe_effect("oil-processing", "pumpjack")
end

if mods.Asteroid_Mining then
  require("__Asteroid_Mining__.scripts.addmodule")
  amfunc.addtype("tungsten-ore", {a = 0,r = 0.55,g = 0.60,b = 0.5})
end

if mods.Krastorio2 then
  util.remove_prerequisite("kr-fluids-chemistry", "engine")
end

require("modules")
