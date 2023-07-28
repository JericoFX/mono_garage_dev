---Transforma la sql a el Framework designado
---@param query string
---@return string
local function sqlConverter(query)
    local _query = query:gsub("{garage_sql}", Framework.db.table):gsub("{owner}", Framework.db.owner):gsub("{stored}",
        Framework.db.stored):gsub("{lastparking}", Framework.db.lastparking):gsub("{vehicle}", Framework.db.vehicle)
    :gsub("{stored}", Framework.db.stored):gsub("{pound}", Framework.db.pound):gsub("{parking}", Framework.db.parking)
    return _query
end

return sqlConverter
