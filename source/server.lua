ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("dsco_fuel:pay", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneyType = 'money' -- 'money' si se deduce del banco, 'cash' si se deduce del efectivo

    if xPlayer then
        if moneyType == 'money' then
            xPlayer.removeAccountMoney('bank', math.floor(amount))
        else
            xPlayer.removeMoney(math.floor(amount))
        end

        TriggerClientEvent("chat:addMessage", source, {
            color = {0, 255, 0},
            args = {"Éxito", "Pagado: $" .. string.format("%.2f", amount) .. " por gasolina."}
        })
    end
end)

RegisterNetEvent("dsco_fuel:jerryCan", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.removeMoney(amount)

        TriggerClientEvent("chat:addMessage", source, {
            color = {0, 255, 0},
            args = {"Éxito", "Pagado: $" .. amount .. " por gasolina."}
        })
    end
end)
