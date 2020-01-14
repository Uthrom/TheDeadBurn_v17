require("prototypes.item")
require("prototypes.recipe")

local function starts_with(str, start)
    return str:sub(1, #start) == start
end

local function AddLootToEntity(entityType, entityName, itemName, probability, countMin, countMax)
    if data.raw[entityType] ~= nil then
        if data.raw[entityType][entityName] ~= nil then
            if data.raw[entityType][entityName].loot == nil then
                data.raw[entityType][entityName].loot = {}
            end
            table.insert(data.raw[entityType][entityName].loot, {item = itemName, probability = probability, count_min = countMin, count_max = countMax})
        end
    end
end

for _, unit in pairs(data.raw["unit"]) do
    if unit.corpse then
        if starts_with(unit.corpse, "small") then
            AddLootToEntity("unit", unit.name, "monster-body-small", 1, 1, 1)
        end
        if starts_with(unit.corpse, "medium") then
            AddLootToEntity("unit", unit.name, "monster-body-medium", 1, 1, 1)
        end
        if starts_with(unit.corpse, "big") then
            AddLootToEntity("unit", unit.name, "monster-body-big", 1, 1, 1)
        end
        if starts_with(unit.corpse, "behemoth") then
            AddLootToEntity("unit", unit.name, "monster-body-behemoth", 1, 1, 1)
        end
    end
end

for _, unit in pairs(data.raw["unit-spawner"]) do
    if unit.corpse then
        AddLootToEntity("unit-spawner", unit.name, "monster-body-medium", 1, 1, 1)
    end
end

for _, unit in pairs(data.raw["turret"]) do
    if unit.corpse then
        if starts_with(unit.corpse, "small") then
            AddLootToEntity("turret", unit.name, "monster-body-small", 1, 1, 1)
        end
        if starts_with(unit.corpse, "medium") then
            AddLootToEntity("turret", unit.name, "monster-body-medium", 1, 1, 1)
        end
        if starts_with(unit.corpse, "big") then
            AddLootToEntity("turret", unit.name, "monster-body-big", 1, 1, 1)
        end
        if starts_with(unit.corpse, "behemoth") then
            AddLootToEntity("turret", unit.name, "monster-body-behemoth", 1, 1, 1)
        end
    end
end

log(serpent.block(data.raw))
