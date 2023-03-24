data:extend({
  {
		type = "string-setting",
		name = "bztungsten-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
    order = "aba",
	},
  {
		type = "string-setting",
		name = "bztungsten-more-intermediates",
		setting_type = "startup",
		default_value = "no",
    allowed_values = {"cuw", "no"},
    order = "aca",
	},
  {
		type = "string-setting",
		name = "bztungsten-avoid-military",
		setting_type = "startup",
		default_value = "yes",
    allowed_values = {"yes", "no"},
    order = "ada",
	},
  {
		type = "string-setting",
		name = "bztungsten-advanced-carbon-furnace",
		setting_type = "startup",
		default_value = "no",
    allowed_values = {"yes", "no"},
    hidden = not not (mods.Krastorio2 or mods.bzfoundry),
    order = "aea",
	},
})

if mods.Krastorio2 then
  data:extend({
    {
      type = "string-setting",
      name = "bztungsten-mining-fluid-k2",
      setting_type = "startup",
      default_value = "mineral-water",
      allowed_values = {"mineral-water", "water"},
      order = "aga",
    },
    {
      type = "int-setting",
      name = "bztungsten-mining-fluid-amount-k2",
      setting_type = "startup",
      default_value = 1,
      minimum_value = 1,
      maximum_value = 1000,
      order = "agb",
    },
  })
else
  data:extend({
    {
      type = "bool-setting",
      name = "bztungsten-starting-patch",
      setting_type = "startup",
      default_value = false,
      hidden = not not mods.Krastorio2,
      order = "afa",
    },
    {
      type = "int-setting",
      name = "bztungsten-mining-fluid-amount",
      setting_type = "startup",
      default_value = 10,
      minimum_value = 1,
      maximum_value = 1000,
      order = "aga",
    },
  })
end

if mods["space-exploration"] and string.sub(mods["space-exploration"], 1, 3) >= "0.6" then
data:extend({
  {
		type = "bool-setting",
		name = "bztungsten-se-sintering",
		setting_type = "startup",
		default_value = false,
    order = "acm",
  }
})
end
