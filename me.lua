local me = {}

me.name = "bztungsten"
me.tungsten_ore = "tungsten-ore"
me.tungsten_plate = "tungsten-plate"
me.tungsten_carbide_recipe = "tungsten-carbide"
me.recipes = {me.tungsten_plate, me.tungsten_carbide_recipe, "rocket-engine-nozzle",
           "enriched-tungsten-plate",
           "enriched-tungsten",
           "tungsten-smelting-vulcanite",
           "molten-tungsten", "tungsten-powder",
           "enriched-tungsten-smelting-vulcanite",
           "tungsten-carbide-coal",}

me.tungsten_processing = "tungsten-processing"
if mods.bobplates then
  me.tungsten_processing = "bz-tungsten-processing"
  me.tungsten_carbide_recipe = "bz-tungsten-carbide"
end

function me.cuw()
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bztungsten-more-intermediates") == "cuw"
end

function me.sinter()
  return me.get_setting("bztungsten-se-sintering")
end


function me.starting_patch()
  return mods["Krastorio2"] or me.get_setting("bztungsten-starting-patch")
end

function me.fluid_amount()
  if mods["Krastorio2"] then
    local amt = me.get_setting("bztungsten-mining-fluid-amount-k2")
    return amt and amt or 1
  end
  local amt = me.get_setting("bztungsten-mining-fluid-amount")
  return amt and amt or 10
end


function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end
me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

function me.add_modified(name) 
  if me.get_setting(me.name.."-list") then 
    table.insert(me.list, name)
  end
end

return me
