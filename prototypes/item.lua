local function starts_with(str, start)
    return str:sub(1, #start) == start
end

for _, corpse in pairs(data.raw["corpse"]) do
    if corpse.subgroup == "corpses" then
        local tint
        local monsterBody = table.deepcopy(data.raw["item"]["coal"])
        monsterBody.name = "monster-body"
        monsterBody.icon = "__base__/graphics/icons/medium-biter-corpse.png"
        monsterBody.icon_size = 64

        if starts_with(corpse.name, "small") then
            monsterBody.name = "monster-body-small"
            monsterBody.fuel_value = "4MJ"
        elseif starts_with(corpse.name, "medium") then
            monsterBody.name = "monster-body-medium"
            tint = {r = 255, g = 0, b = 0}
            monsterBody.fuel_value = "32MJ"
        elseif starts_with(corpse.name, "big") then
            monsterBody.name = "monster-body-big"
            tint = {r = 0, g = 0, b = 255}
            monsterBody.fuel_value = "64MJ"
        elseif starts_with(corpse.name, "behemoth") then
            monsterBody.name = "monster-body-behemoth"
            tint = {r = 0, g = 255, b = 0}
            monsterBody.fuel_value = "128MJ"
            monsterBody.fuel_acceleration_multiplier = 1.5
            monsterBody.fuel_top_speed_multiplier = 1.5
        else
            monsterBody.name = "monster-body-small"
            monsterBody.fuel_value = "4MJ"
        end

        monsterBody.icon_mipmaps = 4
        monsterBody.icons = {{icon = monsterBody.icon, icon_size = 64, tint = tint}}
        monsterBody.pictures = {{filename = monsterBody.icon, tint = tint, mipmap_count = 4, scale = 0.25, size = corpse.icon_size}}

        monsterBody.icon = nil
        monsterBody.dark_background_icon = nil

        data:extend({monsterBody})
    end
end
