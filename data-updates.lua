require("tungsten-recipe-updates")
require("tungsten-matter")
require("omni")
require("map-gen-preset-updates")
require("tungsten-recipe-5d")
require("strange-matter")

local util = require("data-util");

if mods.Asteroid_Mining then
  require("__Asteroid_Mining__.scripts.addmodule")
  amfunc.addtype("tungsten-ore", {a = 0,r = 0.55,g = 0.60,b = 0.5})
end
