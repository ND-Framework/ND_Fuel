NDCore = exports["ND_Core"]:GetCoreObject()
-- NDCore.Functions.VersionChecker("ND_Fuel", GetCurrentResourceName(), "https://github.com/ND-Framework/ND_Framework", "https://raw.githubusercontent.com/ND-Framework/ND_Framework/main/ND_Fuel/fxmanifest.lua")

RegisterNetEvent("ND_Fuel:pay", function(amount)
    local player = source
    NDCore.Functions.DeductMoney(math.floor(amount), player, "bank")
    if GetResourceState("ModernHUD") == "started" then
        TriggerClientEvent("ND_Fuel:modernpay", player, amount)
    else
        TriggerClientEvent("chat:addMessage", player, {
            color = {0, 255, 0},
            args = {"Success", "Paid: $" .. string.format("%.2f", amount) .. " for gas."}
        })
    end
end)

RegisterNetEvent("ND_Fuel:jerryCan", function(amount)
    local player = source
    NDCore.Functions.DeductMoney(amount, player, "cash")
    if GetResourceState("ModernHUD") == "started" then
        TriggerClientEvent("ND_Fuel:modernpay", player, amount)
    else
        TriggerClientEvent("chat:addMessage", player, {
            color = {0, 255, 0},
            args = {"Success", "Paid: $" .. amount .. " for gas."}
        })
    end
end)

if GetResourceState("ModernHUD") == "started" then
    RegisterNetEvent("ND_Fuel:modernpay", function(amount)
        local player = source
        NDCore.Functions.DeductMoney(math.floor(amount), player, "bank")
        TriggerClientEvent("ND_Fuel:notify", player, string.format("Paid: $%.2f for gas", amount))
    end)
end
