-- data-final-fixes.lua

local util = require("util")

-- Liste des recettes dupliquer dans la catégorie foundry-crafting
local baseRecipesToDuplicate = {
    "fundryu-iron-to-steel",
    "fundryu-copper-to-wire",
}

-- Fonction pour dupliquer une recette et l'assigner à la catégorie foundry-crafting avec un nom unique
local function duplicateRecipe(recipeName, newCategory)
    local original = data.raw.recipe[recipeName]
    if original then
        local newRecipe = table.deepcopy(original)
        newRecipe.name = recipeName .. ""  
        newRecipe.category = newCategory
        data:extend({newRecipe})
        log("Recette dupliquée : " .. newRecipe.name .. " dans la catégorie " .. newCategory)
    else
        log("Recette originale non trouvée : " .. recipeName)
    end
end

-- Duplique les recettes sélectionnées
for _, recipeName in ipairs(baseRecipesToDuplicate) do
    duplicateRecipe(recipeName, "foundry-crafting")
end