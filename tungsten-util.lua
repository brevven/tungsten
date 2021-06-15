local util = {}

util.tungsten_ore = "tungsten-ore"
util.tungsten_plate = "tungsten-plate"

util.tungsten_processing = "tungsten-processing"
if bobmods and bobmods.lib and bobmods.lib.recipe and bobmods.lib.tech then
  util.tungsten_processing = "bz-tungsten-processing"
end

function util.fe_plus(sub)
  if mods["FactorioExtended-Plus-"..sub] then
    return true
  end
end


function util.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

function util.get_stack_size(default) 
  if mods["Krastorio2"] then
    size = tonumber(krastorio.general.getSafeSettingValue("kr-stack-size"))
    return size or default
  end
  return default
end

-- check if a table contains a sought value
function util.contains(table, sought)
  for i, value in pairs(table) do
    if value == sought then
      return true
    end
  end
  return false
end

-- Add a prerequisite to a given technology
function util.add_prerequisite(technology_name, prerequisite)
  technology = data.raw.technology[technology_name]
  if technology and data.raw.technology[prerequisite] then
    if technology.prerequisites then
      table.insert(technology.prerequisites, prerequisite)
    else
      technology.prerequisites = {prerequisite}
    end
  end
end

-- Remove a prerequisite from a given technology
function util.remove_prerequisite(technology_name, prerequisite)
  technology = data.raw.technology[technology_name]
  local index = -1
  if technology and data.raw.technology[prerequisite] then
    for i, prereq in pairs(technology.prerequisites) do
      if prereq == prerequisite then
        index = i
        break
      end
    end
    if index > -1 then
      table.remove(technology.prerequisites, index)
    end
  end
end

-- Add an effect to a given technology
function util.add_effect(technology_name, effect)
  technology = data.raw.technology[technology_name]
  if technology then
    table.insert(technology.effects, effect)
  end
end

-- Set technology ingredients
function util.set_tech_recipe(technology_name, ingredients)
  technology = data.raw.technology[technology_name]
  if technology then
    technology.unit.ingredients = ingredients
  end
end

-- Add a given quantity of ingredient to a given recipe
function util.add_ingredient(recipe_name, ingredient, quantity)
  if data.raw.recipe[recipe_name] then
    add_ingredient(data.raw.recipe[recipe_name], ingredient, quantity)
    add_ingredient(data.raw.recipe[recipe_name].normal, ingredient, quantity)
    add_ingredient(data.raw.recipe[recipe_name].expensive, ingredient, quantity)
  end
end

function add_ingredient(recipe, ingredient, quantity)
  if recipe ~= nil and recipe.ingredients ~= nil then
    table.insert(recipe.ingredients, {ingredient, quantity})
  end
end

-- Add a given quantity of product to a given recipe. 
-- Only works for recipes with multiple products
function util.add_product(recipe_name, product)
  if data.raw.recipe[recipe_name] then
    add_product(data.raw.recipe[recipe_name], product)
    add_product(data.raw.recipe[recipe_name].normal, product)
    add_product(data.raw.recipe[recipe_name].expensive, product)
  end
end

function add_product(recipe, product)
  if recipe ~= nil and recipe.results ~= nil then
    table.insert(recipe.results, product)
  end
end

-- Replace one ingredient with another in a recipe
function util.replace_ingredient(recipe_name, old, new)
  if data.raw.recipe[recipe_name] then
    replace_ingredient(data.raw.recipe[recipe_name], old, new)
    replace_ingredient(data.raw.recipe[recipe_name].normal, old, new)
    replace_ingredient(data.raw.recipe[recipe_name].expensive, old, new)
  end
end

function replace_ingredient(recipe, old, new)
	if recipe ~= nil and recipe.ingredients ~= nil then
		for i, ingredient in pairs(recipe.ingredients) do 
			if ingredient.name == old then ingredient.name = new end
			if ingredient[1] == old then ingredient[1] = new end
		end
	end
end

-- Remove an ingredient from a recipe
function util.remove_ingredient(recipe_name, old)
  if data.raw.recipe[recipe_name] then
    remove_ingredient(data.raw.recipe[recipe_name], old)
    remove_ingredient(data.raw.recipe[recipe_name].normal, old)
    remove_ingredient(data.raw.recipe[recipe_name].expensive, old)
  end
end

function remove_ingredient(recipe, old)
  index = -1
	if recipe ~= nil and recipe.ingredients ~= nil then
		for i, ingredient in pairs(recipe.ingredients) do 
      if ingredient.name == old or ingredient[1] == old then
        index = i
        break
      end
    end
    if index > -1 then
      table.remove(recipe.ingredients, index)
    end
  end
end


-- Replace an amount of an ingredient in a recipe. Keep at least 1 of old.
function util.replace_some_ingredient(recipe_name, old, old_amount, new, new_amount)
  if data.raw.recipe[recipe_name] then
    replace_some_ingredient(data.raw.recipe[recipe_name], old, old_amount, new, new_amount)
    replace_some_ingredient(data.raw.recipe[recipe_name].normal, old, old_amount, new, new_amount)
    replace_some_ingredient(data.raw.recipe[recipe_name].expensive, old, old_amount, new, new_amount)
  end
end

function replace_some_ingredient(recipe, old, old_amount, new, new_amount)
	if recipe ~= nil and recipe.ingredients ~= nil then
		for i, ingredient in pairs(recipe.ingredients) do 
			-- For final fixes
			if ingredient.name == old then
        ingredient.amount = math.max(1, ingredient.amount - old_amount)
      end
			-- For updates
			if ingredient[1] == old then
        ingredient[2] = math.max(1, ingredient[2] - old_amount)
      end
		end
    add_ingredient(recipe, new, new_amount)
	end
end


return util
