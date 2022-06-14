require 'nvim-treesitter.configs'.setup {

    ensure_installed = {
        'lua',
        'nix',
        'vim',

        'erlang',
        'rust',
        'python',

        'bash',
        'fish',
        'commonlisp',

        'javascript',
        'typescript',

        'yaml',
        'toml',
        'json',
        'json5',
    },

    ignore_install = {
        -- Parser for Elixir is extremely slow to load,
        -- so replace it with vim-elixir.
        "elixir",
    },


    highlight = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@conditional.outer',
                ['ic'] = '@conditional.inner',
                ['ao'] = '@loop.outer',
                ['io'] = '@loop.inner',
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ['csp'] = '@parameter.inner',
            },
            swap_previous = {
                ['csP'] = '@parameter.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']]'] = '@function.outer'
            },
            goto_next_end = {
                [']['] = '@function.outer'
            },
            goto_previous_start = {
                ['[['] = '@function.outer'
            },
            goto_previous_end = {
                ['[]'] = '@function.outer'
            }
        }
    },

    matchup = {
        enable = true,
    },

    rainbow = {
        enable = true,
    },

}

vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
