

ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
    end 
end)  


------
--job
------
local job = false
local job2 = false





-------------------------
--RECORRIDO DE MOTOCROSS
-------------------------

Citizen.CreateThread(function()
    SpawnNPC('u_m_m_streetart_01', vector4( 2016.86, 4987.82, 41.1, 130.49))
     while true do
        local _sleep = 1000
        local _char = PlayerPedId()
        local _charPos = GetEntityCoords(_char)
            if #(_charPos - vector3( 2016.86, 4987.82, 41.1)) < 2 then
                _sleep = 0 
            if job == true or job2 == true then
                Create3D( vector3( 2016.86, 4987.82, 42.1), '~b~Ya estás una actividad, terminala primero')
            else
                Create3D( vector3( 2016.86, 4987.82, 42.1), 'Pulsa ~r~[E]~w~ para empezar la actividad')
                if IsControlJustPressed(0, 38) then
            ESX.Game.SpawnVehicle('bf400', vector3(2008.56, 4986.53, 41.41), 221.69, function(veh)
            exports['LegacyFuel']:SetFuel(veh, 100)
            TaskWarpPedIntoVehicle(_char, veh, -1)
                end)
                blip = AddBlipForCoord(vector3(2195.99, 5607.07, 53.53))
                SetBlipRoute(blip, true)
                job = true  
            end
        end
    end
        if job == true then 
            if #(_charPos - vector3( 2195.99, 5607.07, 53.53)) < 2 then
                _sleep = 0 
                Create3D( vector3( 2195.99, 5607.07, 53.53), 'Pulsa ~r~[E]~w~ entregar la moto.')
                if IsControlJustPressed(0, 38) then
                RemoveBlip(blip)
                SetBlipRoute(blip, false)
                blip2 = AddBlipForCoord(vector3(2008.56, 4986.53, 41.41))
                SetBlipRoute(blip2, true)
                job = false
                job2 = true
                end
            end
        end
        if job2 == true then
                if #(_charPos - vector3(2008.56, 4986.53, 41.41)) < 2 then   
                    _sleep = 0 
                    Create3D( vector3(2008.56, 4986.53, 41.41), 'Pulsa ~r~[E]~w~ entregar la moto.')   
                    if IsControlJustPressed(0, 38) then
                    DeleteVehicle(GetVehiclePedIsIn(_char))
                    RemoveBlip(blip2)
                    SetBlipRoute(blip2, false)
                    job = false
                    job2 = false
                    end
                end
           end
        Citizen.Wait(_Sleep)
    end
end)