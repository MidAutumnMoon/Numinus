"
" Edit a file related to the current opened file.
" Kind like what Emacs does.
"

nnoremap ,e :e <C-r>=expand('%:p:h')<CR>
