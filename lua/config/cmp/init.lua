local cmp = require "cmp"

local utils = require "config.cmp.utils"


--
-- Reusable
--

local Sources = {}

Sources.buffer = {
  name = "buffer",
  option = {
    get_bufnrs = function()
      return vim.api.nvim_list_bufs()
    end,
    max_indexed_line_length = 1024 * 10
  }
}


--
-- Setup
--

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "path" },
    Sources.buffer
  },

  mapping = {
    ["<Tab>"] = function( fallback )
      if cmp.visible() then
        return cmp.select_next_item {
          behavior = cmp.SelectBehavior.Insert
        }
      elseif utils.words_before_cursor() then
        return cmp.complete()
      else
        return fallback()
      end
    end,

    ["<S-Tab>"] = function( fallback )
      if cmp.visible() then
        return cmp.select_prev_item()
      else
        return fallback()
      end
    end,

    ["<C-e>"] = function(fallback)
      return cmp.mapping.abort()
    end
  },

  preselect = cmp.PreselectMode.None
}


cmp.setup.cmdline( ":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    { name = "cmdline" },
    -- Sources.buffer
  }
} )

cmp.setup.cmdline( "/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { Sources.buffer }
} )
