local availableActions = {}


local sonesrar = 1

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.CudiTuglaToplama[sonesrar].x, Config.CudiTuglaToplama[sonesrar].y, Config.CudiTuglaToplama[sonesrar].z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.CudiTuglaToplama[sonesrar].x, Config.CudiTuglaToplama[sonesrar].y, Config.CudiTuglaToplama[sonesrar].z, true)
        if dst2 < 4 then
            sleep = 2
            DrawMarker(2, Config.CudiTuglaToplama[sonesrar].x, Config.CudiTuglaToplama[sonesrar].y, Config.CudiTuglaToplama[sonesrar].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
            DrawText3Ds(Config.CudiTuglaToplama[sonesrar].x, Config.CudiTuglaToplama[sonesrar].y, Config.CudiTuglaToplama[sonesrar].z + 0.3, '[E] Tuğla Topla')
            if dst2 < 1 then
                if IsControlJustReleased(0, 38) then
                    sonesrar = math.random(1, #Config.CudiTuglaToplama)
                    esrartopla()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)


function esrartopla()
    if not topluyormu then
        topluyormu = true
        exports['progressbar']:Progress({
            name = "esrartopla",
            duration = 3000,
            label = 'Tuğla Topluyorsun',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('cuditugla')
                topluyormu = false
            else
            end
        end)
    end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end