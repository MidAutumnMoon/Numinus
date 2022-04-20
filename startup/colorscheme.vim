"
" Based on drewtempelmeyer/palenight.vim
"


"
" Colors
"
let s:red_light = '#ff869a'
let s:red       = '#ff5370'
let s:red_dark  = '#be5046'

let s:green = '#c3e88d'

let s:cyan = '#89ddff'
let s:blue = '#82aaff'

let s:purple = '#c792ea'

let s:yellow = '#ffcb6b'
let s:orange = '#f78c6c'

let s:white = '#bfc7d5'
let s:black = '#292d3e'

let s:grey_light   = '#424760'
let s:grey_cursor  = '#2c323c'
let s:grey_comment = '#697098'
let s:grey_menu    = '#3e4452'
let s:grey_special = '#3b4048'

let s:split = '#181a1f'



"
" Helper Function
"

" s:highlight
"
" group : a highlight group for highlight command
"
" style : a dictionary looks like:
"   {
  "   bg: 'color',
  "   fg: 'color',
  "   sp: 'color'
  "   effects: 'bold'
"   }
"
function! s:hil ( group, style )
  let l:fg =
        \ has_key( a:style, 'fg' ) ? a:style.fg : 'NONE'
  let l:bg =
        \ has_key( a:style, 'bg' ) ? a:style.bg : 'NONE'
  let l:sp =
        \ has_key( a:style, 'sp' ) ? a:style.sp : 'NONE'
  let l:effects =
        \ has_key( a:style, 'effects' ) ? a:style.effects : 'NONE'

  execute 'highlight' a:group
        \ 'guifg='l:fg 'guibg='l:bg 'guisp='l:sp 'gui='l:effects
endfunction



"
" Do the highlight
"
" ...of codes... {{{

  call s:hil( 'Comment',        { 'fg': s:grey_comment, 'effects': 'italic' } )
  call s:hil( 'SpecialComment', { 'fg': s:grey_comment, 'effects': 'italic,bold' } )

  call s:hil( 'Character',  { 'fg': s:green } )
  call s:hil( 'Constant',   { 'fg': s:yellow } )
  call s:hil( 'Boolean',    { 'fg': s:red } )
  call s:hil( 'Float',      { 'fg': s:orange } )
  call s:hil( 'Function',   { 'fg': s:blue } )
  call s:hil( 'Identifier', { 'fg': s:cyan } )
  call s:hil( 'Number',     { 'fg': s:orange } )
  call s:hil( 'Operator',   { 'fg': s:cyan } )
  call s:hil( 'String',     { 'fg': s:green } )

  call s:hil( 'Type',         { 'fg': s:yellow } )
  call s:hil( 'StorageClass', { 'fg': s:yellow } )
  call s:hil( 'Structure',    { 'fg': s:yellow } )
  call s:hil( 'Typedef',      { 'fg': s:yellow } )

  call s:hil( 'Conditional', { 'fg': s:purple, 'effects': 'italic' } )
  call s:hil( 'Exception',   { 'fg': s:purple, 'effects': 'italic' } )
  call s:hil( 'Keyword',     { 'fg': s:purple, 'effects': 'italic' } )
  call s:hil( 'Label',       { 'fg': s:purple, 'effects': 'italic' } )
  call s:hil( 'Repeat',      { 'fg': s:purple, 'effects': 'italic' } )
  call s:hil( 'Statement',   { 'fg': s:purple, 'effects': 'italic' } )

  call s:hil( 'Define',    { 'fg': s:purple, 'effects': 'italic' } )
  call s:hil( 'Include',   { 'fg': s:blue } )
  call s:hil( 'Macro',     { 'fg': s:purple } )
  call s:hil( 'PreCondit', { 'fg': s:yellow } )
  call s:hil( 'PreProc',   { 'fg': s:yellow } )

  call s:hil( 'Debug',       { } )
  call s:hil( 'Error',       { 'fg': s:red_dark } )
  call s:hil( 'Ignore',      { } )
  call s:hil( 'Special',     { 'fg': s:blue } )
  call s:hil( 'SpecialChar', { 'fg': s:orange, 'effects': 'italic' } )
  call s:hil( 'Tag',         { } )
  call s:hil( 'Todo',        { 'fg': s:purple, 'effects': 'bold' } )
  call s:hil( 'Underlined',  { 'effects': 'underline' } )

" }}}

