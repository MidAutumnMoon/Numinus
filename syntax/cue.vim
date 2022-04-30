"
" Copied from mgrabovsky/vim-cuesheet
"


setlocal conceallevel=2

syntax region String matchgroup=cueString start=/"/ skip=/\\"/ end=/"/
      \ transparent contains=NONE

syntax region Comment start=/^\s*REM / end=/$/ contains=specialComment
syntax keyword SpecialComment COMMENT DATE DISCID GENRE

syntax keyword Function CATALOG CDTEXTFILE FILE FLAGS INDEX
      \ ISRC PERFORMER POSTGAP
      \ PREGAP SONGWRITER TITLE TRACK

syntax keyword StorageClass AIFF AUDIO MP3 WAVE

syntax match Number /[+-]\=\<\d\+\%(\.\d\+\)\=\>/
syntax match Number /\<\d\+\%(:\d\{2}\)\{2}\>/
