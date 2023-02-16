Config = {}

--[[
    For each Config.SellLocations[x]:
    - active: If the sell location is active
        - Set to false to disable selling at this location (blip and marker, if enabled, will not appear on map or to players at all)
    - policeAlertChance: % chance police are alerted of selling
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
    - coords: Coordinated of the selling point
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
        - alpha: Marker alpha component:
        - bob: If marker bobs up and down
        - faceCamera: If marker constantly faces camera
    - npc:
        - enabled: If NPC is enabled
        - ped: NPC ped model
        - heading: NPC ped heading
        - scenario: NPC ped scenario
    - sellable_items:
        - 'itemName': Name of item
            - quantity: Amount to sell
            - reward_type: Reward type
            - reward_amount: Amount of reward
]]
Config.SellLocations = {
    [1] = {
        active = true,
        policeAlertChance = 15,
        type = 'walkup',
        coords = vector3(292.65, -1072.83, 28.41),
        blip = {
            enabled = false,
            label = 'Weed Selling',
            color = 0,
            sprite = 41,
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
            heading = 240.00,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        sellable_items = {
            ['weed_white-widow'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(75, 120)
            },
            ['weed_skunk'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(75, 120)
            },
            ['weed_purple-haze'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(75, 120)
            },
            ['weed_og-kush'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(75, 120)
            },
            ['weed_amnesia'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(75, 120)
            },
            ['weed_brick'] = {
                minimum_quantity = 10,
                reward_type = 'cash',
                reward_amount = math.random(2000, 3000)
            }
        }
    },
    [2] = {
        active = true,
        policeAlertChance = 15,
        type = 'walkup',
        coords = vector3(292.65, -1072.83, 28.41),
        blip = {
            enabled = false,
            label = 'Meth Selling',
            color = 0,
            sprite = 41,
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
            heading = 240.00,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        sellable_items = {
            ['meth'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(75, 120)
            }
        }
    },
    [3] = {
        active = true,
        policeAlertChance = 15,
        type = 'walkup',
        coords = vector3(292.65, -1072.83, 28.41),
        blip = {
            enabled = false,
            label = 'Crack Selling',
            color = 0,
            sprite = 41,
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
            heading = 240.00,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        sellable_items = {
            ['crack_baggy'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(90, 170)
            }
        }
    },
    [4] = {
        active = true,
        policeAlertChance = 15,
        type = 'walkup',
        coords = vector3(292.65, -1072.83, 28.41),
        blip = {
            enabled = false,
            label = 'Coke Selling',
            color = 0,
            sprite = 41,
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
            heading = 240.00,
            scenario = 'WORLD_HUMAN_AA_SMOKE',
        },
        sellable_items = {
            ['cokebaggy'] = {
                minimum_quantity = 5,
                reward_type = 'cash',
                reward_amount = math.random(90, 185)
            },
            ['coke_brick'] = {
                minimum_quantity = 10,
                reward_type = 'cash',
                reward_amount = math.random(8500, 10000)
            }
        }
    }
}