local cmp = require 'cmp'


cmp.setup.cmdline( ':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lua' }
  }
} )

cmp.setup.cmdline( '/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
} )
