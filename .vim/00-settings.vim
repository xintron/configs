set rs " Restoring screen
set t_Co=256

set nocompatible
set autoindent
set noautochdir
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
set relativenumber
set cursorline
set incsearch
set ignorecase
set smartcase
set hlsearch

set statusline=%<%F\ [%Y%H%M%R\ #%n]\%=
set statusline+=fo:\ [%{&fo}]\ line:\ %l\,%L\[%P\]\ col:\ %c%V\ \[%b\]\[0x%B\]
set statusline+=%{SyntasticStatuslineFlag()}
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

set completeopt=menuone,longest,preview
set nofoldenable
