require 'plugins/bootstrap'


require 'packer'.startup( function()

  -- Impatient!

  use { 'lewis6991/impatient.nvim',
        config = [[ require('impatient') ]] }



  -- Editing

  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-repeat'
  use 'tommcdo/vim-exchange'
  use 'wellle/targets.vim'

  use { 'junegunn/vim-after-object',
        event = 'VimEnter',
        config = [[ require 'configs/after-object' ]] }

  use { 'junegunn/vim-easy-align',
        keys = { 'ga' },
        config = [[ require 'configs/easy-align' ]] }

  use { 'qpkorr/vim-bufkill',
        config = [[ require 'configs/bufkill' ]] }

  use { 'machakann/vim-sandwich',
        config = [[ require 'configs/sandwich' ]] }



  -- QoLI

  use  { 'lukas-reineke/indent-blankline.nvim',
         config = [[ require 'configs/indent-blankline' ]] }

  use { 'Pocco81/AutoSave.nvim',
        event = 'VimEnter',
        config = [[ require 'configs/autosave' ]] }

  use { 'nathom/filetype.nvim',
        config = [[ require 'configs/filetype' ]] }

  use { 'airblade/vim-rooter',
        config = [[ require 'configs/rooter' ]] }

  use { 'junegunn/vim-slash',
        config = [[ require 'configs/slash' ]] }

  use { 'andymass/vim-matchup',
        event = 'VimEnter',
        config = [[ require 'configs/matchup' ]] }

  use { 'lewis6991/gitsigns.nvim',
        event = 'VimEnter',
        config = [[ require 'configs/gitsigns' ]] }



  -- Navigating

  use { 'unblevable/quick-scope',
        config = [[ require 'configs/quick-scope' ]] }

  use { 'phaazon/hop.nvim',
        config = [[ require 'configs/hop' ]] }

  use { 'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        event = 'VimEnter',
        config = [[ require 'configs/telescope' ]] }



  -- Languages

  use { 'eraserhd/parinfer-rust',
        ft = { 'racket', 'scheme', 'lisp' },
        run = [[ nix shell nixpkgs#{cargo,gcc} -c cargo build --release ]] }

  use { 'elixir-editors/vim-elixir',
        ft = { 'elixir' } }

  use { 'benknoble/vim-racket',
        ft = { 'racket' } }

  -- remove when got treesitter to work
  use { 'LnL7/vim-nix',
        ft = 'nix' }



  -- Cmp

  use { 'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = [[ require 'configs/cmp/cmp' ]] }

  use { 'hrsh7th/cmp-buffer',
        module = 'cmp_buffer' }

  use { 'hrsh7th/cmp-path',
        module = 'cmp_path' }

  use { 'hrsh7th/cmp-nvim-lsp',
        module = 'cmp_nvim_lsp' }

  use { 'neovim/nvim-lspconfig',
        after = 'nvim-cmp' }



  -- Treesitter

  -- TODO: need a custim Neovim wrapper
  -- use { 'nvim-treesitter/nvim-treesitter',
  --       config = [[  require 'configs/treesitter' ]] }



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

