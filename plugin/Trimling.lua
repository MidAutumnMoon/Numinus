local ExcludedName = {
  -- empty for no file
  "",
  "all-packages.nix"
}

local Common = require 'teapot.common'


--
-- Implementations
--

local tbl_contains = vim.tbl_contains

local buf_get_name = vim.api.nvim_buf_get_name
local basename = vim.fs.basename


local function buffer_legit( bufnr )
  local options = vim.bo[bufnr]
  local name = basename( buf_get_name( bufnr ) )
  return options.modifiable
    and not tbl_contains( Common.ExcludedFiletypes, options.ft )
    and not tbl_contains( ExcludedName, name )
end


local function trim()
  local saved = vim.fn.winsaveview()
  vim.cmd [[
    keepjumps keeppatterns silent! %s/\s\+$//e
  ]]
  vim.fn.winrestview( saved )
end


vim.keymap.set( "n", "<LocalLeader>\\", function()
  trim()
end )


local function callback( callback_opts )
  if buffer_legit( callback_opts.buf ) then
    trim()
  end
end

vim.api.nvim_create_autocmd( {
  "ExitPre",
  "BufLeave",
  "BufReadPost"
}, {
  pattern = "*",
  callback = callback
} )
