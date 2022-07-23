--
-- QuitWithSession.lua
--
--    Save a session file automatically when exit Neovim.
--
-- used variables:
--  - quit_saving_session
--  - quit_saving_session_fname
--


if vim.g.quit_saving_session ~= 1 then
    return
end


local session_file_name =
    vim.g.quit_saving_session_fname or 'Session.vim'

local session_file_path =
    vim.fn.getcwd() .. '/' .. session_file_name

local make_session = function()
    vim.cmd ( 'mksession!' .. ' ' .. session_file_path )
end

vim.api.nvim_create_autocmd( 'ExitPre', {
    pattern = '*',
    callback = make_session
} )
