"
"
" Whitespace.vim: stripped from ntpeters/vim-better-whitespace
"
"


let s:highlight_color = '#ff5370'

let s:filetypes_blacklist = [
      \ 'diff', 'git', 'gitcommit', 'unite', 'help', 'fugitive'
      \ ]


" Section: Whitespace matching setup

" Define custom whitespace character group to include all horizontal unicode
" whitespace characters except tab (\u0009). Vim's '\s' class only includes ASCII spaces and tabs.
let s:whitespace_chars='\u0020\u00a0\u1680\u180e\u2000-\u200b\u202f\u205f\u3000\ufeff'
let s:eol_whitespace_pattern = '[\u0009' . s:whitespace_chars . ']\+$'

let s:strip_whitespace_pattern = s:eol_whitespace_pattern
let s:strip_whitelines_pattern = '\(\n\)\+\%$'



" Section: Prepare

execute 'highlight ExtraWhitespace guibg='.s:highlight_color



" Section: Actual work functions


" Function that clears the search entries of BetterWhiteSpace by rolling back to the given index
function! s:RestoreSearchHistory(index)
  while histnr('search') > max([a:index, 0])
    call histdel('search', -1)
  endwhile
  let @/ = histget('search', -1)
endfunction


" Match Whitespace on all lines
function! s:HighlightEOLWhitespace()
  call <SID>ClearHighlighting()
  let s:match_id = matchadd('ExtraWhitespace', s:eol_whitespace_pattern, 10, get(s:, 'match_id', -1))
endfunction

" Match Whitespace on all lines except the current one
function! s:HighlightEOLWhitespaceExceptCurrentLine()
  call <SID>ClearHighlighting()
  let s:match_id = matchadd('ExtraWhitespace',
        \   '\%<' . line('.') .  'l' . s:eol_whitespace_pattern .
        \ '\|\%>' . line('.') .  'l' . s:eol_whitespace_pattern, 10, get(s:, 'match_id', -1))
endfunction

" Remove Whitespace matching
function! s:ClearHighlighting()
  silent! call matchdelete( get( s:, 'match_id', -1 ) )
endfunction


" Removes all extraneous whitespace in the file
function! s:StripWhitespace( line1, line2, force )
  if &readonly && a:force == 0
    echohl WarningMsg
    echom "warning: 'readonly' option is set (add ! to override)"
    echohl None
    return
  endif
  " Save the current search and cursor position
  let _s = histnr('search')
  let l = line('.')
  let c = col('.')

  silent execute ':' . a:line1 . ',' . a:line2 . 's/' . s:strip_whitespace_pattern . '//e'

  " Restore the saved search and cursor position
  call <SID>RestoreSearchHistory(_s)
  call cursor(l, c)
endfunction


function! <SID>SetupAutoCommands()
  augroup Whitespace
    autocmd!

    if ( empty(&buftype) || &buftype == 'acwrite' ) && index( s:filetypes_blacklist, &ft ) == -1
      " Highlight extraneous whitespace at the end of lines, but not the current line in insert mode.
      call <SID>HighlightEOLWhitespace()
      autocmd InsertLeave,BufReadPost * call <SID>HighlightEOLWhitespace()

      " Using syntax: clear whitespace highlighting when leaving buffer
      autocmd BufWinLeave * if expand("<afile>") == expand("%") | call <SID>ClearHighlighting() | endif

      " Do not highlight whitespace on current line in insert mode
      autocmd CursorMoved,CursorMovedI,InsertEnter * call <SID>HighlightEOLWhitespaceExceptCurrentLine()
    endif

  augroup END
endfunction

" Check & setup auto commands upon enter & load, and again on filetype change.
autocmd FileType,WinEnter,BufWinEnter * call <SID>SetupAutoCommands()



" Section: Public commands and mappings

" Run :StripWhitespace to remove end of line whitespace
command! -bang -range=% StripWhitespace call <SID>StripWhitespace(<line1>, <line2>, <bang>0)

" Manually do strip whitespaces.
nnoremap <Leader>b :StripWhitespace<CR>
