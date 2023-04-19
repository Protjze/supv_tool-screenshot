local options <const> = {
    ['ipl'] = {
        {value = 'mazebank', label = "Maze Bank"},
        {value = 'weedfarm', label = "Weed Farm"},
        {value = 'methlab', label = "Meth Labs"}, 
        {value = 'richards_majectic', label = "Richards Majestic"},-- Richards Majestic
    },

    ['vehicle'] = {
        {value = 'bike', label = 'Moto'},
        {value = 'sports', label = 'Sports'},
        {value = 'classic', label = "Classic"},
    },

    ['props'] = {
        {value = 'furnitures', label = "Meubles"},
        {value = 'chairs', label = "Chaises"}
    }
}

local used <const> = 'ipl'

return {
    command = {
        toggle = 's-tool:toggle', -- start / stop tool
        takeScreen = 'st'
    },

    input = {type = 'select', label = "Folder Name", options = options[used], required = true, icon = 'folder'}, -- or nil to set personnaly filename

    -- discord webhook, all is read and execute by client, please don't use this script on public server
    sbasic = 'https://discord.com/api/webhooks/1098038830378012683/3xicgMg82BdFAiW1snOwNwCHlUe2cnistvvf4H2AdHwBqDt2Kbjw6oDJuBWwfYOpdL7G', -- set webhook for screenshot-basic can upload
    upload = 'https://discord.com/api/webhooks/1098038895226146846/piIi20ZwSId_cX4hNUmR_1DJ3m7YpgMYJlUrmW2fgF0dEfwhQYZh2AZFgfrTD4ssEeaK' -- set webhook to upload with title + description
}