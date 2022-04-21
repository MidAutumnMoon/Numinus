filetype plugin on

set number
set relativenumber

set autoread autowrite
set encoding=utf-8
set shortmess+=IF
set lazyredraw
set modelines=3
set mouse=a
set nospell
set shell=bash
set timeoutlen=350
set undofile
set updatetime=180
set visualbell
set wrap

set autoindent
set breakindent
set breakindentopt=sbr
set expandtab smarttab
set foldopen-=block
set foldmethod=marker
set foldlevelstart=99
set formatoptions+=1,j
set nojoinspaces
set nostartofline
set shiftwidth=2
set smartindent
set tabstop=2

set completeopt=menuone,preview
set cursorline
set diffopt=filler,vertical
let &fcs = 'eob: '
set hidden
set hlsearch incsearch
set ignorecase smartcase
set laststatus=2
set list
set listchars=tab:>-,nbsp:␣
set scrolloff=5
set showcmd showmatch
set showbreak="↳ "
set virtualedit=block
set whichwrap=b,s
set wildmenu
set signcolumn=yes:1

set backspace=indent,eol,start
set nrformats=hex,octal

let &backupdir = stdpath('cache').'/backup//,' . '.,' . '/tmp/vim/backup//'
