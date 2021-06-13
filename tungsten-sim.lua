
-- -- For testing only
-- local kept1 = false
-- for name in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
--   if kept1 then
--     data.raw["utility-constants"]["default"].main_menu_simulations[name] = nil
--   end
--   kept1 = true
-- end

if (not mods["bobplates"] and not mods["angelssmelting"]) then
data.raw["utility-constants"]["default"].main_menu_simulations["tungsten-nozzle"] = {
  checkboard = false,
  save = "__bztungsten__/menu-simulations/tungsten-nozzle-sim.zip", length = 15*60,
  init =
  [[
    local logo = game.surfaces.nauvis.find_entities_filtered{
      name = "factorio-logo-11tiles", limit = 1}[1]
    game.camera_position = {logo.position.x, logo.position.y+8}
    game.camera_zoom = 1.5
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
  update = [[]]
}
end

