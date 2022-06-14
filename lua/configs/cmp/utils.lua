local utils = { }

local api = vim.api

utils.has_word_before = function()
    local line, col =
        unpack( api.nvim_win_get_cursor( 0 ) )

    return (
        col ~= 0
            and
        api.nvim_buf_get_lines(0, line - 1, line, true)[1]
            :sub(col, col)
            :match("%s") == nil )
end


return utils
