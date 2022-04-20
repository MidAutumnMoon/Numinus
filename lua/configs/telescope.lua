local actions = require 'telescope.actions'


require( 'telescope' ).setup {

  defaults = {

    mappings = {
      i = {
        ['<M-j>'] = actions.move_selection_next,
        ['<M-k>'] = actions.move_selection_previous,
        ['<Esc>'] = actions.close
      },
    },

  },

}


vim.cmd [[

  nnoremap <silent> <Leader>f <CMD>Telescope find_files<CR>

  nnoremap <silent> <Leader><Enter> <CMD>Telescope buffers<CR>

  nnoremap <silent> <Leader>l
      \ :lua require 'telescope.builtin'.current_buffer_fuzzy_find { skip_empty_lines = true; }<CR>

]]
