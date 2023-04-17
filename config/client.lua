local options <const> = {
    {value = 'mazebank', label = "Maze Bank"},
    {value = 'weedfarm', label = "Weed Farm"},
    {value = 'methlab', label = "Meth Labs"}
}

return {
    command = {
        toggle = 's-tool:toggle', -- start / stop tool
        takeScreen = 'st'
    },

    input = {type = 'select', label = "Folder Name", options = options, required = true, icon = 'folder'}, -- or nil to set personnaly filename

    -- discord webhook, all is read and execute by client, please don't use this script on public server
    sbasic = 'https://discord.com/api/webhooks/1037204560680329326/HYaU-', -- set webhook for screenshot-basic can upload
    upload = 'https://discord.com/api/webhooks/1097364672501514293/' -- set webhook to upload with title + description
}