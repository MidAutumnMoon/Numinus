require 'plugins/bootstrap'


require 'packer'.startup( function()

  -- Impatient!

  use { 'lewis6991/impatient.nvim',
        config = [[ require 'impatient' ]] }



  -- Editing

  use 'tpope/vim-repeat'
  use 'tommcdo/vim-exchange'
  use 'wellle/targets.vim'

  use { 'tpope/vim-commentary',
        keys = { 'gc', 'gcc' } }

  use { 'junegunn/vim-after-object',
        keys = 'a',
        config = [[ require 'configs/after-object' ]] }

  use { 'junegunn/vim-easy-align',
        keys = { 'ga' },
        config = [[ require 'configs/easy-align' ]] }

  use { 'machakann/vim-sandwich',
        event = { 'CursorMoved', 'CursorHold' },
        config = [[ require 'configs/sandwich' ]] }



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

  use { 'junegunn/vim-slash',
        keys = { '/', '*' },
        config = [[ require 'configs/slash' ]] }

  use { 'andymass/vim-matchup',
        event = { 'CursorHold', 'CursorMoved' },
        config = [[ require 'configs/matchup' ]] }

  use { 'lewis6991/gitsigns.nvim',
        event = { 'CursorHold', 'CursorMoved' },
        config = [[ require 'configs/gitsigns' ]] }

  use { 'windwp/nvim-autopairs',
        event = { 'InsertEnter' },
        config = [[ require 'configs/autopairs' ]] }

  use { 'famiu/bufdelete.nvim',
        cmd = { 'Bdelete', 'Bwipeout' },
        keys = '<C-q>',
        config = [[ require 'configs/bufdelete' ]] }

  use { 'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        module = 'luasnip',
        config = [[ require 'configs/luasnip' ]] }

  use { 'rafamadriz/friendly-snippets' }



  -- Navigating

  use { 'unblevable/quick-scope',
        keys = { 'f', 'F' },
        setup = [[ require 'configs/quick-scope' ]] }

  use { 'phaazon/hop.nvim',
        event = { 'CursorMoved', 'CursorHold' },
        config = [[ require 'configs/hop' ]] }

  use { 'nvim-telescope/telescope.nvim',
        event = { 'CursorHold', 'CursorMoved' },
        keys = '<Leader>f',
        config = [[ require 'configs/telescope' ]] }



  -- Languages

  use { 'eraserhd/parinfer-rust',
        ft = { 'racket', 'scheme', 'lisp' },
        run = [[ nix shell nixpkgs#{cargo,gcc} -c cargo build --release ]] }

  use { 'elixir-editors/vim-elixir',
        ft = { 'elixir' } }

  -- use { 'benknoble/vim-racket',
  --       ft = { 'racket' } }



  -- Cmp

  use { 'hrsh7th/nvim-cmp',
        event = { 'InsertEnter', 'CursorHold', 'CursorMoved' },
        config = [[ require 'configs/cmp/cmp' ]] }

  use { 'hrsh7th/cmp-buffer',
        after = 'nvim-cmp' }

  use { 'hrsh7th/cmp-path',
        after = 'nvim-cmp' }

  use { 'hrsh7th/cmp-nvim-lua',
        after = 'nvim-cmp' }

  use { 'hrsh7th/cmp-nvim-lsp',
        after = 'nvim-cmp' }

  use { 'neovim/nvim-lspconfig',
        after = 'nvim-cmp' }

  use { 'saadparwaiz1/cmp_luasnip',
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

