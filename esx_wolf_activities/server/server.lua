ESX = nil 

  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


print("Script Created by Fst Wolf 7.#0001")

-- Check resource name.
if GetCurrentResourceName() ~= "esx_wolf_activities" then
    print("Error: Change the resource name to \"esx_wolf_activities\" or it won't work!")
end

--AÑADIDA ACTIVIDAD DE MOTOCROSS
    local user = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx:showNotification',source, 'Has entregado la moto, aquí tienes tu recompensa.')
end)

---------------
--Discord Log
---------------
function sendToDiscord(weebhook, msg)
    local discord = weebhook
    if discord~=nil then
        PerformHttpRequest(discord, function(a,b,c)end, "POST", json.encode({embeds={{title="Wolf Logs",description=msg,color=10181046,}}}), {["Content-Type"]="application/json"})
    end
end