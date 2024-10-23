vim.opt.autowriteall = true

--- @param bufnr number
--- @return boolean
local function buffer_writable( bufnr )
    local bopt = vim.bo[bufnr]
    return ( not bopt.readonly )
        and bopt.modifiable
        and vim.api.nvim_buf_get_name( bufnr ) ~= ""
end

local function save( context )
    local bufnr = context.buf
    if not buffer_writable( bufnr ) then
        return false
    end
    vim.api.nvim_buf_call( bufnr, function()
        vim.cmd( "silent wall" )
        vim.cmd( "silent doautocmd BufWritePost" )
    end )
end

vim.api.nvim_create_autocmd ( {
    "InsertLeave",
    "TextChanged",
    "BufEnter",
    "BufLeave",
}, {
    pattern = "*",
    group = vim.api.nvim_create_augroup(
        "AutoSave",
        { clear = true }
    ),
    callback = save,
} )

