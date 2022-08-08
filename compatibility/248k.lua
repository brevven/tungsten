local util = require("__bztungsten__.data-util");

if mods["248k"] then
  local cuw = util.me.cuw() and "cuw" or "tungsten-plate"
  util.add_ingredient("fu_ingot_recipe", cuw, 20)
  util.add_ingredient("fu_plasma_recipe", cuw, 40)
  util.add_ingredient("fi_crafter_recipe", cuw, 40)
  util.add_ingredient("fi_solid_reactor_recipe", cuw, 200)
  util.add_ingredient("fu_tokamak_reactor_recipe", cuw, 200)
  util.add_ingredient("fu_stelar_reactor_recipe", cuw, 200)

  util.replace_ingredient("fu_drill_recipe", util.titanium_plate, "tungsten-carbide")
  util.replace_ingredient("fu_drill_recipe", "fi_materials_titan", "tungsten-carbide")
  util.add_ingredient("fi_crusher_recipe", "tungsten-carbide", 10)

  -- Only modify if CuW is used
  util.add_ingredient("fi_modules_base_recipe", "cuw", 1)

end
