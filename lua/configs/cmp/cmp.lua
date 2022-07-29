local cmp = require 'cmp'
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

    sources = cmp.config.sources( {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer',
          option = { get_bufnrs = utils.visible_buffers }
        },
    } ),

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
        { name = "cmdline" },
        { name = 'nvim_lua' },
        { name = 'path' },
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


