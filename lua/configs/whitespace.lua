vim.cmd [[

  let g:better_whitespace_enabled = 1
  let g:strip_whitespace_on_save  = 0
  let g:strip_whitespace_confirm  = 0

  let g:better_whitespace_filetypes_blacklist =
    \ [ 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'fugitive' ]

  nnoremap <Leader>s :StripWhitespace<CR>

]]
