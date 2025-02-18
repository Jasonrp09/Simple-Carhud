print("^5Carhud wurde gestartet^7")


CreateThread(function()
    while true do
        Wait(500)
        
        local playerPed = GetPlayerPedId()
        
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 3.6
            local fuel = GetVehicleFuelLevel(vehicle)
            DebugPrint(vehicle, speed, fuel)

            SendNUIMessage({
                display = true,
                speed = math.floor(speed),
                fuel = math.floor(fuel)
            })
        else
            SendNUIMessage({
                display = false
            })
        end
    end
end)


function DebugPrint(msg)
    if Shared.debug then
        string.format("[%s] >> %a", GetCurrentResourceName(), msg)
    end
end