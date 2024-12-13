-- prototypes/technology.lua

data:extend({
    {
        type = "technology",
        name = "fundryu-foundry",
        icon = "__Fundryu__/graphics/metallurgy.png",
        icon_size = 256,
        prerequisites = {"steel-processing", "automation-science-pack", "logistic-science-pack", "production-science-pack", "utility-science-pack", "space-science-pack"},
        effects = {},
        unit = {
            count = 1000,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 20
        },
        order = "c-a",
        localised_name = {"technology-name.fundryu-foundry"},
        localised_description = {"technology-description.fundryu-foundry"}
    },
    
    {
        type = "technology",
        name = "advanced-foundry-research",
        icon = "__Fundryu__/graphics/icon2.png",
        icon_size = 256,
        prerequisites = {"fundryu-foundry"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "fundryu-advanced-foundry"
            }
        },
        unit = {
            count = 4000,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 30
        },
        order = "c-a",
        localised_name = {"technology-name.advanced-foundry-research"},
        localised_description = {"technology-description.advanced-foundry-research"}
    },
        {
        type = "technology",
        name = "mastery-iron",
        icon = "__Fundryu__/graphics/iron-processing.png",
        icon_size = 256,
        prerequisites = {"advanced-foundry-research"},
        unit = {
            count = 200,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 30
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "fundryu-iron-to-steel"
            },
            {
                type = "unlock-recipe",
                recipe = "fundryu-iron-to-gear"
            },
            {
                type = "unlock-recipe",
                recipe = "fundryu-iron-to-iron-plate"
            }
        },
        order = "c-a",
        localised_name = {"technology-name.mastery-iron"},
        localised_description = {"technology-description.mastery-iron"}
    },
    {
        type = "technology",
        name = "mastery-copper",
        icon = "__Fundryu__/graphics/copper-processing.png",
        icon_size = 256,
        prerequisites = {"advanced-foundry-research"},
        unit = {
            count = 200,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 30
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "fundryu-copper-to-copper-plate"
            }
        },
        order = "c-a",
        localised_name = {"technology-name.mastery-copper"},
        localised_description = {"technology-description.mastery-copper"}
    },
})
