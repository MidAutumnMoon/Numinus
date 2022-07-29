local lualine = require 'lualine'
local utils = require 'configs/lualine/utils'
local compons = require 'configs/lualine/components'

local sections = {
    lualine_a = {
        compons.filename
    },
    lualine_b = { },
    lualine_c = {
        { 'diff', source = utils.gitsigns_source }
    },
    lualine_x = {
        { 'encoding', cond = utils.encoding_besides_u8 },
        { 'fileformat', cond = utils.fileformat_besides_unix },
        'filetype',
    },
    lualine_y = {
        'location'
    },
    lualine_z = {
        compons.progress
    },
}

local inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        compons.filename
    },
    lualine_x = {},
    lualine_y = {
        'location'
    },
    lualine_z = {
        compons.progress
    },
}

local disabled_ft = {
    'toggleterm'
}

lualine.setup {
    options = {
        icons_enabled = false,
        color = 'Statusline',
        disabled_filetypes = {
            statusline = disabled_ft
        },
        refresh = {
            statusline = 200
        }
    },
    sections = sections,
    inactive_sections = inactive_sections,
}
