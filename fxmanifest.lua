fx_version 'cerulean'

game 'gta5'

author 'Giana - github.com/Giana'
description 'g-drugselling'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'qb-core',
    'qb-target'
}

lua54 'yes'