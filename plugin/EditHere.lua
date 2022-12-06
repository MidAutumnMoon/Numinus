EditHere = {}

-- Get the directory of current file.
EditHere.dir_of_this_file = function()
  return vim.fn.expand( '%:p:h' )
end


-- Return the part of current file's
-- path which is related to CWD.
EditHere.related_to_cwd = function()
  local cwd = vim.fn.getcwd()
  local here = EditHere.dir_of_this_file()

  return vim.fn.substitute( here, cwd, '.', '' ) .. '/'
end


--
-- Set the keymap.
--
vim.cmd [[
  nnoremap <Leader>e :e <C-r>=luaeval( 'EditHere.related_to_cwd()' )<CR>
]]
