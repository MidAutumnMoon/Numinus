local Cache = vim.fn.stdpath 'cache'
local State = vim.fn.stdpath 'state'

local Options = {

  number = true,
  relativenumber = true,
  mouse = 'n',

  lazyredraw = true,
  timeoutlen = 300,
  updatetime = 200,
  regexpengine = 2,

  laststatus = 3,

  autoread = true,
  autowrite = true,
  autowriteall = true,

  scrolloff = 10,

  startofline = true,
  joinspaces = false,
  virtualedit = "block",
  whichwrap = "b,s,<,>,[,]",

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 0,
  smarttab = true,
  expandtab = true,
  autoindent = true,

  completeopt = "menuone,preview,longest",
  diffopt = "filler,vertical",

  showbreak = "↳ ",
  breakindent = false,
  breakindentopt = "sbr",

  synmaxcol = 200,
  termguicolors = true,
  cursorline = true,
  visualbell = true,
  fillchars = "eob: ,vert: ",
  signcolumn = "yes:1",
  nrformats = "hex,bin,unsigned",

  list = true,
  listchars = "tab:▷ ,trail:·,extends:◣",

  showcmd = true,

  wildmenu = true,
  wildmode = "full:lastused",

  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,

  swapfile = true,
  directory = State .. "/swap//",
  writebackup = true,
  backup = false,
  backupdir = State .. "/backup//",
  undofile = true,
  undodir = State .. "/undo//",

  foldmethod = "marker",
  foldlevelstart = 99,

  shell = "/bin/sh"

}

vim.cmd [[
    filetype plugin indent on
]]

for option, value in pairs( Options ) do
  vim.opt[option] = value
end


vim.opt.shortmess:append("IF")
vim.opt.formatoptions:append("1,j")

