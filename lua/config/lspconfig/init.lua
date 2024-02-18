local lspconfig = require "lspconfig"

local lsp_utils = require "config.lspconfig.utils"

local lsp_setup = lsp_utils.lsp_setup
local lsp_may_setup = lsp_utils.lsp_may_setup
local have_executables = lsp_utils.have_executables


--
-- Setups
--

local nil_settings = {
  nix = { flake = {
    autoArchive = false,
    autoEvalInputs = false,
  } }
}

lsp_may_setup( lspconfig.nil_ls, {
  settings = { ["nil"] = nil_settings }
}, function()
  return have_executables( "nil" )
end )


lsp_may_setup( lspconfig.rust_analyzer, { }, function()
  return have_executables( "cargo", "rustc", "rust-analyzer" )
end )


lsp_may_setup( lspconfig.racket_langserver, {}, function()
  return have_executables( "racket" )
end )

lsp_may_setup( lspconfig.elixirls, {
  cmd = { "elixir-ls" }
}, function()
  return have_executables( "elixir", "elixir-ls" )
end )

lsp_may_setup( lspconfig.rubocop, {
  single_file_support = true
}, function()
    return have_executables( "rubocop" )
end )


vim.diagnostic.config {
  update_in_insert = true,
  underline = true,
  virtual_text = false,
  severity_sort = true,
}
