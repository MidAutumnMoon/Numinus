"
" Numinus: MidAutumnMoon's Neovim Configuration!
"

let mapleader = " "
let maplocalleader = "\<F12>"

let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

runtime! startup/*.vim
runtime! startup/*.lua
runtime! lua/startup.lua

set exrc
set secure

