-- main file
local object = require("mapping") --werkt mogelijk niet in CC: ander gebruik dofile
--local object = dofile("mapping.lua") -- werkt mogelijk niet in CC: ander gebruik require
                            --Verwijder later de commentaar.
while true do
    for i = 1, #object do
        local relay = peripheral.wrap(object[i].relay)
        local reader = peripheral.wrap(object[i].reader)
        
        if reader.getBlock() == " Hier  moet je nog de blockdata van die leave neerzetten  " then
            local stage = reader.getblockdata(stage)
                if stage == 3 then
                    relay.setOutput("front", true)
                end
        else
            relay.setOutput("front", false)
        end
    end
    sleep(30)
ends