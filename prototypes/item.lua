local function starts_with(str, start)
    return str:sub(1, #start) == start
end


for _, corpse in pairs(data.raw['corpse']) do
    if corpse.subgroup == 'corpses' then
        local monsterBody = table.deepcopy(data.raw['item']['coal'])
        monsterBody.name = corpse.name
        monsterBody.icon = corpse.icon
        monsterBody.icon_size = corpse.icon_size
        monsterBody.icon_mipmaps = 1
        monsterBody.pictures = {{ filename = corpse.icon, mipmap_count = 1, scale = 1, size = corpse.icon_size}}

        if starts_with(corpse.name, "small") then
	    monsterBody.fuel_value = "4MJ"
	end
        if starts_with(corpse.name, "medium") then 
	    monsterBody.fuel_value = "8MJ" 
	end
        if starts_with(corpse.name, "big") then 
	    monsterBody.fuel_value = "16MJ" 
	end
        if starts_with(corpse.name, "behemoth") then 
	    monsterBody.fuel_value = "32MJ" 
	end
        
        data:extend{monsterBody}
    end
end
