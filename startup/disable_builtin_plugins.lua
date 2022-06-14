local disabled_plugins = {
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'gzip',
    'zip',
    'zipPlugin',
    'tar',
    'tarPlugin',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    '2html_plugin',
    'logipat',
    'rrhelper',
    'spellfile_plugin',
    'matchit',
    'matchparen',
    'man',
    'tutor_mode_plugin',
    'remote_plugins',
    'shada_plugin'
}


for _, plugin_name in pairs( disabled_plugins ) do
    vim.g[ 'loaded_' .. plugin_name ] = 1
end
