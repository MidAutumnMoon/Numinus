local filetypes = {

  extension = {
    -- Polkit
    rules = 'javascript',

    -- systemd things
    service = 'systemd',
    target  = 'systemd',
    path    = 'systemd',
    timer   = 'systemd',

    -- XML based
    opml = 'xml',

    -- racket
    rkt = 'racket'
  },

  filename = {
    -- actual Bash things
    ['.envrc'] = 'bash',

    -- actual JSON things
    ['flake.lock'] = 'json'
  },

}

vim.filetype.add( filetypes )
