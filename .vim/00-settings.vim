set rs " Restoring screen
set t_Co=256

set nocompatible
set autoindent
set smartindent
set autochdir
set backspace=start,indent,eol

set scrolloff=3
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set wildmenu
set wildmode=list:full
set wildignore+=*.pyc

set number
set cursorline
set incsearch
set ignorecase
set smartcase
set hlsearch

set statusline=%<%F\ %y%h%m%r\ -\ %{strftime(\"%a\ %d\ %b\ %Y\ %H:%M:%S\ %Z\",getftime(expand(\"%:p\")))}%=\ fo:\ [%{&fo}]\ line:\ %l\,%L\[%P\]\ col:\ %c%V\ buf:\ #%n\ \[%b\]\[0x%B\]%#warningmsg#%{SyntasticStatuslineFlag()}\%*
set laststatus=2
set backupdir=/tmp/xintron/vim
set directory=/tmp/xintron/vim

set formatoptions-=t " Manually turn on when needed
set history=50

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

colorscheme wombat256
