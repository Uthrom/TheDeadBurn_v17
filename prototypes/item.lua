local function starts_with(str, start)
    return str:sub(1, #start) == start
end

for _, corpse in pairs(data.raw['corpse']) do
    if corpse.subgroup == 'corpses' then
        local monsterBody = table.deepcopy(data.raw['item']['coal'])
        monsterBody.name = "monster-body"
        monsterBody.icon = "__base__/graphics/icons/medium-biter-corpse.png"
        monsterBody.icon_size = 32
        monsterBody.icon_mipmaps = 1
        monsterBody.pictures = {{ filename = monsterBody.icon, mipmap_count = 1, scale = 1, size = corpse.icon_size}}

        if starts_with(corpse.name, "small") then
	    monsterBody.name = "monster-body-small"
	    monsterBody.fuel_value = "4MJ"
        elseif starts_with(corpse.name, "medium") then 
	    monsterBody.name = "monster-body-medium"
	    monsterBody.fuel_value = "8MJ" 
        elseif starts_with(corpse.name, "big") then 
	    monsterBody.name = "monster-body-big"
	    monsterBody.fuel_value = "16MJ" 
        elseif starts_with(corpse.name, "behemoth") then 
	    monsterBody.name = "monster-body-behemoth"
	    monsterBody.fuel_value = "32MJ" 
        else
            monsterBody.name = "monster-body-small"
            monsterBody.fuel_value = "4MJ"
        end
        data:extend({monsterBody})
    end
end
