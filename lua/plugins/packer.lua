require 'plugins/bootstrap'


require 'packer'.startup( function()

  -- Impatient!

  use { 'lewis6991/impatient.nvim',
        config = [[ require('impatient') ]] }



  -- Editing

  use 'tpope/vim-repeat'
  use 'tommcdo/vim-exchange'
  use 'wellle/targets.vim'

  use { 'tpope/vim-commentary',
        keys = { 'gc', 'gcc' } }

  use { 'junegunn/vim-after-object',
        event = 'VimEnter',
        config = [[ require 'configs/after-object' ]] }

  use { 'junegunn/vim-easy-align',
        keys = { 'ga' },
        config = [[ require 'configs/easy-align' ]] }

  use { 'qpkorr/vim-bufkill',
        event = 'BufWinEnter',
        config = [[ require 'configs/bufkill' ]] }

  use { 'machakann/vim-sandwich',
        keys = { 'sr', 'sd', 'sa' },
        event = { 'CursorMoved', 'CursorHold' },
        config = [[ require 'configs/sandwich' ]] }



  -- QoLI

  use { 'lukas-reineke/indent-blankline.nvim',
        event = { 'CursorHold', 'CursorMoved' },
        config = [[ require 'configs/indent-blankline' ]] }

  use { 'Pocco81/AutoSave.nvim',
        event = { 'InsertEnter', 'CursorMoved' },
        config = [[ require 'configs/autosave' ]] }

  use { 'nathom/filetype.nvim',
        config = [[ require 'configs/filetype' ]] }

  use { 'airblade/vim-rooter',
        config = [[ require 'configs/rooter' ]] }

  use { 'junegunn/vim-slash',
        keys = { '/' },
        config = [[ require 'configs/slash' ]] }

  use { 'andymass/vim-matchup',
        event = { 'CursorHold', 'CursorMoved' },
        config = [[ require 'configs/matchup' ]] }

  use { 'lewis6991/gitsigns.nvim',
        event = { 'CursorHold' },
        config = [[ require 'configs/gitsigns' ]] }

  use { 'windwp/nvim-autopairs',
        event = { 'InsertEnter' },
        config = [[ require 'configs/autopairs' ]] }



  -- Navigating

  use { 'unblevable/quick-scope',
        config = [[ require 'configs/quick-scope' ]] }

  use { 'phaazon/hop.nvim',
        event = { 'CursorMoved', 'CursorHold' },
        config = [[ require 'configs/hop' ]] }

  use { 'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        event = { 'CursorHold', 'CursorMoved' },
        config = [[ require 'configs/telescope' ]] }



  -- Languages

  use { 'eraserhd/parinfer-rust',
        ft = { 'racket', 'scheme', 'lisp' },
        run = [[ nix shell nixpkgs#{cargo,gcc} -c cargo build --release ]] }

  use { 'elixir-editors/vim-elixir',
        ft = { 'elixir' } }

  use { 'benknoble/vim-racket',
        ft = { 'racket' } }



  -- Cmp

  use { 'hrsh7th/nvim-cmp',
        event = { 'InsertEnter', 'CursorHold', 'CursorMoved' },
        config = [[ require 'configs/cmp/cmp' ]] }

  use { 'hrsh7th/cmp-buffer',
        after = 'nvim-cmp' }

  use { 'hrsh7th/cmp-path',
        after = 'nvim-cmp' }

  use { 'hrsh7th/cmp-nvim-lsp',
        after = 'nvim-cmp' }

  use { 'neovim/nvim-lspconfig',
        after = 'nvim-cmp' }

  use { 'hrsh7th/cmp-nvim-lua',
        after = 'nvim-cmp' }



  -- Treesitter

  use { 'nvim-treesitter/nvim-treesitter',
        config = [[  require 'configs/treesitter' ]] }

  use { 'p00f/nvim-ts-rainbow' }

  use { 'RRethy/nvim-treesitter-endwise' }



  -- Misc things

  use 'nvim-lua/plenary.nvim'



  -- Packer itself

  use 'wbthomason/packer.nvim'

end )


vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

