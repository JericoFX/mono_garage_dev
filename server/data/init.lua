--Convertir todo a una metatabla con OOP
--SERVIDOR

Framework = setmetatable({}, {
    __newindex = function(self, key, value)
        rawset(self, key, value)
    end,
    __index = function(self, value)
        return rawget(self, value)
    end
})


Framework.sqlConverter = require "server.data.db"

---Load the corresponding Core
function Framework:Init()
    if GetResourceState("qb-core") == "started" then
        Framework.Core = exports["qb-core"]:GetCoreObject()
        Framework.db = {
            table = "player_vehicles",
            parking = "garage",
            owner = "citizenid",
            mileage = "drivingdistance",
            vehicle = "mods",
            stored = "state",
            pound = "state",
            lastparking = "lastparking",
            infoimpound = "infoimpound",
        }
        Framework.CoreName = "qb"
        require "server.data.framework.qb"
    end
    if GetResourceState("es_extended") == "started" then
        Framework.Core = exports["es_extended"]:getSharedObject()
        Framework.db = {
            table = "owned_vehicles",
            parking = "garage",
            owner = "owner",
            mileage = "mileage",
            vehicle = "vehicle",
            stored = "stored",
            pound = "pound",
            lastparking = "lastparking",
            infoimpound = "infoimpound",
        }
        Framework.CoreName = "esx"
        require "server.data.framework.qb"
        print("IS ESX")
    end
end

MySQL.ready(function()
    local query = [[CREATE TABLE IF NOT EXISTS `mono_garage` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `owner` VARCHAR(50) DEFAULT NULL,
            `vehiculo` VARCHAR(30),
            `hash` VARCHAR(30),
            `mods` LONGTEXT NOT NULL,
            `placa` VARCHAR(30),
            `garage` VARCHAR(30),
            `state` TINYINT(3) DEFAULT 0,
            `depotprice` DECIMAL(10, 2),
            `amigos` longtext DEFAULT NULL,
            `lastparking` longtext DEFAULT NULL,
            `lastposition` longtext DEFAULT NULL,
            `calle` tinyint(4) DEFAULT NULL,
            `infoimpound` longtext DEFAULT NULL,
            `pound` tinyint(1) DEFAULT 0,
            PRIMARY KEY (`id`)
          );]]
    local createDatabase = MySQL.insert.await(query)
    if #createDatabase >= 1 then
        print("^3 [Mono_Garage]: ¡Database Created!")
    end
end)

Framework:Init()
