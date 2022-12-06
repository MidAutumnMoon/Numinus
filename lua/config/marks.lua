require "marks" .setup {

  default_mappings = true,

  excluded_filetypes = require "teapot.common" .ExcludedFiletyps,

  force_write_shada = true,

  mappings = {
    next = "]m",
    prev = "[m",
  },

}
