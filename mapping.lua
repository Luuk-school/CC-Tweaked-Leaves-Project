-- block readers functie
local function blockReaders()
    for_, name in ipairs(peripheral.getNames()) do
        if name:match("^block_reader_(%d+)$") then
            local reader = peripheral.wrap(name)
            if reader then
                print("block" .. reader)
                if read == "minecraft:piston_head" then
                    print("piston head detected")
                    return name
                end
            end
        end
    end
end

x = 0   -- tijdelijke x
-- mapping functie
local function matching(relay)
    local relay = peripheral.wrap(relay)
    relay.setOutput("front", true)
    local blockReader = blockReaders()
--    print(blockReader)
    if blockReader then
        x = x + 1
        print(x)
    end
    relay.setOutput("front", false)
end

-- main loop
local relays = {}
local readers = {}
for _, name in ipairs(peripheral.getNames()) do
    if name:match("^redstone_relay_(%d+)$") then
        matching(name)
    end
end

--mapping functie
local devicePairs = {}
for i = 1, math.min(#relays, #readers) do
    devicePairs[#devicePairs + 1] = {relay = relays[i], reader = readers[i]}
end

