local QBCore = exports['qb-core']:GetCoreObject()

-- Events --

RegisterNetEvent('g-drugselling:server:sell', function(sellLocation)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(sellLocation.sellable_items) do
        local hasItem = player.Functions.GetItemByName(k)
        if hasItem then
            if hasItem.amount >= v.sell_quantity then
                local bundlesToSell = math.floor(hasItem.amount / v.sell_quantity)
                local quantityToSell = bundlesToSell * v.sell_quantity
                if player.Functions.RemoveItem(k, quantityToSell) then
                    for k2, v2 in pairs(v.rewards) do
                        local isMoneyType = false
                        for k3, v3 in pairs(QBConfig.Money.MoneyTypes) do
                            if tostring(k3) == k2 then
                                isMoneyType = true
                            end
                        end
                        if isMoneyType then
                            if not player.Functions.AddMoney(k2, v2) then
                                player.Functions.AddItem(k, quantityToSell)
                                return
                            end
                        else
                            if not player.Functions.AddItem(k2, v2) then
                                player.Functions.AddItem(k, quantityToSell)
                                return
                            end
                            if sellLocation.itemNotificationsEnabled then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[k2], 'add', v2)
                            end
                        end
                    end
                    local notifyPoliceRoll = math.random(1, 100)
                    if notifyPoliceRoll <= sellLocation.policeAlertChance then
                        TriggerServerEvent('police:server:policeAlert', Lang:t('info.police_alert'))
                    end
                end
            else
                if sellLocation.notificationsEnabled then
                    TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough', { itemLabel = QBCore.Shared.Items[k]['label'] }), 'error')
                end
            end
        end
    end
end)