
if simpleCompress then
  if simpleCompress.ores then
    simpleCompress.currentSubgroup = "intermediate-product"
    if data.raw.item["tungsten-ore"] then
      SimpleCompress_AddTintedItem("tungsten-ore", "ore4-tungsten", "ore", {r=0.90, g=0.90, b=0.75})
      SimpleCompress_UnlockOreTechAndRecipe("tungsten-ore")
    end
  end
  if simpleCompress.plates then
    simpleCompress.currentSubgroup = "intermediate-product"
    if data.raw.item["tungsten-plate"] then
      SimpleCompress_AddTintedItem("tungsten-plate", "plates4-tungsten", "plate3", {r=0.90, g=0.90, b=0.75})
      SimpleCompress_UnlockPlateTechAndRecipe("tungsten-plate")
      local tungstenRecipe = data.raw.recipe["decompress-tungsten-plate"]
      tungstenRecipe.order = "d[tungsten-plate]"
    end
  end
  if simpleCompress.smelting then
    if data.raw.item["tungsten-plate"] and data.raw.item["tungsten-plate"] then
      SimpleCompress_AddSmeltingRecipe("tungsten-ore", "tungsten-plate")
      SimpleCompress_UnlockOreSmeltingTech("tungsten-ore")
      local tungstenRecipe = data.raw.recipe["smelt-compressed-tungsten-ore"]
      tungstenRecipe.results = {
        {type="item", name = "tungsten-plate", amount=simpleCompress.CompressedSmeltAmount},
      }
      tungstenRecipe.icons = {{ icon = "__bztungsten__/graphics/icons/tungsten-plate.png", icon_size = 64 }}
      tungstenRecipe.subgroup = "raw-material"
      tungstenRecipe.order = "d[tungsten-plate]"
    end
  end
end
