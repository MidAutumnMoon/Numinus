local api = vim.api

local utils = { }

utils.has_word_before = function()
    local line, col =
        unpack( api.nvim_win_get_cursor( 0 ) )
    return (
            col ~= 0
        and
            api.nvim_buf_get_lines(0, line - 1, line, true)[1]
                :sub(col, col)
                :match("%s") == nil 
        )
end


utils.visible_buffers = function()
    local buffers = {}
    for _, win in pairs( api.nvim_list_wins() ) do
        buffers[ api.nvim_win_get_buf(win) ] = true
    end
    return vim.tbl_keys( buffers )
end


return utils
