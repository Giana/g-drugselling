-- Threads --

-- Walk up & drive up
Citizen.CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local inRange = false
            for k, v in pairs(Config.SellLocations) do
                if v.active then
                    local dist = #(pos - v.coords)
                    if dist < 10 then
                        if v.marker.enabled then
                            if (v.type == 'walkup' and not IsPedInAnyVehicle(ped, false)) or (v.type == 'driveup' and IsPedInAnyVehicle(ped, false)) or v.type == 'any' or v.type == 'target' then
                                DrawMarker(v.marker.type, v.coords.x, v.coords.y, v.coords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.marker.scaleX, v.marker.scaleY, v.marker.scaleZ, v.marker.red, v.marker.green, v.marker.blue, v.marker.alpha, v.marker.bob, v.marker.faceCamera, 0, 1, 0, 0, 0)
                            end
                        end
                        if dist < 1.5 then
                            if (v.type == 'walkup' and not IsPedInAnyVehicle(ped, false)) or (v.type == 'driveup' and IsPedInAnyVehicle(ped, false)) or v.type == 'any' then
                                TriggerServerEvent('g-drugselling:server:sell', v)
                            end
                        end
                        inRange = true
                    end
                end
            end
            if not inRange then
                Citizen.Wait(2000)
            end
        end
        Citizen.Wait(3)
    end
end)