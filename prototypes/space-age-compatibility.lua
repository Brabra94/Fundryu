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

    
    for _, recipe in pairs(data.raw.recipe) do
        if recipe.ingredients then
           
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
        end
    end


    for _, tech in pairs(data.raw.technology) do
        if tech.unit and tech.unit.ingredients then
            
            local has_metallurgic_science = false
            for _, ingredient in pairs(tech.unit.ingredients) do
                if (ingredient.name and ingredient.name == "metallurgic-science-pack") or
                   (ingredient[1] and ingredient[1] == "metallurgic-science-pack") then
                    has_metallurgic_science = true
                    break
                end
            end
            if not has_metallurgic_science then
              
                table.insert(tech.unit.ingredients, {"metallurgic-science-pack", 1})
            end
        end
    end
end