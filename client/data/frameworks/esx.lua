local Await = Citizen.Await

Framework.Functions = {}
function Framework.Functions.GetProps(vehicle)
    return Framework.Core.Game.GetVehicleProperties(vehicle)
end

function Framework.Functions.GetJob()
    return Framework.Player.PlayerData.job.name
end

function Framework.Functions.SpawnPoint(pos, radius)
    return Framework.Core.Game.IsSpawnPointClear(pos, radius or 2.0)
end

function Framwork.Functions.GetAllVehicles()
    return Framework.Core.Game.GetVehicles()
end

function Framework:GetData()
    Framework.Player = Framework.Core.GetPlayerData()
end

function Framework:GetJobEvent(cb)
    local p = promise.new()
    RegisterNetEvent('esx:setJob', function(job)
        p:resolve(job)
        return cb(Await(p).name)
    end)
end

return Framework.Functions
