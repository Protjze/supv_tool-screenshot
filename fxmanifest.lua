fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'SUP2Ak#3755'
description 'tool-screenshot'

version '1.0'

files {
    'config/client.lua'
}

client_scripts {
    '@ox_lib/init.lua',
    '@supv_core/import.lua',
    'client.lua'
}

depandencies {
    'screenshot-basic',
    'ox_lib',
    'supv_core'
}