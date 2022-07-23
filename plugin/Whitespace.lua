local filetype_blacklist = {
}

local trim_cmd =
    [[keepjumps keeppatterns silent! %s/\s\+$//e]]

local trimming = function()
    local saved = vim.fn.winsaveview()
    if not vim.tbl_contains( filetype_blacklist, vim.bo.filetype )
        and vim.bo.modifiable
    then
        vim.api.nvim_exec( trim_cmd, false )
    end
    vim.fn.winrestview( saved )
end

vim.keymap.set( 'n', '<LocalLeader>b', trimming, { silent = true; } )

vim.api.nvim_create_autocmd( 'ExitPre', {
    pattern = '*',
    callback = trimming
} )

