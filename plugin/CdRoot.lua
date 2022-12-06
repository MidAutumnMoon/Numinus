local RootMarkers = {

  "README",
  "README.md",

  ".git",

  "flake.nix",
  "shell.nix",

  "Cargo.toml",

  ".root",

}

local Common = require 'teapot.common'
local ExcludedFt = Common.ExcludedFiletypes

local CdMethod = "tcd"


--
-- Implementations
--

local create_autocmd = vim.api.nvim_create_autocmd
local buf_get_name = vim.api.nvim_buf_get_name

local parents = vim.fs.parents
local fs_stat = vim.loop.fs_stat
local path_join = require 'neo-tree.utils' .path_join


-- A buffer is legit when it's not a special
-- buffer and its filetype is not in ExcludedFt list.
local function buffer_legit( bufnr )
  local buffer = vim.bo[bufnr]
  local buffer_normal = buffer.buftype == ""
  local buffer_allowed = not vim.tbl_contains( ExcludedFt, buffer.ft )
  return buffer_normal and buffer_allowed
end


-- Check if $fold contains one of the RootMarkers.
-- Filetype of markers are not checked.
local function contain_marker( folder )
  local state = fs_stat( folder )
  if state == nil or state.type ~= "directory" then
    return false
  end
  for _, marker in pairs( RootMarkers ) do
    if fs_stat( path_join( folder, marker ) ) ~= nil then
      return true
    end
  end
  -- end slops are just ugly
end


-- Iterate the parents of current buffer
-- and cd to the one which contains a root marker.
local function callback( callback_opts )
  local bufnr = callback_opts.buf
  if not buffer_legit( bufnr ) then
    return false
  end
  for parent in parents( buf_get_name( bufnr ) ) do
    if contain_marker( parent ) then
      vim.cmd( CdMethod .. " " .. parent )
      -- callback can't return true as
      -- it removes the whole autocmd :(
      return false
    end
  end
  -- end end slops
end

create_autocmd ( "BufEnter", { callback = callback } )
