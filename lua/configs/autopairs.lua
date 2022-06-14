local autopairs = require 'nvim-autopairs'

local Rule = require 'nvim-autopairs.rule'


autopairs.setup {
    check_ts = true,

    disable_filetype = {
    'TelescopePrompt',

    -- parinfer will take care of brackets
    'racket', 'lisp', 'scheme',
    },

    map_c_h = true,
    map_c_w = true,
}


autopairs.add_rules {

    -- Add space between brackets
    -- (copied from wiki)

    Rule( ' ', ' ' )
        :with_pair( function(opts)
            local pair = opts.line:sub( opts.col - 1, opts.col )
            return vim.tbl_contains( { '()', '[]', '{}' }, pair )
        end),

    Rule( '( ', ' )' )
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key( ')' ),

    Rule( '{ ', ' }' )
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key( '}' ),

    Rule( '[ ', ' ]' )
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key( ']' )

}
