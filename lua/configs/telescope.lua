local actions = require 'telescope.actions'


local i_mappings = {
    ['<M-j>'] = actions.move_selection_next,
    ['<M-k>'] = actions.move_selection_previous,
    ['<Esc>'] = actions.close
}

require( 'telescope' ).setup {
    defaults = {
        mappings = { i = i_mappings },
    },
}


--
-- Keymaps
--
vim.keymap.set( 'n', '<Leader>f', '<CMD>Telescope find_files<CR>', { silent = true } )
vim.keymap.set( 'n', '<Leader><Enter>', '<CMD>Telescope buffers<CR>', { silent = true } )


vim.cmd [[
    nnoremap <silent> <Leader>l
        \ :lua require 'telescope.builtin'.current_buffer_fuzzy_find { skip_empty_lines = true; }<CR>
]]
