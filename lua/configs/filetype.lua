require 'filetype'.setup { overrides = {

  extensions = {
    -- Polkit rules
    rules = 'javascript',

    -- systemd units
    service = 'systemd',
    target  = 'systemd',
    path    = 'systemd',
    timer   = 'systemd',

    -- other things
    rkt = 'racket',
  },

  literal = {
    ['.envrc'] = 'bash',
    ['flake.lock'] = 'json',
  },

  complex = {
  },

} }
