print("^5Carhud wurde gestartet^7")


CreateThread(function()
    while true do
        Wait(500)
        
        local playerPed = cache.ped
        
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 3.6
            local fuel = GetVehicleFuelLevel(vehicle)
            DebugPrint(vehicle, speed, fuel)

            SendNUIMessage({
                display = true,
                speed = lib.math.floor(speed),
                fuel = lib.math.floor(fuel)
            })
        else
            SendNUIMessage({
                display = false
            })
        end
    end
end)

function DebugPrint(...)
    if Shared.debug then
        print(string.format("[%s] >> %s", GetCurrentResourceName(), table.concat({...}, " ")))
    end
end