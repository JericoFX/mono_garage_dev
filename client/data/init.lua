Framework = setmetatable({}, {
    __newindex = function(self, key, value)
        rawset(self, key, value)
    end,
    __index = function(self, value)
        return rawget(self, value)
    end
})
function Framework:Init()
    if GetResourceState("qb-core") == "started" then
        Framework.Core = exports["qb-core"]:GetCoreObject()
        require "client.data.frameworks.qb"
        print("IS QB")
        Framework:GetData()
        return
    end
    if GetResourceState("es_extended") == "started" then
        Framework.Core = exports["es_extended"]:getSharedObject()
        require "client.data.frameworks.esx"
        print("IS ESXX")
        Framework:GetData()
        return
    end
end

Framework:Init()
