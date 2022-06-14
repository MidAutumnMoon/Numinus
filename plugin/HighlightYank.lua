--
-- See this PR : https://github.com/neovim/neovim/pull/12279
--

local HighlightYank =
vim.api.nvim_create_augroup( 'HighlightYank', { clear = true } )

vim.api.nvim_create_autocmd( 'TextYankPost', {
    pattern = '*',
    group = HighlightYank,
    callback = function()
        require 'vim.highlight'.on_yank { 'IncSearch', 80 }
    end
} )
