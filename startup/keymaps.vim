" free movement
nmap j gj
nmap k gk

" start a newline
nnoremap <Leader>o o<EsC>
nnoremap <Leader>O O<EsC>

" quit vim
" see also ../plugin/QuitWithSession.lua
nnoremap <silent> <Leader>q :wall<Bar>qa<CR>
nnoremap <silent> <MiddleMouse> :wall<Bar>qa<CR>
nnoremap <silent> <LocalLeader>q :qa!<CR>

" select all lines
nnoremap <Leader>A ggVG

" jump to end of line with one stroke
nmap <A-a> $
omap <A-a> $
xmap <A-a> $
imap <A-a> <C-o>$

" <Enter> is easier to reach than %
nmap <Enter> %
omap <Enter> %
xmap <Enter> %

" switch buffers
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprev<CR>

" switch tabs
nnoremap <silent> <Leader>t :tabedit<CR>
nnoremap <silent> <LocalLeader>t :tabclose<CR>
nnoremap <silent> <M-]> :tabnext<CR>
nnoremap <silent> <M-[> :tabprevious<CR>

" switch to tab N
nnoremap <silent> <LocalLeader>1 1gt
nnoremap <silent> <LocalLeader>2 2gt
nnoremap <silent> <LocalLeader>3 3gt
nnoremap <silent> <LocalLeader>4 4gt
nnoremap <silent> <LocalLeader>8 5gt
nnoremap <silent> <LocalLeader>9 6gt
nnoremap <silent> <LocalLeader>0 7gt

" backspace as <C-h>
imap <C-h> <BS>
tmap <C-h> <BS>
cmap <C-h> <BS>

" move up and down while typing
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-k> <Up>

" move lines in different modes
nnoremap <silent> <C-k> :move-2<CR>
nnoremap <silent> <C-j> :move+<CR>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" more nature way to switch between files.
inoremap <C-^> <C-o><C-^>
nnoremap <A-CR> <C-^>
inoremap <A-CR> <C-o><C-^>

" delete one character after cursor
inoremap <A-h> <Del>

" <tab> to cycle through all splits
nnoremap <silent> <Tab> <C-w>w
nnoremap <silent> <S-Tab> <C-w>W

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" switch the case of current word
nnoremap <silent> <C-u> mzg~iw`z

" exit terminal mode
tnoremap <silent> <Esc> <C-\><C-n>

" toggle folds - one keystroke is better than two
nnoremap <M-f> za
inoremap <M-f> <C-o>za

" alternative methods to exit i-mode
inoremap <C-q> <Esc>

" clear search highlightings
nnoremap <silent> <Esc> :nohlsearch<CR>

" Find files
nnoremap <silent> gF :vertical wincmd f<CR>
