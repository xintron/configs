set nocp " No compatible mode
set autochdir

setlocal omnifunc=syntaxcomplete#Complete " Autocompletion, engage!
set cot+=menuone " Show preview of function prototype

set autoindent
set smartindent

set t_Co=256 " Use 256 colors
syntax on
color railscasts

set cursorline
hi CursorLine term=none cterm=none

set showmode

set scrolloff=3 " Number of lines to keep above and below cursor
set showmatch " Show matching brackets/paranthesis

set wildmenu
set wildmode=list:full
set wildignore=*.pyc

set textwidth=0
set wrap " Don't wrap long lines

set incsearch " Search as you type
set ignorecase
set smartcase
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

filetype plugin indent on

autocmd BufRead *.haml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead *.php set noexpandtab
autocmd Filetype php set noexpandtab
autocmd Filetype ruby set tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd Filetype c,cpp,java,php set cindent

set statusline=%<%F\ %y%h%m%r\ -\ %{strftime(\"%a\ %d\ %b\ %Y\ %H:%M:%S\ %Z\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ \[%P\]
set laststatus=2 " Always show a statuslin

set backupdir=/tmp
set directory=/tmp


" Rainbow paren 
if v:version >= 700
	autocmd BufReadPost * source $HOME/.vim/rainbow_paren.vim
	let g:rainbow = 1
	let g:rainbow_paren   = 1 " ()
	let g:rainbow_brace   = 1 " {}
	let g:rainbow_bracket = 1 " []
	autocmd BufReadPost * source $HOME/.vim/rainbow_paren.vim
	autocmd BufNewFile  * source $HOME/.vim/rainbow_paren.vim
endif

set number

let mapleader = ","
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-l> :NERDTreeToggle<CR>

nnoremap <Leader>b :ls<CR>:b<SPACE>
nnoremap <Leader>1 :ls<CR>

map <Leader>l <C-w>l
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>h <C-w>h