" ...of the editor... {{{

  call s:hil( 'Normal', { 'fg': s:white , 'bg': s:black } )

  call s:hil( 'LineNr',       { 'fg': s:grey_light } )
  call s:hil( 'CursorLineNr', { } )

  call s:hil( 'Cursor',      { 'fg': s:blue, 'bg': s:black } )
  call s:hil( 'CursorColum', { 'bg': s:grey_cursor } )
  call s:hil( 'CursorLine',  { 'bg': s:grey_cursor } )

  call s:hil( 'StatusLine',   { 'fg': s:white, 'bg': s:grey_cursor, 'effects': 'italic' } )
  call s:hil( 'StatusLineNC', { 'effects': 'italic' } )

  call s:hil( 'Visual',    { 'bg': s:grey_light } )
  call s:hil( 'VisualNOS', { 'bg': s:grey_light } )

  call s:hil( 'DiffAdd',    { 'fg': s:green } )
  call s:hil( 'DiffChange', { 'fg': s:yellow } )
  call s:hil( 'DiffDelete', { 'fg': s:red } )
  call s:hil( 'DiffText',   { 'fg': s:blue } )

  call s:hil( 'Folded',     { 'fg': s:grey_comment, 'bg': s:grey_cursor } )
  call s:hil( 'FoldColumn', { } )

  call s:hil( 'ErrorMsg',   { 'fg': s:red } )
  call s:hil( 'ModeMsg',    { } )
  call s:hil( 'MoreMsg',    { } )
  call s:hil( 'WarningMsg', { 'fg': s:yellow } )

  call s:hil( 'SignColumn', { } )
  call s:hil( 'VertSplit', { 'fg': s:split } )

  call s:hil( 'Pmenu',      { 'bg': s:grey_menu } )
  call s:hil( 'PmenuSel',   { 'fg': s:black, 'bg': s:blue } )
  call s:hil( 'PmenuSbar',  { 'bg': s:grey_special } )
  call s:hil( 'PmenuThumb', { 'bg': s:white } )
  call s:hil( 'WildMenu',   { 'fg': s:black, 'bg': s:blue } )

  call s:hil( 'Search',     { 'fg': s:black, 'bg': s:yellow } )
  call s:hil( 'IncSearch',  { 'fg': s:yellow, 'bg': s:grey_comment } )
  call s:hil( 'Substitute', { 'fg': s:blue, 'bg': s:grey_comment } )

  call s:hil( 'SpellBad',   { 'fg': s:red, 'effects': 'underline' } )
  call s:hil( 'SpellCap',   { 'fg': s:yellow } )
  call s:hil( 'SpellLocal', { 'fg': s:yellow } )
  call s:hil( 'SpellRare',  { 'fg': s:yellow } )

  call s:hil( 'TabLine',     { 'fg': s:grey_comment } )
  call s:hil( 'TabLineFill', { } )
  call s:hil( 'TabLineSel',  { 'fg': s:white } )

  call s:hil( 'MatchParen', { 'fg': s:blue, 'effects': 'underline,italic' } )

  call s:hil( 'Directory',  { 'fg': s:blue } )
  call s:hil( 'NonText',    { 'fg': s:grey_special } )
  call s:hil( 'SpecialKey', { 'fg': s:yellow } )

" }}}

" ...of git... {{{

  call s:hil( 'gitcommitComment', { 'fg': s:grey_comment } )

  call s:hil( 'gitcommitOnBranch', { } )
  call s:hil( 'gitcommitOverflow', { 'fg': s:yellow } )
  call s:hil( 'gitcommitSummary',  { 'fg': s:white } )
  call s:hil( 'gitcommitUnmerged', { 'fg': s:green } )

  call s:hil( 'gitcommitDiscardedType', { 'fg': s:red } )
  call s:hil( 'gitcommitSelectedType',  { 'fg': s:green } )

  call s:hil( 'gitcommitFile',          { } )
  call s:hil( 'gitcommitDiscardedFile', { 'fg': s:red } )
  call s:hil( 'gitcommitSelectedFile',  { 'fg': s:green } )
  call s:hil( 'gitcommitUnmergedFile',  { 'fg': s:yellow } )
  call s:hil( 'gitcommitUntrackedFile', { 'fg': s:cyan } )

  highlight link gitcommitDiscardedArrow gitcommitDiscardedFile
  highlight link gitcommitSelectedArrow gitcommitSelectedFile
  highlight link gitcommitUnmergedArrow gitcommitUnmergedFile

  highlight link gitcommitNoBranch gitcommitBranch
  highlight link gitcommitUntracked gitcommitComment
  highlight link gitcommitDiscarded gitcommitComment
  highlight link gitcommitSelected gitcommitComment

" }}}

" ...of other plugins... {{{

  " gitsigns
  call s:hil( 'GitSignsAdd',    { 'fg': s:green } )
  call s:hil( 'GitSignsChange', { 'fg': s:yellow } )
  call s:hil( 'GitSignsDelete', { 'fg': s:red } )

  " indent_blankline
  call s:hil( 'IndentBlanklineChar',         { 'fg': s:grey_cursor } )
  call s:hil( 'IndentBlanklineContextChar',  { 'fg': s:grey_light } )
  call s:hil( 'IndentBlanklineContextStart', { 'sp': s:white, 'effects': 'undercurl' } )

  " quick-scope
  call s:hil( 'QuickScopePrimary',   { 'fg': s:green, 'effects': 'underline,bold' } )
  call s:hil( 'QuickScopeSecondary', { 'fg': s:red_light, 'effects': 'underline,bold' } )

" }}}

" ...of some random things... {{{

  let g:terminal_color_0  = s:black
  let g:terminal_color_1  = s:red
  let g:terminal_color_2  = s:green
  let g:terminal_color_3  = s:yellow
  let g:terminal_color_4  = s:blue
  let g:terminal_color_5  = s:purple
  let g:terminal_color_6  = s:cyan
  let g:terminal_color_7  = s:white
  let g:terminal_color_8  = s:grey_light
  let g:terminal_color_9  = s:red_dark
  let g:terminal_color_10 = s:green
  let g:terminal_color_11 = s:orange
  let g:terminal_color_12 = s:blue
  let g:terminal_color_13 = s:purple
  let g:terminal_color_14 = s:cyan
  let g:terminal_color_15 = s:grey_comment

  let g:terminal_color_background = s:black
  let g:terminal_color_foreground = s:white

" }}}


"
" Arbitrary Settings
"
set termguicolors

" ...to have a beautiful blurry view...
highlight Normal guibg=NONE ctermbg=NONE
