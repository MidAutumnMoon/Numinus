local lspconfig = require "lspconfig"
local lsp_utils = require "config.lspconfig.utils"

local lsp_setup = lsp_utils.lsp_setup


--
-- Setups
--

lsp_setup( lspconfig.nixd, { } )

lsp_setup( lspconfig.rust_analyzer, { } )

lsp_setup( lspconfig.rubocop, {
  single_file_support = true
} )

-- lsp_setup( lspconfig.ruby_lsp, {
--   single_file_support = true,
-- } )

lsp_setup( lspconfig.denols, {
  single_file_support = true
} )

lsp_setup( lspconfig.lua_ls, {
  settings = { Lua = {
    runtime = { version = "LuaJIT" },
    workspace = {
      checkThirdParty = false,
      -- library = { vim.env.VIMRUNTIME }
      library = vim.api.nvim_get_runtime_file( "", true )
    }
  } }
} )


vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

vim.diagnostic.config {
  update_in_insert = true,
  underline = true,
  virtual_text = false,
  severity_sort = true,
}
