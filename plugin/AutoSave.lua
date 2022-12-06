vim.opt.autowriteall = true


local events = {
  "InsertLeave",
  "TextChanged",
  "BufEnter",
  "BufLeave",
}

local buf_call = vim.api.nvim_buf_call
local buf_get_name = vim.api.nvim_buf_get_name
local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup


local function buffer_writable( bufnr )
  local bopt = vim.bo[bufnr]
  return ( not bopt.readonly ) and bopt.modifiable and buf_get_name( bufnr ) ~= ""
end

local function save( context )
  local bufnr = context.buf
  if not buffer_writable( bufnr ) then
    return false
  end
  buf_call( bufnr, function()
    vim.cmd( "silent wall" )
    vim.cmd( "silent doautocmd BufWritePost" )
  end )
end


local AutoSave = create_augroup( "AutoSave", { clear = true } )

create_autocmd ( events, {
  callback = save,
  pattern = "*",
  group = AutoSave,
} )

