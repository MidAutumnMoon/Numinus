local command = [[
  if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    exe "normal! g`\""
  endif
]]


vim.api.nvim_create_autocmd( 'BufReadPost', {
  pattern = '*',
  command = command
} )
