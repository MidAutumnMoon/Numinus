local cmp = require 'cmp'
local cmp_buffer = require 'cmp_buffer'
local luasnip = require 'luasnip'

local utils = require 'configs/cmp/utils'



--
-- Setup LSP
--
require 'configs/lsp/setup'



--
--- Setup cmp
--
cmp.setup {
    --
    -- Source
    --

    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer',
        option = {
            -- all visible buffers
            get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs( vim.api.nvim_list_wins() ) do
                    bufs[ vim.api.nvim_win_get_buf(win) ] = true
                end
                return vim.tbl_keys( bufs )
            end
        } },
    },

    --
    -- Mappings
    --
    mapping = {
        -- Tabs

        ['<Tab>'] = cmp.mapping( function( fallback )
            if cmp.visible() then
                cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif utils.has_word_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' } ),

        ['<S-Tab>'] = cmp.mapping( function( fallback )
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' } ),

        -- Others
        ['<C-e>'] = cmp.mapping.abort(),

        ['<Enter>'] = cmp.mapping( function( fallback )
            if cmp.visible() and luasnip.expandable() then
                cmp.confirm { select = true }
            else
                fallback()
            end
        end, { 'i' })
    },

    --
    -- Snippet
    --
    snippet = {
        expand = function( args )
            luasnip.lsp_expand( args.body )
        end
    },

    --
    -- Others
    --
    preselect = cmp.PreselectMode.None,
}



--
-- cmp-cmdline
--
cmp.setup.cmdline( ':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources( {
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = "cmdline" },
    }, {
        { name = 'buffer' },
    } )
} )

cmp.setup.cmdline( '/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
} )


