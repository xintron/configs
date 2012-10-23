set rs " Restoring screen
set t_Co=256

set nocompatible
set autoindent
set autochdir
set backspace=start,indent,eol

set scrolloff=3
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set list
set listchars=tab:»\ ,trail:·,nbsp:⎵,precedes:←,extends:→,conceal:·
set showbreak=↪
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.pyc

set number
set cursorline
set incsearch
set ignorecase
set smartcase
set hlsearch

set statusline=%1*%<%F\ [%Y%H%M%R\ #%n]\%=%*
set statusline+=%2*fo:\ [%{&fo}]\ line:\ %l\,%L\[%P\]\ col:\ %c%V\ \[%b\]\[0x%B\]
set statusline+=%3*%{SyntasticStatuslineFlag()}
set laststatus=2
set backupdir=/tmp/xintron/vim
set directory=/tmp/xintron/vim

set formatoptions-=to " Manuallly turn on when needed
set formatoptions+=j " Merge comments properly
set history=500

set undofile
set undolevels=512
if !isdirectory(expand('$HOME').'/.backup/vim/undo')
    call mkdir(expand('$HOME').'/.backup/vim/undo', 'p')
endif
exe 'set undodir='.expand('$HOME').'/.backup/vim/undo'

set hidden
set textwidth=79

set grepprg=grep\ -n\ $@

syntax on
filetype plugin indent on
