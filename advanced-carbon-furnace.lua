local futil = require("util");
local util = require("__bztungsten__.data-util");

if util.me.get_setting("bztungsten-advanced-carbon-furnace") == "yes" and not mods.Krastorio2 and not mods.bzfoundry then
  log("Using advanced carbon furnace")
  data:extend({
  {
    type = "item",
    name = "advanced-carbon-furnace",
    icons = {{
      icon = "__base__/graphics/icons/steel-furnace.png",
      icon_size = 64, icon_mipmaps = 4,
      tint = {a = 1, r = .55, g = .6, b = .6},
    }},
    subgroup = "smelting-machine",
    order = "c[advanced-carbon-furnace]",
    place_result = "advanced-carbon-furnace",
    stack_size = 50,
  },
  {
    type = "recipe",
    name = "advanced-carbon-furnace",
    ingredients = {{"steel-furnace", 2}, {"stone-brick", 5}, {"tungsten-plate", 5}},
    result = "advanced-carbon-furnace",
    energy_required = 6,
    enabled = false,
  },
  {
    type = "technology",
    name = "advanced-carbon-furnace",
    icons = {{
      icon = "__base__/graphics/technology/advanced-material-processing.png",
      icon_size = 256, icon_mipmaps = 4,
      tint = {a = 1, r = .55, g = .6, b = .6},
    }},
    effects =
    {
      {
        type =  "unlock-recipe",
        recipe = "advanced-carbon-furnace",
      },
    },
    unit =
    {
      count = 500,
      ingredients = 
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
          },
      time = 30,
    },
    prerequisites = {"advanced-material-processing-2", "productivity-module-3"},
    order = "b-b"
  },

  {
    type = "furnace",
    name = "advanced-carbon-furnace",
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "advanced-carbon-furnace"},
    max_health = 300,
    corpse = "steel-furnace-remnants",
    dying_explosion = "steel-furnace-explosion",
    vehicle_impact_sound = data.raw.furnace["steel-furnace"].vehicle_impact_sound,
    open_sound = data.raw.furnace["steel-furnace"].machine_open,
    close_sound = data.raw.furnace["steel-furnace"].machine_close,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/steel-furnace.ogg",
          volume = 0.46
        }
      },
      max_sounds_per_type = 4,
      audible_distance_modifier = 0.37,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    damaged_trigger_effect = data.raw.furnace["steel-furnace"].hit_effects,
    crafting_categories = {}, -- added later
    result_inventory_size = 1,
    energy_usage = "720kW",
    crafting_speed = 8,
    base_productivity = 0.3,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      emissions_per_minute = 4,
      fuel_inventory_size = 1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          frequency = 10,
          position = {0.7, -1.2},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
          priority = "high",
          width = 85,
          height = 87,
          frame_count = 1,
          shift = futil.by_pixel(-1.5, 1.5),
          tint = {a = 1, r = .55, g = .6, b = .6},
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
            priority = "high",
            width = 171,
            height = 174,
            frame_count = 1,
            shift = futil.by_pixel(-1.25, 2),
            scale = 0.5,
            tint = {a = 1, r = .55, g = .6, b = .6},
          }
        },
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
          priority = "high",
          width = 139,
          height = 43,
          frame_count = 1,
          draw_as_shadow = true,
          shift = futil.by_pixel(39.5, 11.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
            priority = "high",
            width = 277,
            height = 85,
            frame_count = 1,
            draw_as_shadow = true,
            shift = futil.by_pixel(39.25, 11.25),
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
        draw_as_light = true,
        fadeout = true,
        effect = "flicker",
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
          priority = "high",
          line_length = 8,
          width = 29,
          height = 40,
          frame_count = 48,
          direction_count = 1,
          shift = futil.by_pixel(-0.5, 6),
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-fire.png",
            priority = "high",
            line_length = 8,
            width = 57,
            height = 81,
            frame_count = 48,
            direction_count = 1,
            shift = futil.by_pixel(-0.75, 5.75),
            scale = 0.5
          }
        },
      },
      {
        fadeout = true,
        draw_as_light = true,
        effect = "flicker",
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
          priority = "high",
          width = 60,
          height = 43,
          frame_count = 1,
          shift = {0.03125, 0.640625},
          blend_mode = "additive"
        }
      },
      {
        fadeout = true,
        draw_as_light = true,
        effect = "flicker",
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
          priority = "high",
          line_length = 1,
          width = 64,
          height = 74,
          frame_count = 1,
          direction_count = 1,
          shift = futil.by_pixel(0, -4),
          blend_mode = "additive",
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-working.png",
            priority = "high",
            line_length = 1,
            width = 128,
            height = 150,
            frame_count = 1,
            direction_count = 1,
            shift = futil.by_pixel(0, -5),
            blend_mode = "additive",
            scale = 0.5,
          }
        }
      },
      {
        draw_as_light = true,
        draw_as_sprite = false,
        fadeout = true,
        effect = "flicker",
        animation =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-ground-light.png",
          priority = "high",
          line_length = 1,
          draw_as_sprite = false,
          width = 78,
          height = 64,
          frame_count = 1,
          direction_count = 1,
          shift = futil.by_pixel(0, 48),
          blend_mode = "additive",
          hr_version =
          {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-ground-light.png",
            priority = "high",
            line_length = 1,
            draw_as_sprite = false,
            width = 152,
            height = 126,
            frame_count = 1,
            direction_count = 1,
            shift = futil.by_pixel(1, 48),
            blend_mode = "additive",
            scale = 0.5,
          }
        },
      },
    },
    fast_replaceable_group = "furnace",
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/steel-furnace/steel-furnace-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 24,
        shift = futil.by_pixel(0, 45),
        tint = {a = 1, r = .55, g = .6, b = .6},
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  })
end
