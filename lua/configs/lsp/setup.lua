local cap_object =
    vim.lsp.protocol.make_client_capabilities()

local updated_cap =
    require 'cmp_nvim_lsp'.update_capabilities( cap_object )


--
-- Configure Servers
--

local lspconfig = require 'lspconfig'

local lsp_servers = {
    'rnix',
    'rust_analyzer',
    'tsserver'
}


local setup_keymaps = function()
    local set_key = function( key, func )
        vim.keymap.set( 'n', key, func, { silent = true, buffer = true } )
    end
    local keymaps = {
        { 'gd', vim.lsp.buf.definition },
        { 'gD', vim.lsp.buf.declaration },
        { 'gi', vim.lsp.buf.implementation },
        { 'gr', vim.lsp.buf.references },

        { '<F2>', vim.lsp.buf.rename },
        { 'K', vim.lsp.buf.hover },

        { ']a', vim.diagnostic.goto_next },
        { '[a', vim.diagnostic.goto_prev },
    }
    for _, mapping in ipairs( keymaps ) do
        set_key( mapping[1], mapping[2] )
    end
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


--
-- Tweaks
--
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with (
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
        underline = {
            severity = { min = vim.diagnostic.severity.INFO }
        },
        virtual_text = {
            severity = { min = vim.diagnostic.severity.INFO }
        },
        signs = {
            severity = { min = vim.diagnostic.severity.INFO }
        }
    }
)
