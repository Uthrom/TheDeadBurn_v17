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

AddLootToEntity("unit","small-spitter","monster-body",1,1,1)
AddLootToEntity("unit","small-biter","monster-body",1,1,1)

AddLootToEntity("unit","medium-spitter","monster-body",1,2,2)
AddLootToEntity("unit","medium-biter","monster-body",1,2,2)

AddLootToEntity("unit","big-spitter","monster-body",1,3,3)
AddLootToEntity("unit","big-biter","monster-body",1,3,3)

AddLootToEntity("unit","behemoth-spitter","monster-body",1,4,4)
AddLootToEntity("unit","behemoth-biter","monster-body",1,4,4)


AddLootToEntity("turret","little-worm-turret","monster-body",1,2,2)
AddLootToEntity("turret","medium-worm-turret","monster-body",1,4,4)
AddLootToEntity("turret","big-worm-turret","monster-body",1,6,6)
