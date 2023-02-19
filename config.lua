Config = {}

Config.CopCallCooldown = 60     -- Minimum seconds between cop calls for drug sales in server

Config.NpcRenderDistance = 60   -- Render distance for NPCs (if NPC enabled for any location)

--[[
    For each Config.SellLocations[x]:
    - active: If the sell location is active
        - Set to false to disable selling at this location (blip and marker, if enabled, will not appear on map or to players at all)
    - policeAlertChance: Percent chance police are alerted of selling
    - policeRequired: Amount of online police required to sell
    - notificationsEnabled: If notifications regarding selling are enabled
    - itemNotificationsEnabled: If notifications regarding items being removed from inventory are enabled
    - type: How location is approached by player to sell
        - Options:
            - 'walkup'
                - Player can sell if they walk up to coords
            - 'driveup'
                - Player can sell if they drive up to coords
            - 'any'
                - Player can sell if they walk or drive up to coords
            - 'target'
                - Player can sell if they target at coords
    - coords: Coordinates of selling point
    - blip:
        - enabled: If blip is enabled
        - label: Blip label
        - color: Blip color
        - sprite: Blip sprite
        - scale: Blip scale
        - display: Blip display
        - shortRange: If blip is short range
    - marker:
        - enabled: If marker is enabled
        - type: Marker type
        - scaleX: Marker scale on X axis
        - scaleY: Marker scale on Y axis
        - scaleZ: Marker scale on Z axis
        - red: Marker red component
        - green: Marker green component
        - blue: Marker blue component
        - alpha: Marker alpha component
        - bob: If marker bobs up and down
        - faceCamera: If marker constantly faces camera
    - npc:
        - enabled: If NPC is enabled
        - ped: NPC ped model
        - heading: NPC ped heading
        - scenario: NPC ped scenario
    - money_reward_type: Name of money type to reward
    - sellAll: If all sellable items are sold at once, otherwise just the first sellable item
    - sellable_items:
        - 'itemName': Name of item
            - sell_quantity: Amount to sell in increments of
            - money_amount: Amount of money to reward per sell_quantity
]]
Config.SellLocations = {
    [1] = {
        active = true,
        policeAlertChance = 15,
        policeRequired = 2,
        notificationsEnabled = false,
        itemNotificationsEnabled = true,
        type = 'walkup',
        coords = vector3(-352.83, 6231.16, 31.49),
        blip = {
            enabled = false,
            label = 'Weed Selling',
            color = 0,
            sprite = 51,
            scale = 0.6,
            display = 4,
            shortRange = true
        },
        marker = {
            enabled = false,
            type = 2,
            scaleX = 0.2,
            scaleY = 0.2,
            scaleZ = 0.1,
            red = 109,
            green = 255,
            blue = 0,
            alpha = 0.64,
            bob = false,
            faceCamera = false
        },
        npc = {
            enabled = false,
            ped = 's_m_y_xmech_02_mp',
            heading = 135.93,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        money_reward_type = 'cash',
        sellAll = true,
        sellable_items = {
            ['weed_white-widow'] = {
                sell_quantity = 5,
                money_amount = math.random(75, 120)
            },
            ['weed_skunk'] = {
                sell_quantity = 5,
                money_amount = math.random(75, 120)
            },
            ['weed_purple-haze'] = {
                sell_quantity = 5,
                money_amount = math.random(75, 120)
            },
            ['weed_og-kush'] = {
                sell_quantity = 5,
                money_amount = math.random(75, 120)
            },
            ['weed_amnesia'] = {
                sell_quantity = 5,
                money_amount = math.random(75, 120)
            },
            ['weed_brick'] = {
                sell_quantity = 10,
                money_amount = math.random(2000, 3000)
            }
        }
    },
    [2] = {
        active = true,
        policeAlertChance = 15,
        policeRequired = 2,
        notificationsEnabled = false,
        itemNotificationsEnabled = true,
        type = 'walkup',
        coords = vector3(1748.58, 3706.22, 34.2),
        blip = {
            enabled = false,
            label = 'Meth Selling',
            color = 0,
            sprite = 51,
            scale = 0.6,
            display = 4,
            shortRange = true
        },
        marker = {
            enabled = false,
            type = 2,
            scaleX = 0.2,
            scaleY = 0.2,
            scaleZ = 0.1,
            red = 109,
            green = 255,
            blue = 0,
            alpha = 0.64,
            bob = false,
            faceCamera = false
        },
        npc = {
            enabled = false,
            ped = 's_m_y_xmech_02_mp',
            heading = 286.2,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        money_reward_type = 'cash',
        sellAll = true,
        sellable_items = {
            ['meth'] = {
                sell_quantity = 5,
                money_amount = math.random(75, 120)
            }
        }
    },
    [3] = {
        active = true,
        policeAlertChance = 15,
        policeRequired = 2,
        notificationsEnabled = false,
        itemNotificationsEnabled = true,
        type = 'walkup',
        coords = vector3(906.92, -1932.72, 30.62),
        blip = {
            enabled = false,
            label = 'Crack Selling',
            color = 0,
            sprite = 51,
            scale = 0.6,
            display = 4,
            shortRange = true
        },
        marker = {
            enabled = false,
            type = 2,
            scaleX = 0.2,
            scaleY = 0.2,
            scaleZ = 0.1,
            red = 109,
            green = 255,
            blue = 0,
            alpha = 0.64,
            bob = false,
            faceCamera = false
        },
        npc = {
            enabled = false,
            ped = 's_m_y_xmech_02_mp',
            heading = 129.33,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        money_reward_type = 'cash',
        sellAll = true,
        sellable_items = {
            ['crack_baggy'] = {
                sell_quantity = 5,
                money_amount = math.random(90, 170)
            }
        }
    },
    [4] = {
        active = true,
        policeAlertChance = 15,
        policeRequired = 2,
        notificationsEnabled = false,
        itemNotificationsEnabled = true,
        type = 'walkup',
        coords = vector3(1144.53, -299.44, 68.81),
        blip = {
            enabled = false,
            label = 'Coke Selling',
            color = 0,
            sprite = 51,
            scale = 0.6,
            display = 4,
            shortRange = true
        },
        marker = {
            enabled = false,
            type = 2,
            scaleX = 0.2,
            scaleY = 0.2,
            scaleZ = 0.1,
            red = 109,
            green = 255,
            blue = 0,
            alpha = 0.64,
            bob = false,
            faceCamera = false
        },
        npc = {
            enabled = false,
            ped = 's_m_y_xmech_02_mp',
            heading = 97.09,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        money_reward_type = 'cash',
        sellAll = true,
        sellable_items = {
            ['cokebaggy'] = {
                sell_quantity = 5,
                money_amount = math.random(90, 185)
            },
            ['coke_brick'] = {
                sell_quantity = 10,
                money_amount = math.random(8500, 10000)
            }
        }
    }
}