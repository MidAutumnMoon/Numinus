local Utils = {}

Utils.gitsigns_source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

Utils.encoding_besides_u8 = function()
    return vim.o.encoding ~= 'utf-8'
end

Utils.fileformat_besides_unix = function()
    return vim.bo.fileformat ~= 'unix'
end


return Utils
