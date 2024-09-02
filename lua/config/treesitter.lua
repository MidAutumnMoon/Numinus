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
    "javascript",
    "typescript",
    "css",
    "html",
    "markdown",

    "json",
    "yaml",
    "toml",
    "ninja",
    "sql",
    "just",
    "hlsl",
    "glsl",
    "terraform",
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
      "ruby", "nix", "rust"
    },
  },

  matchup = {
    enable = true
  },

}

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
