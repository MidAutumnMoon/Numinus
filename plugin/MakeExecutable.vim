"
" :MakeExecutable : chmod +x
"

command! MakeExecutable
      \   if !empty( expand('%') )
      \ |   write
      \ |   call system( 'chmod +x ' . expand('%') )
      \ |   silent e
      \ | else
      \ |   echohl WarningMsg
      \ |   echo 'Save the file first!'
      \ |   echohl None
      \ | endif
