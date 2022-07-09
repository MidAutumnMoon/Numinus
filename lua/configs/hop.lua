local hop = require 'hop'
local hint = require 'hop.hint'


hop.setup {
    char2_fallback_key = '<CR>'
}


local keymap_option = { silent = true }

vim.keymap.set( { 'o', 'x' }, 'f', '<CMD>HopChar1CurrentLineAC<CR>', keymap_option )
vim.keymap.set( { 'o', 'x' }, 'F', '<CMD>HopChar1CurrentLineBC<CR>', keymap_option )

vim.keymap.set( 'n', '<Leader><Leader>j', '<CMD>HopLineStartAC<CR>', keymap_option )
vim.keymap.set( 'n', '<Leader><Leader>k', '<CMD>HopLineStartBC<CR>', keymap_option )

vim.keymap.set( 'n', 'ss', '<CMD>HopChar2MW<CR>', keymap_option )


vim.keymap.set( { 'o', 'x' }, 't',
    function()
        hop.hint_char1 {
            direction = hint.AFTER_CURSOR,
            current_line_only = true,
            hint_offset = -1
        }
    end, keymap_option )

vim.keymap.set( { 'o', 'x' }, 'T',
    function()
        hop.hint_char1 {
            direction = hint.AFTER_CURSOR,
            current_line_only = true,
            hint_offset = 1
        }
    end, keymap_option )

