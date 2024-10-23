vim.api.nvim_create_autocmd( "TextYankPost", {

    pattern = "*",

    callback = function( info )
        vim.highlight.on_yank { IncSearch = 80 }
    end

} )
