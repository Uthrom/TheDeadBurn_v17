require("prototypes.item")

function AddLootToEntity(entityType, entityName, itemName, probability, countMin, countMax)
	if data.raw[entityType] ~= nil then
		if data.raw[entityType][entityName] ~= nil then
			if data.raw[entityType][entityName].loot == nil then
				data.raw[entityType][entityName].loot = {}
			end
			table.insert(data.raw[entityType][entityName].loot, {item = itemName, probability = probability, count_min = countMin, count_max = countMax})
		end
	end
end

for _, unit in pairs(data.raw['unit']) do
	if unit.corpse then
		AddLootToEntity("unit",unit.name,unit.corpse,1,1,1)
	end
end

for _, unit in pairs(data.raw['unit-spawner']) do
	if unit.corpse then
		AddLootToEntity("unit-spawner",unit.name,unit.corpse,1,1,1)
	end
end

for _, unit in pairs(data.raw['turret']) do
	if unit.corpse then
		AddLootToEntity("turret",unit.name,unit.corpse,1,1,1)
	end
end
