require "nvim-treesitter.configs" .setup {

  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "fish",

    "c",
    "rust",
    "python",
    "ruby",
    "nix",

    "json",
    "yaml",
    "toml",
    "ninja",
    "sql",
  },

  highlight = {
    enable = true
  },

  incremental_selection = {
    enable = true
  },

  indent = {
    enable = true,
    disable = {
      "ruby",
      "nix"
    },
  },

  matchup = {
    enable = true
  },

}

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
