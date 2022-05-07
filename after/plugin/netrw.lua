-- no banner
vim.g.netrw_banner = 0

-- the tree listing
vim.g.netrw_liststyle = 3

-- open files in a vertical split
vim.g.netrw_browse_split = 2

-- 20%
vim.g.netrw_winsize = 23



vim.cmd [[
  nnoremap <silent> ,b :Lexplore<CR>
]]
