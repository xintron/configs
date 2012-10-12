let mapleader=','

nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
nmap <C-l> :NERDTreeToggle<CR>

nmap <Leader>n :tabnext<CR>
nmap <Leader>N :tabprev<CR>
nmap <Leader>p :set paste!<CR>

nmap <silent> <Leader>ft :exe 'set fo'.(&fo =~ 't' ? '-=t' : '+=t')<CR>
nmap <Leader>cc :exe 'set colorcolumn='.(&colorcolumn == '' ? '+0' : '')<CR>

map <Leader>l <C-w>l
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>h <C-w>h

nmap <Leader>nh :nohl<CR>
nmap <C-h>h :call SynStack()<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader># :b#<CR>
