-- prototypes/entity.lua

local base = {
    type = "assembling-machine",
    name = "fundryu-advanced-foundry",
    icon = "__Fundryu__/graphics/advanced-foundry-icon.png",
    icon_size = 64,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { hardness = 0.2, mining_time = 1, result = "fundryu-advanced-foundry" },
    max_health = 2000,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    resistances = { { type = "fire", percent = 90 } },
    crafting_categories = { "foundry-crafting" },
    crafting_speed = 5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = { pollution = 70 },{ pollen = 70 }
    },
    surface_conditions = nil, 
    energy_usage = "1MW",
    module_slots = 9,
    allowed_effects = {"productivity", "quality" },
    working_sound = {
        audible_distance_modifier = 0.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
        sound = { filename = "__Fundryu__/sound/burn-effect.ogg", volume = 0.65 }
    },
    source_inventory_size = 1,
    result_inventory_size = 1,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__Fundryu__/graphics/advanced-foundry-hr-shadow.png",
                    priority = "high",
                    width = 900,
                    height = 800,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 120,
                    draw_as_shadow = true,
                    animation_speed = 0.15,
                    scale = 0.5
                },
                {
                    priority = "high",
                    width = 530,
                    height = 530,
                    frame_count = 120,
                    animation_speed = 0.15,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__Fundryu__/graphics/advanced-foundry-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8
                        },
                        {
                            filename = "__Fundryu__/graphics/advanced-foundry-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 7
                        }
                    }
                }
            }
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    width = 530,
                    height = 530,
                    frame_count = 120,
                    draw_as_glow = true,
                    scale = 0.5,
                    animation_speed = 0.15,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__Fundryu__/graphics/advanced-foundry-hr-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8
                        },
                        {
                            filename = "__Fundryu__/graphics/advanced-foundry-hr-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 7
                        }
                    }
                }
            }
        }
    }
}

local base_item = {
    type = "item",
    name = "fundryu-advanced-foundry",
    icon = "__Fundryu__/graphics/advanced-foundry-icon.png",
    icon_size = 64,
    subgroup = "smelting-machine",
    order = "a-a",
    place_result = "fundryu-advanced-foundry",
    stack_size = 1
}

local function add_item(entity)
    local item = table.deepcopy(base_item)
    item.name = entity.name
    item.icon = entity.icon
    item.icon_size = entity.icon_size
    item.place_result = item.name
    data:extend({ item })
end

local function add_entity(entity)
    local base_entity = table.deepcopy(base)
    base_entity.name = entity.name
    base_entity.minable.result = entity.name
    base_entity.icon = entity.icon
    base_entity.icon_size = entity.icon_size
    base_entity.fluid_boxes = entity.fluid_boxes
    base_entity.selection_box = entity.selection_box
    base_entity.collision_box = { { -3.7, -3.7 }, { 3.7, 3.7 } }
    data:extend({ base_entity })
    add_item(entity)
end

add_entity({
    name = "fundryu-advanced-foundry",
    icon = "__Fundryu__/graphics/advanced-foundry-icon.png",
    icon_size = 64,
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },

})

