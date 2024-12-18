-- Space-age compatibility --
if mods["space-age"] then
    data.raw.technology["fundryu-foundry"].prerequisites = {"metallurgic-science-pack"} 
    data.raw.technology["advanced-foundry-research"].prerequisites = {"fundryu-foundry"}

   
    local advanced_foundry_recipe = data.raw.recipe["fundryu-advanced-foundry"]
    if advanced_foundry_recipe then
        for index, ingredient in pairs(advanced_foundry_recipe.ingredients) do
            if ingredient.name == "steel-plate" then
                advanced_foundry_recipe.ingredients[index] = {type = "item", name = "tungsten-plate", amount = ingredient.amount}
            end
        end
        table.insert(advanced_foundry_recipe.ingredients, {type = "item", name = "carbon", amount = 500})
    end

    local recipe = data.raw.recipe["fundryu-advanced-foundry"]
    local has_tungsten_carbide = false
    local tungsten_carbide_index = nil
    
    for idx, ingredient in pairs(recipe.ingredients) do
        if ingredient.name == "tungsten-carbide" then
            has_tungsten_carbide = true
            tungsten_carbide_index = idx
            break
        end
    end

    for index, ingredient in pairs(recipe.ingredients) do
        if ingredient.name == "iron-plate" then
            if has_tungsten_carbide then
                recipe.ingredients[tungsten_carbide_index].amount = recipe.ingredients[tungsten_carbide_index].amount + ingredient.amount
                table.remove(recipe.ingredients, index)
            else
                recipe.ingredients[index] = {type = "item", name = "tungsten-carbide", amount = ingredient.amount}
            end
            break
        end
    end

    local fundryu_technologies = {
        "fundryu-foundry",
        "advanced-foundry-research",
        "mastery-iron",
        "mastery-copper"
    }

    for _, tech_name in pairs(fundryu_technologies) do
        local tech = data.raw.technology[tech_name]
        if tech and tech.unit and tech.unit.ingredients then
            table.insert(tech.unit.ingredients, {"metallurgic-science-pack", 1})
        end
    end
end