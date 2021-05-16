if (not mods["pyrawores"] and not mods["bobplates"] and not mods["angelssmelting"]) then
if omni and omni.matter then
  omni.matter.add_resource("tungsten-ore", omni.matter.get_ore_tier("iron-ore"))
end
end

