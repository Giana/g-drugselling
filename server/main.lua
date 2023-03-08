local QBCore = exports['qb-core']:GetCoreObject()

local CopsCalled = false
local CachedPolice = {}

-- Functions --

function rollForNotifyingPolice(source, policeAlertChance)
    local src = source
    local notifyPoliceRoll = math.random(1, 100)
    if not CopsCalled and notifyPoliceRoll <= policeAlertChance then
        CopsCalled = true
        TriggerClientEvent('g-drugselling:client:policeAlert', src, Lang:t('info.police_alert'))
        Citizen.Wait(Config.CopCallCooldown * 1000)
        CopsCalled = false
    end
end

function rewardItems(source, items, itemNotificationsEnabled)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(items) do
        player.Functions.AddItem(v.name, v.amount)
        if itemNotificationsEnabled then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.name], 'add', v.amount)
        end
    end
end

-- Events --

RegisterNetEvent('g-drugselling:server:sellItems', function(sellLocationIndex, items, moneyType)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local itemNotificationsEnabled = Config.SellLocations[sellLocationIndex].itemNotificationsEnabled
    if CachedPolice[src] == nil then
        DropPlayer(src, "Exploiting")
        return
    end
    if Config.SellLocations[sellLocationIndex].sellAll then
        for k, v in pairs(items) do
            if player.Functions.RemoveItem(v.name, v.sellableQuantity) then
                Citizen.Wait(900)
                if v.price > 0 and not player.Functions.AddMoney(moneyType, v.price) then
                    player.Functions.AddItem(v.name, v.sellableQuantity)
                    goto skipItem
                end
                if itemNotificationsEnabled then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.name], 'remove', v.sellableQuantity)
                end
                if v.rewardItems and #v.rewardItems > 0 then
                    rewardItems(src, v.rewardItems, itemNotificationsEnabled)
                end
            end
            :: skipItem ::
        end
        rollForNotifyingPolice(src, Config.SellLocations[sellLocationIndex].policeAlertChance)
    else
        if player.Functions.RemoveItem(items[1].name, items[1].sellableQuantity) then
            Citizen.Wait(900)
            if items[1].price > 0 and not player.Functions.AddMoney(moneyType, items[1].price) then
                player.Functions.AddItem(items[1].name, items[1].sellableQuantity)
                return
            end
            if itemNotificationsEnabled then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[items[1].name], 'remove', items[1].sellableQuantity)
            end
            if items[1].rewardItems and #items[1].rewardItems > 0 then
                rewardItems(src, items[1].rewardItems, itemNotificationsEnabled)
            end
        end
        rollForNotifyingPolice(src, Config.SellLocations[sellLocationIndex].policeAlertChance)
    end
end)

-- Callbacks --

QBCore.Functions.CreateCallback('g-drugselling:server:getSellableItems', function(source, cb, sellLocationIndex)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local items = {}
    for k, v in pairs(Config.SellLocations[sellLocationIndex].sellable_items) do
        local hasItem = player.Functions.GetItemByName(k)
        if hasItem and hasItem.amount >= v.sell_quantity then
            local bundlesToSell = math.floor(hasItem.amount / v.sell_quantity)
            local sellableQuantity = bundlesToSell * v.sell_quantity
            local price = v.money_amount * bundlesToSell
            local item = {}
            local rewardItems = {}
            item.name = k
            item.sellableQuantity = sellableQuantity
            item.price = price
            for k2, v2 in pairs(v.item_rewards) do
                local rewardItem = {}
                rewardItem.name = k2
                rewardItem.amount = v2 * bundlesToSell
                table.insert(rewardItems, rewardItem)
            end
            item.rewardItems = rewardItems
            if item.price > 0 or (item.price == 0 and (item.rewardItems and #item.rewardItems > 0)) then
                table.insert(items, item)
            end
        end
    end
    cb(items)
end)

QBCore.Functions.CreateCallback('g-drugselling:server:getCopCount', function(source, cb)
    local src = source
    local policeCount = 0
    local amount = QBCore.Functions.GetDutyCount("police")
    CachedPolice[src] = amount
    cb(amount)
end)
