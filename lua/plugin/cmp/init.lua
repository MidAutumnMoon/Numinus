local cmp = require "cmp"
local cmp_buffer = require "cmp_buffer"
local luasnip = require "luasnip"


local sources = {}

sources.buffer = {
    name = "buffer",
    option = {
        -- Get words from all buffers
        get_bufnrs = vim.api.nvim_list_bufs,
        max_indexed_line_length = 200,
        keyword_pattern = [[\k\+]],
    }
}


cmp.setup {

    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
            { name = "path" },
            { name = "luasnip" },
        },
        {
            sources.buffer
        }
    ),

    mapping = {
        ['<CR>'] = cmp.mapping( function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm { select = true }
                end
            else
                fallback()
            end
        end ),

        ["<Tab>"] = cmp.mapping( function( fallback )
            if cmp.visible() and not luasnip.in_snippet() then
                cmp.select_next_item()
            elseif luasnip.jumpable( 1 ) then
                luasnip.jump( 1 )
            else
                fallback()
            end
        end, { "i", "s" } ),

        ["<S-Tab>"] = cmp.mapping( function( fallback )
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable( -1 ) then
                luasnip.jump( -1 )
            else
                fallback()
            end
        end, { "i", "s" } ),

        ["<C-e>"] = cmp.mapping( function(fallback)
            cmp.mapping.abort()
        end ),
    },

    preselect = cmp.PreselectMode.None,

    sorting = {
        comparators = { function(...) cmp_buffer:compare_locality(...) end },
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand( args.body )
        end,
    },
}


cmp.setup.cmdline( ":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "path" },
        { name = "cmdline" },
    }
} )

cmp.setup.cmdline( "/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { sources.buffer }
} )
