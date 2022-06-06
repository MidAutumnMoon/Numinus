local cmp = require 'cmp'
local cmp_buffer = require 'cmp_buffer'
local luasnip = require 'luasnip'

local utils = require 'configs/cmp/utils'


cmp.setup {

  --
  -- Source
  --

  sources = {
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'buffer', option = {
          get_bufnrs = function()
              return vim.api.nvim_list_bufs()
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

    ['<CR>'] = cmp.mapping.confirm { select = true }

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


require 'configs/lsp/setup'
require 'configs/cmp/cmdline'

