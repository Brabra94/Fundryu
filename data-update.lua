-- data-update.lua

-- Mise à jour des recettes existantes pour utiliser la catégorie foundry-crafting
local function update_recipes()
    local recipes_to_update = {
        "steel-plate",
        "iron-plate", 
        "copper-plate"
    }
    
    for _, recipe_name in pairs(recipes_to_update) do
        if data.raw.recipe[recipe_name] then
            -- Ajouter la recette foundry-crafting comme alternative
            local base_recipe = data.raw.recipe[recipe_name]
            local fundryu_recipe = table.deepcopy(base_recipe)
            fundryu_recipe.name = "fundryu-" .. recipe_name
            fundryu_recipe.category = "foundry-crafting"
            fundryu_recipe.enabled = false
            fundryu_recipe.allow_productivity = true
            fundryu_recipe.allow_quality = true
            fundryu_recipe.emissions_multiplier = 4
            
            -- Améliorer les résultats pour la fonderie
            if fundryu_recipe.results then
                for _, result in pairs(fundryu_recipe.results) do
                    if result.amount then
                        result.amount = math.floor(result.amount * 1.5)
                    end
                end
            end
            
            data:extend({fundryu_recipe})
        end
    end
end

-- Support des fluides et compatibilité Space Age
local function setup_fluid_support()
    if data.raw["assembling-machine"]["fundryu-advanced-foundry"] then
        local fundryu = data.raw["assembling-machine"]["fundryu-advanced-foundry"]
        
        -- Les assembling machines n'ont pas besoin de fluid_boxes explicites
        -- Ils utilisent seulement fluid_boxes_off_when_no_fluid_recipe = true
        -- qui est déjà défini dans l'entité
    end
end

-- Compatibilité Space Age
local function setup_space_age_compatibility()
    if mods["space-age"] then
        if data.raw["assembling-machine"]["fundryu-advanced-foundry"] then
            local fundryu = data.raw["assembling-machine"]["fundryu-advanced-foundry"]
            
            -- Ajouter le support des modules de qualité pour Space Age
            if fundryu.allowed_effects then
                table.insert(fundryu.allowed_effects, "quality")
            else
                fundryu.allowed_effects = {"productivity", "quality"}
            end
            
            -- Ajouter le support du gel pour Space Age
            fundryu.heating_energy = "200kW"
            fundryu.graphics_set.reset_animation_when_frozen = true
            fundryu.graphics_set.frozen_patch = {
                filename = "__Fundryu__/graphics/fundryu/fundryu-hr-frozen-1.png",
                priority = "high",
                width = 540,
                height = 580,
                line_length = 8,
                lines_per_file = 8,
                frame_count = 64,
                shift = util.by_pixel_hr(0, -26),
                tint = { r = 1, g = 1, b = 1, a = 1 },
                scale = 0.5,
            }
        end
        
        -- Mettre à jour la technologie pour Space Age
        if data.raw.technology["fundryu-advanced-foundry"] then
            data.raw.technology["fundryu-advanced-foundry"].prerequisites = {"metallurgic-science-pack", "electromagnetic-science-pack"}
            data.raw.technology["fundryu-advanced-foundry"].unit = {
                count = 2500,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"electromagnetic-science-pack", 1}
                },
                time = 60
            }
        end
    end
end

update_recipes()
setup_fluid_support()
setup_space_age_compatibility() 