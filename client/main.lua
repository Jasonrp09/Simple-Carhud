print("^5Carhud wurde gestartet^7")


CreateThread(function()
    while true do
        Wait(500)
        
        local playerPed = GetPlayerPedId()
        
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 3.6
            local fuel = GetVehicleFuelLevel(vehicle)

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
