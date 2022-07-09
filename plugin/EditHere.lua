--
-- Edit a file related to the current opened file.
-- Kind like what Emacs does.
--

EditHere = {}


-- dir_of_this_file :: string
--
-- Get the directory of current file.
--
EditHere.dir_of_this_file = function()
    return vim.fn.expand( '%:p:h' )
end


-- related_to_cwd :: string
--
-- Return the part of current file's
-- path which is related to CWD.
--
EditHere.related_to_cwd = function()
    local cwd = vim.fn.getcwd()
    local here = EditHere.dir_of_this_file()

    return vim.fn.substitute( here, cwd, '.', '')
end


--
-- Set the keymap.
--
vim.cmd [[
    nnoremap <LocalLeader>e :e <C-r>=luaeval( 'EditHere.related_to_cwd()' )<CR>
]]
