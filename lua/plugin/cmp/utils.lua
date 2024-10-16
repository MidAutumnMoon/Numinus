local M = {}


local buf_get_lines = vim.api.nvim_buf_get_lines
local win_get_cursor = vim.api.nvim_win_get_cursor

M.words_before_cursor = function()
  local line, col = unpack( win_get_cursor(0) )
  local current_line = buf_get_lines( 0, line - 1, line, true )[1]
  return col ~= 0
    and current_line:sub(col, col):match("%s") == nil
end


return M
