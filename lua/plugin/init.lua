--
-- Bootstrap Lazy.nvim
--

(function()

    local stdpath = vim.fn.stdpath
    local lazy_path = stdpath( 'data' ) .. "/lazy/lazy.nvim"

    vim.opt.rtp:prepend( lazy_path )

end)()


-- Plugins

local Plugins = {

    --
    -- Editing
    --

    {
        "tpope/vim-repeat",
        lazy = false,
    },

    {
        "tommcdo/vim-exchange",
        keys = { "cx" },
    },

    {
        "wellle/targets.vim",
        lazy = false,
    },

    {
        "junegunn/vim-after-object",
        keys = "ca",
        config = function()
            vim.fn["after_object#enable"]( "=", ":", "|", ";", " " )
        end
    },

    {
        "junegunn/vim-easy-align",
        keys = "ga",
        config = function()
            local set = vim.keymap.set
            local keyconf = { remap = true; }
            set( "n", "ga", "<Plug>(EasyAlign)", keyconf )
            set( "x", "ga", "<Plug>(EasyAlign)", keyconf )
        end
    },

    {
        "echasnovski/mini.surround",
        event = { 'CursorMoved', 'CursorHold' },
        keys = { "ys", "cs", "ds" },
        opts = {}
    },

    {
        "echasnovski/mini.move",
        lazy = false,
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require "plugin.autopairs"
        end
    },

    {
        "windwp/nvim-ts-autotag",
        opts = {},
        lazy = false,
    },

    {
        "eraserhd/parinfer-rust",
        ft = {
            "racket",
            "lisp",
            "scheme"
        },
        build = {
            "cargo build --release",
            "rm -fr target/release/build/",
            "rm -fr target/release/deps/",
        },
    },

    --
    -- Navigating
    --

    {
        "ggandor/leap.nvim",
        lazy = false,
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require "plugin.leap"
        end
    },

    {
        "kevinhwang91/nvim-fFHighlight",
        keys = { "f", "F" },
        opts = {
            number_hint_threshold = 2,
            prompt_sign_define = { text = "f" },
        }
    },

    {
        "nvim-telescope/telescope.nvim",
        event = { "CursorMoved", "CursorHold" },
        cmd = "Telescope",
        config = function()
            require "plugin.telescope"
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        cmd = "Neotree",
        event = { "CursorMoved", "CursorHold" },
        config = function()
            require "plugin.neo-tree"
        end
    },

    {
        "andymass/vim-matchup",
        after = "nvim-treesitter",
        lazy = false,
    },

    --
    -- QoL
    --

    {
        "tpope/vim-eunuch",
        lazy = false,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { 'CursorHold', 'CursorMoved' },
        main = "ibl",
        opts = { },
    },

    {
        "lewis6991/gitsigns.nvim",
        name = "gitsigns",
        event = "BufReadPost",
        config = function()
            require "plugin.gitsigns"
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "Isrothy/lualine-diagnostic-message"
        },
        config = function()
            require "plugin.lualine"
        end
    },

    {
        "nanozuki/tabby.nvim",
        lazy = false,
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require "plugin.tabby" end
    },

    --
    -- Cmp & LSP
    --

    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "BufReadPost" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline"
        },
        config = function() require "plugin.cmp" end
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require "plugin.lspconfig"
        end
    },

    --
    -- Treesitter
    --

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        name = "treesitter",
        lazy = false,
        config = function()
            require "plugin.treesitter"
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { 'CursorMoved' },
        opts = {
            max_lines = 3,
        },
    },

    {
        -- Wait for https://github.com/RRethy/nvim-treesitter-endwise/pull/42 to be merged
        -- "RRethy/nvim-treesitter-endwise",
        "metiulekm/nvim-treesitter-endwise",
        after = "nvim-treesitter",
        lazy = false,
    },

    --
    -- Languages
    --

    {
        "isobit/vim-caddyfile",
        ft = { "caddyfile" },
    },

    {
        "imsnif/kdl.vim",
        ft = { "kdl" }
    },

    --
    -- Colorschemes
    --

    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        config = function() require "plugin.tokyonight" end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        config = function() require "plugin.catppuccin" end
    },

    --
    -- Other things
    --

    {
        "nvim-lua/plenary.nvim"
    }

} -- End Plugins

local Config = {

    defaults = { lazy = true },

    checker = { enabled = false },

    lockfile = vim.fn.stdpath('state') .. "/lazy-lock.json",

    rtp = { reset = true }

} -- End Config

require "lazy".setup( Plugins, Config )


vim.cmd [[ command! P :Lazy sync ]]
