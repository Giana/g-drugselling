local QBCore = exports['qb-core']:GetCoreObject()

local IsSelling = false
local Peds = {}

-- Functions --

function createPed(hash, ...)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(100)
    end
    local ped = CreatePed(26, hash, ...)
    SetModelAsNoLongerNeeded(hash)
    return ped
end

function createClientNpc(index)
    if (Peds[index]) then
        deleteClientNpc(index)
    end
    Peds[index] = {}
    local location = Config.SellLocations[index]
    local ped = createPed(location.npc.ped, location.coords.x, location.coords.y, location.coords.z - 0.97, location.npc.heading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, location.npc.heading)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    Peds[index].npc = ped
end

function deleteClientNpc(index)
    if (Peds[index]) then
        DeleteEntity(Peds[index].npc)
        Peds[index] = nil
    end
end

function attemptSell(sellLocationIndex)
    local notificationsEnabled = Config.SellLocations[sellLocationIndex].notificationsEnabled
    if IsSelling then
        return
    end
    IsSelling = true
    QBCore.Functions.TriggerCallback('g-drugselling:server:getCopCount', function(copCount)
        if copCount >= Config.SellLocations[sellLocationIndex].policeRequired then
            QBCore.Functions.TriggerCallback('g-drugselling:server:getSellableItems', function(sellableItems)
                if sellableItems and #sellableItems > 0 then
                    if notificationsEnabled then
                        QBCore.Functions.Notify(Lang:t('info.selling'))
                    end
                    TriggerServerEvent('g-drugselling:server:sellItems', sellLocationIndex, sellableItems, Config.SellLocations[sellLocationIndex].money_reward_type)
                    Citizen.Wait(10000)
                    IsSelling = false
                else
                    if notificationsEnabled then
                        QBCore.Functions.Notify(Lang:t('error.not_enough'))
                    end
                    Citizen.Wait(10000)
                    IsSelling = false
                end
            end, sellLocationIndex)
        else
            if notificationsEnabled then
                QBCore.Functions.Notify(Lang:t('error.cannot_sell'))
            end
            Citizen.Wait(20000)
            IsSelling = false
        end
    end)
end

-- Events --

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        IsSelling = false
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for k, v in pairs(Peds) do
            deleteClientNpc(k)
        end
    end
end)

RegisterNetEvent('g-drugselling:client:registerTarget', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    for k, v in pairs(Config.SellLocations) do
        local dist = #(pos - v.coords)
        if dist < 2 then
            attemptSell(k)
            break
        end
    end
end)

RegisterNetEvent('g-drugselling:client:policeAlert', function(message)
    TriggerServerEvent('police:server:policeAlert', message)
end)

-- Threads --

-- Blip setup
Citizen.CreateThread(function()
    for k, v in pairs(Config.SellLocations) do
        if v.active and v.blip.enabled then
            local locationBlip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipColour(locationBlip, v.blip.color)
            SetBlipSprite(locationBlip, v.blip.sprite)
            SetBlipScale(locationBlip, v.blip.scale)
            SetBlipDisplay(locationBlip, v.blip.display)
            SetBlipAsShortRange(locationBlip, v.blip.shortRange)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(v.blip.label)
            EndTextCommandSetBlipName(locationBlip)
        end
    end
end)

-- NPC ped setup
Citizen.CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local inRange = false
            for k, v in pairs(Config.SellLocations) do
                if v.active and v.npc.enabled then
                    local dist = #(pos - v.coords)
                    if dist < Config.NpcRenderDistance then
                        if not Peds[k] then
                            createClientNpc(k)
                        end
                        inRange = true
                    elseif Peds[k] then
                        deleteClientNpc(k)
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
                    if dist < 20 then
                        if v.marker.enabled then
                            if (v.type == 'walkup' and not IsPedInAnyVehicle(ped, false)) or (v.type == 'driveup' and IsPedInAnyVehicle(ped, false)) or v.type == 'any' or v.type == 'target' then
                                DrawMarker(v.marker.type, v.coords.x, v.coords.y, v.coords.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.marker.scaleX, v.marker.scaleY, v.marker.scaleZ, v.marker.red, v.marker.green, v.marker.blue, v.marker.alpha, v.marker.bob, v.marker.faceCamera, 0, 1, 0, 0, 0)
                            end
                        end
                        if dist < 2 then
                            if (v.type == 'walkup' and not IsPedInAnyVehicle(ped, false)) or (v.type == 'driveup' and IsPedInAnyVehicle(ped, false)) or v.type == 'any' then
                                if not IsSelling then
                                    attemptSell(k)
                                end
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