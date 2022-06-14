local RememberPosition =
    vim.api.nvim_create_augroup( 'RememberPosition', { clear = true } )

local actual_vim_command = [[
  if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    exe "normal! g`\""
  endif
]]


vim.api.nvim_create_autocmd( 'BufReadPost', {
    pattern = '*',
    group = RememberPosition,
    command = actual_vim_command
} )
