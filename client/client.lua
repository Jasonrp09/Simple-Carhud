print("^5Carhud wurde gestartet^7")

CreateThread(function()
    while true do
        Wait(Shared.Smoothness.Wait)

        local playerPed = cache.ped

        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 3.6
            local fuel = GetVehicleFuelLevel(vehicle)
            Shared.Debug.Print(vehicle, speed, fuel)

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