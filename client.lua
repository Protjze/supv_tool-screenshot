if not lib then return end
if not supv then return end

print('tool-screenshot is ready!')

local tool, sbasic <const>, cfg <const> = false, exports['screenshot-basic'], require 'config.client'

local function StartToolThread()
    tool = true

    local list = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22}

    CreateThread(function()
        local sleep
        while tool do
            sleep = 500
            for i = 1, #list do
                local l = list[i]
                if IsHudComponentActive(l) then sleep = 0
                    HideHudComponentThisFrame(l)
                end
            end
            Wait(sleep)
        end
    end)

    CreateThread(function()
        while tool do
            Wait(2000)
            InvalidateIdleCam()
		    InvalidateVehicleIdleCam()
        end
    end)
end

RegisterCommand(cfg.command.toggle, function()
    if not tool then
        lib.notify({
            title = 'tool-screenshot',
            description = 'Tool is started',
            type = 'inform'
        })
        DisplayRadar(false)
        StartToolThread()
    else
        tool = false
        DisplayRadar(true)
        lib.notify({
            title = 'tool-screenshot',
            description = 'Tool is stopped!',
            type = 'inform'
        })
    end
end)

RegisterCommand(cfg.command.takeScreen, function()
    if not tool then
        lib.notify({
            title = 'tool-screenshot',
            description = 'You need to turn on this tool',
            type = 'error'
        })
        return
    end
    local input = lib.inputDialog('tool-screenshot', {
        cfg.input,
        {type = 'input', label = 'image name', description = 'example: mb_helipad', icon = 'image', required = true}
    })
    if not input then return end
    input[2] = (input[2]):gsub(' ', '_')
    sbasic:requestScreenshotUpload(cfg.sbasic, 'files[]', {encoding = 'png'}, function(data)
        local resp = json.decode(data)
        supv.webhook.embed(cfg.upload, {title = input[1] or '', description = input[2] or '', url = resp.attachments[1].proxy_url})
    end)
end)