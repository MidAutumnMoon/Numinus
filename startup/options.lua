local path_data = vim.fn.stdpath 'data'
local path_cache = vim.fn.stdpath 'cache'

local options_list = {
    { 'number',         true },
    { 'relativenumber', true },
    { 'signcolumn',     'yes:1' },

    { 'autoread',     true },
    { 'autowrite',    true },
    { 'autowriteall', true },
    { 'lazyredraw',   true },
    { 'mouse',        'nv' },
    { 'scrolloff',    5 },
    { 'showcmd',      true },
    { 'showmatch',    true },

    { 'backupdir', (path_cache..'/backup//') },

    { 'undofile', true },
    { 'undodir',  (path_data..'/undo//') },

    { 'backspace', 'indent,eol,start' },

    { 'startofline', false },
    { 'joinspaces',  false },

    { 'virtualedit', 'block' },
    { 'whichwrap',   'b,s,<,>,[,]' },

    { 'hlsearch',  true },
    { 'incsearch', true },

    { 'timeoutlen', 290 },
    { 'updatetime', 100 },

    { 'breakindent',    true },
    { 'breakindentopt', 'sbr' },

    { 'autoindent',  true },
    { 'expandtab',   true },
    { 'smarttab',    true },
    { 'smartindent', true },
    { 'tabstop',     4 },
    { 'softtabstop', 4 },
    { 'shiftwidth',  0 },

    { 'wrap',      true },
    { 'showbreak', '↳ ' },

    { 'laststatus', 2 },

    { 'ignorecase', true },
    { 'smartcase',  true },

    { 'cursorline', true },
    { 'visualbell', true },
    { 'fcs',        'eob: ' },

    { 'wildmenu', true },
    { 'wildmode', 'full:lastused' },

    { 'foldmethod',     'marker' },
    { 'foldlevelstart', 99 },

    { 'nrformats',   'hex,octal' },
    { 'completeopt', 'menuone,preview' },
    { 'diffopt',     'filler,vertical' },

    { 'modelines', 3 },
    { 'shell',     '/bin/sh' },
}

vim.opt.shortmess:append( 'IF' )
vim.opt.formatoptions:append( '1,j' )


--
-- Apply options
--
for _, option_pair in pairs( options_list ) do
    vim.opt[ option_pair[1] ] = option_pair[2]
end
