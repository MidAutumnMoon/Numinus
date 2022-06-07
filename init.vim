"
" Numinus: MidAutumnMoon's Neovim Configuration!
"

let mapleader = " "
let maplocalleader = ",,"

let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

lua require 'impatient'

runtime! startup/*.vim
runtime! startup/*.lua
runtime! lua/packer/plugins.lua

set exrc
set secure
