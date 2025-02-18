print("^5Carhud wurde gestartet^7")


ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- HUD anzeigen, wenn im Fahrzeug
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Überprüft jede halbe Sekunde, ob der Spieler im Fahrzeug ist
        
        local playerPed = GetPlayerPed(-1)
        
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 3.6 -- Geschwindigkeit in km/h
            local fuel = GetVehicleFuelLevel(vehicle) -- Tankfüllstand

            -- HUD anzeigen und Daten senden
            SendNUIMessage({
                display = true,  -- HUD anzeigen
                speed = math.floor(speed),
                fuel = math.floor(fuel)
            })
        else
            -- HUD ausblenden, wenn nicht im Fahrzeug
            SendNUIMessage({
                display = false  -- HUD ausblenden
            })
        end
    end
end)
