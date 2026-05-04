-- discovery
local relay = {}
local reader = {}
local matchingList = {}

for_, name in ipairs(peripheral.getNames()) do
    if name:match("^redstone_relay_(%d+)$") then
        table.insert(relay, name)
    elseif name:match("^block_reader_(%d+)$") then
        table.insert(reader, name)
    end
end

-- matching      eerst 1 relay aanzetten en all reader kijken
for i = 1, #relay do
    local relays = peripheral.wrap(relay[i])
    relays.setOutput("front", true)
    for j = 1, #reader do
        local readers = peripheral.wrap(reader[j])
        local matched = false
        local maxRetries = 3
        local retries = 0
        
        while not matched and retries < maxRetries do
            if readers.getBlock() == "minecraft:piston_head" then
                table.insert(matchingList, {relay = relay[i], reader = reader[j]})
                matched = true
            else
                retries = retries + 1
                if retries < maxRetries then
                    sleep(0.5)
                end
            end
        end
    end
    relays.setOutput("front", false)
end

-- objectlist naar runtime
object = matchingList
return object




--          todo lijst.
-- 1 discover                   done
-- 2 matching                   done
-- 2.1 wait for functie maken   done
-- 2.3 procces paring (list)    done
-- 3 testing                    skiped
-- 3 list naar main sturen      done
-- 4 monitor maken              ???