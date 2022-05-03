require 'nvim-treesitter.configs'.setup {

  ensure_installed = {
    'lua',
    'nix',
    'vim',

    'erlang',
    'rust',

    'bash',
    'fish',

    'commonlisp',
    'scheme',

    'javascript',

    'yaml',
    'toml',
    'json',
    'json5',
  },

  ignore_install = {
    -- Parser for Elixir is extremely slow to load,
    -- so replace it with vim-elixir.
    "elixir",
  },


  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@conditional.outer',
        ['ic'] = '@conditional.inner',
        ['ao'] = '@loop.outer',
        ['io'] = '@loop.inner',
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ['csp'] = '@parameter.inner',
      },
      swap_previous = {
        ['csP'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']]'] = '@function.outer'
      },
      goto_next_end = {
        [']['] = '@function.outer'
      },
      goto_previous_start = {
        ['[['] = '@function.outer'
      },
      goto_previous_end = {
        ['[]'] = '@function.outer'
      }
    }
  },

  matchup = {
    enable = true,
  },

  rainbow = {
    enable = true,
  },

}


vim.cmd [[

  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

]]
