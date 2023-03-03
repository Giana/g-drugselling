fx_version 'cerulean'

game 'gta5'

author 'Giana - github.com/Giana'
description 'g-drugselling'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/target.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'qb-core',
    'qb-inventory',
    'qb-target'
}

lua54 'yes'