" free movement
nnoremap j gj
nnoremap k gk

" start a newline
nnoremap <A-o> o<Esc>
nnoremap <A-S-o> O<Esc>
inoremap <A-o> <C-o>o
inoremap <A-S-o> <C-o>O

" quit vim
nnoremap <silent> <Leader>q :wall<Bar>qa<CR>
nnoremap <silent> <LocalLeader>q :qa!<CR>

" select all lines
nnoremap <Leader>A ggVG

" jump to end of line without far reach
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
nnoremap <silent> <Up> :tabedit<CR>
nnoremap <silent> <Down> :tabclose<CR>
nnoremap <silent> <Right> :tabnext<CR>
nnoremap <silent> <Left> :tabprevious<CR>

" move up and down while typing
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
inoremap <A-j> <Down>
inoremap <A-k> <Up>

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
nnoremap <A-CR> <C-^>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" switch the case of current word
nnoremap <silent> <C-u> mzg~iw`z

" exit terminal mode
tnoremap <silent> <Esc> <C-\><C-n>

" clear search highlightings
nnoremap <silent> <Esc> :nohlsearch<CR>
