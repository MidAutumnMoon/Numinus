local Components = {}

Components.filename = {
    'filename',
    path = 1,
    symbols = {
        modified = '[+]',
        readonly = '[RO]',
        unnamed = '[No Name]',
    },
    padding = {
        left = 0,
        right = 1
    },
}

Components.progress = {
    '%P',
    padding = {
        right = 0
    }
}

return Components
