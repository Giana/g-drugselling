for k, v in pairs(Config.SellLocations) do
    if Config.SellLocations[k].active and Config.SellLocations[k].type == 'target' then
        exports['qb-target']:AddBoxZone(Config.SellLocations[k].blip.label, Config.SellLocations[k].coords, 2.5, 2.5, {
            name = Config.SellLocations[k].blip.label,
            heading = 0,
            debugPoly = false,
            minZ = Config.SellLocations[k].coords.z - 1,
            maxZ = Config.SellLocations[k].coords + 1,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'g-drugselling:client:registerTarget',
                    icon = 'fas fa-pills',
                    label = Lang:t('other.target_label'),
                },
            },
            distance = 2
        })
    end
end