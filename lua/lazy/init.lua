require 'lazy.bootstrap'

-- Plugins

local plugins = {

  --
  -- Editing
  --

  { "tpope/vim-repeat",
    lazy = false,
  },

  { "tommcdo/vim-exchange",
    keys = { "cx" },
  },

  { "wellle/targets.vim",
    lazy = false,
  },

  { "junegunn/vim-after-object",
    keys = "ca",
    config = function()
      vim.fn["after_object#enable"]( "=", ":", "|", ";", " " )
    end
  },

  { "junegunn/vim-easy-align",
    keys = "ga",
    config = function()
      local set = vim.keymap.set
      local keyconf = { remap = true; }
      set( "n", "ga", "<Plug>(EasyAlign)", keyconf )
      set( "x", "ga", "<Plug>(EasyAlign)", keyconf )
    end
  },

  { "echasnovski/mini.surround",
    event = { 'CursorMoved', 'CursorHold' },
    keys = { "ys", "cs", "ds" },
    opts = {}
  },

  { "echasnovski/mini.move",
    lazy = false,
    opts = {},
  },

  { "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function() require "config.autopairs" end
  },

  { "eraserhd/parinfer-rust",
    ft = { "racket", "lisp", "scheme" },
    build = {
      "cargo build --release",
      "rm -fr target/release/build/",
      "rm -fr target/release/deps/",
    },
  },

  --
  -- Navigating
  --

  { "ggandor/leap.nvim",
    lazy = false,
    dependencies = {
      "tpope/vim-repeat",
    },
    config = function() require "config.leap" end
  },

  { "kevinhwang91/nvim-fFHighlight",
    keys = { "f", "F" },
    opts = {
      number_hint_threshold = 2,
      prompt_sign_define = { text = "f" },
    }
  },

  { "nvim-telescope/telescope.nvim",
    event = { "CursorMoved", "CursorHold" },
    cmd = "Telescope",
    config = function() require "config.telescope" end
  },

  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    cmd = "Neotree",
    event = { "CursorMoved", "CursorHold" },
    config = function() require "config.neo-tree" end
  },

  { "chentoast/marks.nvim",
    event = { "CursorHold", "CursorMoved" },
    config = function() require "config.marks" end
  },

  --
  -- QoL
  --

  { "lukas-reineke/indent-blankline.nvim",
    event = { 'CursorHold', 'CursorMoved' },
    main = "ibl",
    opts = { },
  },

  { "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    event = "BufReadPost",
    config = function() require "config.gitsigns" end
  },

  { "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "Isrothy/lualine-diagnostic-message"
    },
    config = function() require "config.lualine" end
  },

  { "nanozuki/tabby.nvim",
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() require "config.tabby" end
  },

  --
  -- Cmp & LSP
  --

  { "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "BufReadPost" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    },
    config = function() require "config.cmp" end
  },

  { "neovim/nvim-lspconfig",
    lazy = false,
    config = function() require "config.lspconfig" end
  },

  --
  -- Treesitter
  --

  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    name = "treesitter",
    lazy = false,
    config = function() require "config.treesitter" end
  },

  { "nvim-treesitter/nvim-treesitter-textobjects" },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { 'CursorMoved' },
    opts = {
      max_lines = 3,
    },
  },

  --
  -- Languages
  --

  { "isobit/vim-caddyfile",
    ft = { "caddyfile" },
  },

  --
  -- Colorschemes
  --

  { "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    config = function() require "config.tokyonight" end
  },

  { "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function() require "config.catppuccin" end
  },

  --
  -- Other things
  --

  { "nvim-lua/plenary.nvim" }

}


-- Config

local config = {

  defaults = {
    lazy = true
  },

  checker = {
    enabled = false
  },

  lockfile = vim.fn.stdpath('state') .. "/lazy-lock.json",

  rtp = {
    reset = true,
    disabled_plugins = {
      'netrwPlugin',
      'netrwFileHandlers',
      'gzip',
      'zip',
      'zipPlugin',
      'tar',
      'tarPlugin',
      'getscript',
      'getscriptPlugin',
      'vimball',
      'vimballPlugin',
      '2html_plugin',
      'logipat',
      'rrhelper',
      'spellfile_plugin',
      'matchit',
      'matchparen',
      'tutor_mode_plugin',
      'remote_plugins',
      'shada_autoload',
      'shada_plugin'
    }
  }

}

require "lazy" .setup( plugins, config )


vim.cmd [[ command! P :Lazy sync ]]
