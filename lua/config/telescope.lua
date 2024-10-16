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

    cache_picker = {
        num_pickers = -1
    },

    preview = {
        filesize_limit = 2,
        timeout = 120,
        treesitter = true
    },

} }


local BatchSetKeymaps = require "nus.keys".BatchSetKeymaps

BatchSetKeymaps { "n" } {
    ["<Leader>f"] = builtin.find_files,
    ["<Leader>F"] = builtin.oldfiles,
    ["<LocalLeader>ft"] = builtin.filetypes,
    ["<Leader><Enter>"] = builtin.buffers,
    ["<Leader>l"] = builtin.current_buffer_fuzzy_find,
    ["<Leader>d"] = builtin.diagnostics,
}
