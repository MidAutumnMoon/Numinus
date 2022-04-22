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
    enable = true
  },

  matchup = {
    enable = true,
  },

  rainbow = {
    enable = true,
  },

  endwise = {
    enable = true,
  }

}


vim.cmd [[

  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

]]
