local telescope = require "telescope"
local action = require "telescope.actions"
local builtin = require "telescope.builtin"

telescope.setup { defaults = {

    mappings = {
        i = {
            ["<M-j>"] = action.move_selection_next,
            ["<M-k>"] = action.move_selection_previous,
            ["<Esc>"] = action.close
        }
    },

    cache_picker = false,

    preview = {
        filesize_limit = 2,
        timeout = 120,
        treesitter = true
    },

} }


local BatchSetKeymaps = require "nus".BatchSetKeymaps

BatchSetKeymaps { "n" } {
    ["<Leader>f"] = function()
        local cmd = {
            "fd",
            "--type=file",
            "--color=never",
            "--hidden",
            "--exclude=.git/",
        }
        builtin.find_files { find_command = cmd }
    end,
    ["<Leader>F"] = builtin.oldfiles,
    ["<LocalLeader>ft"] = builtin.filetypes,
    ["<Leader><Enter>"] = builtin.buffers,
    ["<Leader>l"] = builtin.current_buffer_fuzzy_find,
    ["<Leader>d"] = builtin.diagnostics,
}
