local cap_object =
  vim.lsp.protocol.make_client_capabilities()

local full_caps =
  require 'cmp_nvim_lsp'.update_capabilities( cap_object )


--
-- Servers
--

local lspconfig = require 'lspconfig'

local lsp_servers = {
}

lspconfig['rnix'].setup {

  capabilities = full_caps

}


