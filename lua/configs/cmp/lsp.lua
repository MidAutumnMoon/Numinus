local cap_object =
  vim.lsp.protocol.make_client_capabilities()

local full_caps =
  require 'cmp_nvim_lsp'.update_capabilities( cap_object )


--
-- Servers
--

local lsp_servers = {
}


