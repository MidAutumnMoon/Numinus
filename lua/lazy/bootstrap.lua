local stdpath = vim.fn.stdpath
local system = vim.fn.system
local fs_stat = vim.loop.fs_stat

local MainRepo = 'https://github.com/folke/lazy.nvim'
local InstallPath = stdpath( 'data' ) .. "/lazy/lazy.nvim"

-- if not fs_stat(InstallPath) then
--   system {
--     'git',
--     'clone',
--     '--depth', '1',
--     MainRepo,
--     InstallPath,
--   }
-- end

vim.opt.rtp:prepend( InstallPath )
