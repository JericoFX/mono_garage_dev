Framework.Functions = {}

function Framework.Functions.GetPlayer(source)
    return Framework.Core.Functions.GetPlayer(source)
end

function Framework.Functions.GetPlayerID(source)
    return Framework.Functions.GetPlayer(source).PlayerData.citizenid
end

function Framework.Functions.GetName(source)
    local fullname = ("%s %s"):format(Framework.Core.GetPlayer(source).PlayerData.charinfo.firstname,
        Framework.Core.Functions.GetPlayer(source).PlayerData.charinfo.lastname)
    return fullname
end

function Framework.Functions.GetSource(source)
    local player = Framework.Core.Functions.GetPlayer(source)
    return player.PlayerData.source
end

function Framework.Functions.GetMoney(source)
    local player = Framework.Core.Functions.GetPlayer(source)
    return {
        bank = player.PlayerData.money.bank,
        money = player.PlayerData.money.cash
    }
end

function Framework.Functions.RemoveMoney(source, money, where)
    local player = Framework.Core.Functions.GetPlayer(source)
    if player.PlayerData.money[where] >= money then
        player.Functions.RemoveMoney(where, money)
    else
        return false
    end
end

function Framework.Functions.GetJob(source)
    local player = Framework.Core.Functions.GetPlayer(source).job.name
    return player
end

function Framework.Functions.SpawnVehicle(source, model, pos, hea, vehicleProps, warp)
    local coords = vector4(pos.x, pos.y, pos.z, hea)
    return Framework.Core.Functions.CreateVehicle(source, model, "automobile", coords, warp)
end

return Framework.Functions
