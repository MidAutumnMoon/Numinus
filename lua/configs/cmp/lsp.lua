local cap_object =
  vim.lsp.protocol.make_client_capabilities()

local updated_cap =
  require 'cmp_nvim_lsp'.update_capabilities( cap_object )


--
-- Servers
--

local lspconfig = require 'lspconfig'

local lsp_servers = {
  'rnix',
  'rust_analyzer'
}


local setup_keymaps = function()
  vim.cmd [[

    nnoremap <silent> <buffer> gd <CMD>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> <buffer> gD <CMD>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> <buffer> gi <CMD>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <buffer> gr <CMD>lua vim.lsp.buf.references()<CR>

    nnoremap <silent> <buffer> <F2> <CMD>lua vim.lsp.buf.rename()<CR>

    nnoremap <silent> <buffer> ]a <CMD>lua vim.diagnostic.goto_next()<CR>
    nnoremap <silent> <buffer> [a <CMD>lua vim.diagnostic.goto_prev()<CR>

    nnoremap <silent> <buffer> K <CMD>lua vim.lsp.buf.hover()<CR>

  ]]
end


-- do it in a batch

for _, server in ipairs( lsp_servers ) do

  lspconfig[ server  ].setup {
    on_attach = function( client, bufnr )
        setup_keymaps()
      end,
    capabilities = updated_cap
  }

end


