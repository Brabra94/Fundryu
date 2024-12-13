-- prototypes/recipe.lua

data:extend({
    {
        type = "recipe-category",
        name = "foundry-crafting"
    },
    {
        type = "recipe",
        name = "fundryu-advanced-foundry",
        icon = "__Fundryu__/graphics/advanced-foundry-icon.png",
        icon_size = 64,
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = "item", name = "steel-plate", amount = 1000 },
            { type = "item", name = "electronic-circuit", amount = 50 },
            { type = "item", name = "advanced-circuit", amount = 50 },
            { type = "item", name = "iron-plate", amount = 1000 },
            { type = "item", name = "processing-unit", amount = 25 }
        },
        results = {
            { type = "item", name = "fundryu-advanced-foundry", amount = 1 }
        }
    },
    {
        type = "recipe",
        name = "fundryu-iron-to-steel",
        icon = "__base__/graphics/icons/steel-plate.png",
        icon_size = 64,
        category = "foundry-crafting",
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = "item", name = "iron-ore", amount = 1 }
        },
        results = {
            { type = "item", name = "steel-plate", amount = 2 }
        },
        allow_productivity = true,
        allow_quality = true,
        emissions_multiplier = 4
    },
    {
        type = "recipe",
        name = "fundryu-iron-to-gear",
        icon = "__base__/graphics/icons/iron-gear-wheel.png",
        icon_size = 64,
        category = "foundry-crafting",
        enabled = false,
        energy_required = 1,
        ingredients = {
            { type = "item", name = "iron-ore", amount = 1 }
        },
        results = {
            { type = "item", name = "iron-gear-wheel", amount = 5 }
        },
        allow_productivity = true,
        allow_quality = true,
        emissions_multiplier = 4
    },
    {
        type = "recipe",
        name = "fundryu-iron-to-iron-plate",
        icon = "__base__/graphics/icons/iron-plate.png",
        icon_size = 64,
        category = "foundry-crafting",
        enabled = false,
        energy_required = 3,
        ingredients = {
            { type = "item", name = "iron-ore", amount = 1 }
        },
        results = {
            { type = "item", name = "iron-plate", amount = 5 }
        },
        allow_productivity = true,
        allow_quality = true,
        emissions_multiplier = 4
    },
    {
        type = "recipe",
        name = "fundryu-copper-to-copper-plate",
        icon = "__base__/graphics/icons/copper-plate.png",
        icon_size = 64,
        category = "foundry-crafting",
        enabled = false,
        energy_required = 3,
        ingredients = {
            { type = "item", name = "copper-ore", amount = 1 }
        },
        results = {
            { type = "item", name = "copper-plate", amount = 5 },
            { type = "item", name = "copper-cable", amount = 2 }
        },
        allow_productivity = true,
        allow_quality = true,
        emissions_multiplier = 4
    }
})
