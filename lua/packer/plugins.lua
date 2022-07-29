require 'packer/bootstrap'


require 'packer'.startup( function()

    -- Impatient!
    use { 'lewis6991/impatient.nvim' }



    -- Editing

    use 'tpope/vim-repeat'
    use 'tommcdo/vim-exchange'
    use 'wellle/targets.vim'

    use { 'numToStr/Comment.nvim',
          keys = { 'gc', 'gb' },
          config = [[ require 'configs/comment' ]] }

    use { 'junegunn/vim-after-object',
          keys = 'a',
          config = [[ require 'configs/after-object' ]] }

    use { 'junegunn/vim-easy-align',
          keys = { 'ga' },
          config = [[ require 'configs/easy-align' ]] }

    use { 'machakann/vim-sandwich',
          event = { 'CursorMoved', 'CursorHold' },
          config = [[ require 'configs/sandwich' ]] }

    use { 'windwp/nvim-autopairs',
          event = { 'InsertEnter' },
          config = [[ require 'configs/autopairs' ]] }



    -- QoLI

    use { 'lukas-reineke/indent-blankline.nvim',
          event = { 'CursorHold', 'CursorMoved' },
          config = [[ require 'configs/indent-blankline' ]] }

    use { 'Pocco81/AutoSave.nvim',
          event = { 'InsertEnter', 'CursorMoved' },
          config = [[ require 'configs/autosave' ]] }

    use { 'airblade/vim-rooter',
          event = 'VimEnter',
          config = [[ require 'configs/rooter' ]] }

    use { 'andymass/vim-matchup',
          event = { 'CursorHold', 'CursorMoved' },
          config = [[ require 'configs/matchup' ]] }

    use { 'lewis6991/gitsigns.nvim',
          event = 'BufReadPre',
          config = [[ require 'configs/gitsigns' ]] }

    use { 'famiu/bufdelete.nvim',
          cmd = { 'Bdelete', 'Bwipeout' },
          keys = '<C-q>',
          config = [[ require 'configs/bufdelete' ]] }

    use { 'L3MON4D3/LuaSnip',
          module = 'luasnip',
          config = [[ require 'configs/luasnip' ]] }

    use { 'rafamadriz/friendly-snippets' }

    use { 'gpanders/editorconfig.nvim' }

    use { 'akinsho/toggleterm.nvim',
          tag = 'v2.1.0',
          config = [[ require 'configs/toggleterm' ]],
          keys = '<C-`>' }

    use { 'nvim-lualine/lualine.nvim',
          config = [[ require 'configs/lualine/setup' ]] }



    -- Navigating

    use { 'unblevable/quick-scope',
          event = { 'CursorMoved', 'CursorHold' },
          setup = [[ require 'configs/quick-scope' ]] }

    use { 'phaazon/hop.nvim',
          event = { 'CursorMoved', 'CursorHold' },
          config = [[ require 'configs/hop' ]] }

    use { 'nvim-telescope/telescope.nvim',
          event = { 'CursorHold', 'CursorMoved' },
          keys = '<Leader>f',
          command = 'Telescope',
          config = [[ require 'configs/telescope' ]] }



    -- Languages

    use { 'eraserhd/parinfer-rust',
          ft = { 'racket', 'scheme', 'lisp' },
          run = [[
            CARGO_PROFILE_RELEASE_LTO=thin nix shell nixpkgs#{cargo,clang} -c cargo build --release
          ]] }

    use { 'benknoble/vim-racket',
          ft = 'racket' }


    -- Cmp

    use { 'hrsh7th/nvim-cmp',
          event = { 'InsertEnter', 'CursorHold', 'CursorMoved' },
          config = [[ require 'configs/cmp/cmp' ]] }

    use { 'neovim/nvim-lspconfig',
          module = 'lspconfig' }

    use { 'hrsh7th/cmp-buffer',
          module = 'cmp_buffer',
          after = 'nvim-cmp' }

    use { 'hrsh7th/cmp-path',
          module = 'cmp_path',
          after = 'nvim-cmp' }

    use { 'hrsh7th/cmp-nvim-lua',
          after = 'nvim-cmp' }

    use { 'hrsh7th/cmp-nvim-lsp',
          module = 'cmp_nvim_lsp',
          after = 'nvim-cmp' }

    use { 'saadparwaiz1/cmp_luasnip',
          module = 'cmp_luasnip',
          after = 'nvim-cmp' }

    use { 'hrsh7th/cmp-cmdline',
          module = 'cmp_cmdline',
          after = 'nvim-cmp' }



    -- Treesitter

    use { 'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate',
          config = [[ require 'configs/treesitter' ]] }

    use { 'p00f/nvim-ts-rainbow' }

    use { 'nvim-treesitter/nvim-treesitter-textobjects' }



    -- Misc things

    use { 'nvim-lua/plenary.nvim',
          module = 'plenary' }



    -- Packer itself

    use 'wbthomason/packer.nvim'

end )


vim.cmd [[
    command! P :PackerSync
]]

