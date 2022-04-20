vim.cmd [[
  autocmd VimEnter * silent! call after_object#enable( '=', ':', '#', ' ', '|', ';' )
]]
