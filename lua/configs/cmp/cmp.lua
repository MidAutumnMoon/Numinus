local cmp = require 'cmp'
local cmp_buffer = require 'cmp_buffer'

local utils = require 'configs/cmp/utils'


cmp.setup {

  --
  -- Source
  --

  sources = {
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },

    -- cmp_buffer with completion from all buffers
    { name = 'buffer',
      option = {
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

    ['<Tab>'] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif utils.has_word_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' } ),

    ['<S-Tab>'] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' } ),

      -- Others

      ['<C-e>'] = cmp.mapping.abort(),

  },


  --
  -- Sorting
  --

  sorting = {
    comparators = {
      ( function(...) return cmp_buffer:compare_locality(...) end ),
    },
  },

}


require 'configs/cmp/lsp'
require 'configs/cmp/cmdline'

require 'configs/cmp/autopairs'
