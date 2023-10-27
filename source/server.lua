if config.framework == "ESX" then
    FRWORK = exports["es_extended"]:getSharedObject()
elseif config.framework == "QB" then
    FRWORK = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent("dsco_fuel:pay", function(amount)
    local moneyType = config.moneytype
    if config.framework == "ESX" then
        local xPlayer = FRWORK.GetPlayerFromId(source)
        
        if xPlayer then
           if moneyType == 'bank' then
               xPlayer.removeAccountMoney('bank', math.floor(amount))
            elseif moneyType == 'money' then
                xPlayer.removeMoney(math.floor(amount))
            else
                print("Error in money account")
            end

            xPlayer.showNotification(msg)
        end
    elseif config.framework == "QB" then
        local Player = FRWORK.Functions.GetPlayer(source) -- Obtén al jugador actual

if Player then
    if moneyType == 'bank' then
        Player.Functions.RemoveMoney('bank', math.floor(amount))
    elseif moneyType == 'money' then
        Player.Functions.RemoveMoney('cash', math.floor(amount))
    else
        print("Error en el tipo de dinero")
    end

    TriggerClientEvent("chat:addMessage", source, {
        color = {0, 255, 0},
        args = {"Éxito", "Pagado: $" .. string.format("%.2f", amount) .. " por gasolina."}
    })
end

end

end)

RegisterNetEvent("dsco_fuel:jerryCan", function(amount)
    if config.framework == "ESX" then
        local xPlayer = FRWORK.GetPlayerFromId(source)

        if xPlayer then
            xPlayer.removeMoney(amount)
            xPlayer.addInventoryItem('WEAPON_PETROLCAN', 1)

            TriggerClientEvent("chat:addMessage", source, {
                color = {0, 255, 0},
                args = {"Éxito", "Pagado: $" .. amount .. " por gasolina."}
            })
        end
    elseif config.framework == "QB" then
        local Player = FRWORK.Functions.GetPlayer(source)
        if Player then
            Player.Functions.RemoveMoney("cash", amount)

            TriggerClientEvent("chat:addMessage", source, {
                color = {0, 255, 0},
                args = {"Éxito", "Pagado: $" .. amount .. " por gasolina."}
            })
        end
    end
end)

RegisterNetEvent("dsco_fuel:removeJerryCan", function()
    if config.framework == "QB" then
        local xPlayer = FRWORK.Functions.GetPlayer(source)
        if xPlayer then
            xPlayer.Functions.RemoveItem('WEAPON_PETROLCAN', 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['WEAPON_PETROLCAN'], "remove")
        end
    end
    if config.framework == "ESX" then
        local xPlayer = FRWORK.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.removeInventoryItem("WEAPON_PETROLCAN", 1)
        end
    end
end)
