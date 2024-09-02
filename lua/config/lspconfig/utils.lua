local M = {}


local Keymaps = {
  ["gd"] = vim.lsp.buf.definition,
  ["gi"] = vim.lsp.buf.implementation,
  ["gD"] = vim.lsp.buf.declaration,
  ["gr"] = vim.lsp.buf.references,
  ["<F2>"] = vim.lsp.buf.rename,
  ["K"] = vim.lsp.buf.hover,
  ["]d"] = vim.diagnostic.goto_next,
  ["[d"] = vim.diagnostic.goto_prev,
}

local function setup_keymap( bufnr )
  local keyopt = {
    silent = true,
    buffer = bufnr,
  }
  for key, map in pairs( Keymaps ) do
    vim.keymap.set( "n", key, map, keyopt )
  end
end

-- local function float_diagnostic( bufnr )
--   vim.api.nvim_create_autocmd( "CursorHold", {
--     buffer = bufnr,
--     callback = function( info )
--       vim.diagnostic.open_float {
--         focus = false,
--         focusable = false,
--       }
--     end
--   } )
-- end


M.lsp_setup = function( lsp, overrides )
  local cmp_nvim_lsp = require "cmp_nvim_lsp"

  local caps = cmp_nvim_lsp.default_capabilities()
  caps.textDocument.completion.completionItem.snippetSupport = false

  local defaults = {
    capabilities = caps,
    on_attach = function( client, bufnr )
      setup_keymap( bufnr )
      -- float_diagnostic( bufnr )
      -- vim.lsp.inlay_hint.enable( true, { bufnr = bufnr } )
    end
  }
  local extended = vim.tbl_deep_extend( "force", defaults, overrides )
  lsp.setup( extended )
end


M.lsp_may_setup = function( lsp, overrides, condition )
  if condition() then
    M.lsp_setup( lsp, overrides )
  end
end


M.have_executables = function( ... )
  local not_have = 0
  for _, name in pairs( { ... } ) do
    -- 0 for no such a executable
    -- 1 for the opposite
    if vim.fn.executable( name ) == 0 then
      not_have = not_have + 1
    end
  end
  return not_have == 0
end


return M
