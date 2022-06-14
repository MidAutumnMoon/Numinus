--
-- QuitWithSession.lua
--
--    Save a session file automatically when exit Neovim.
--
-- - let g:quit_with_session = 1 to activate this plugin,
--   intended to be used with .exrc
--


if vim.g.quit_saving_session ~= 1 then
    return
end


local cwd = vim.fn.getcwd()

local quit_with_session = function()
    vim.cmd 'wall'
    vim.cmd ('mksession!' .. ' ' .. cwd .. '/Session.teapot.vim')
    vim.cmd 'qall'
end

vim.keymap.set( 'n', '<Leader>q', quit_with_session, { silent = true } )
