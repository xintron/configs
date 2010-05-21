" AUTOCOMPLETION
setlocal omnifunc=syntaxcomplete#Complete   " Autocompletion, engage!
set cot+=menuone    " Show preview of function prototype

" INDENTATION
set autoindent      " Indent same level as the previous line
set smartindent
filetype plugin indent on
autocmd Filetype c,cpp,java,php set cindent

" INTERFACE
set nocp            " No compatible mode

set t_Co=256        " Use 256 colors
syntax on
color railscasts

set cursorline      " Highlight current line
                    " Disable underline
hi CursorLine term=none cterm=none

set showmode

set scrolloff=3     " Number of lines to keep above and below cursor
set showmatch       " Show matching brackets/paranthesis

set wildmenu
set wildmode=list:full

" FORMATTING
set textwidth=0
set nowrap          " Don't wrap long lines

" SEARCHING
set incsearch       " Search as you type
set ignorecase
set smartcase
set hlsearch        " Hilight search terms

" TABS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

autocmd BufRead *.haml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead *.php set noexpandtab
autocmd Filetype php set noexpandtab
autocmd Filetype ruby set tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ of\ %L\ \(%.45{getcwd()}\)

set backupdir=/tmp
set directory=/tmp

" Rainbow paren 
if v:version >= 700
	autocmd BufReadPost * source $HOME/.vim/rainbow_paren.vim
	let g:rainbow = 1
	let g:rainbow_paren   = 1 " ()
	let g:rainbow_brace   = 1 " {}
	let g:rainbow_bracket = 1 " []
	" let g:rainbow_angle   = 1 " <>
	autocmd BufReadPost * source $HOME/.vim/rainbow_paren.vim
	autocmd BufNewFile  * source $HOME/.vim/rainbow_paren.vim
endif " 

set number
"set mouse=a

map <S-F7>	:w<CR>
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>
nnoremap <silent> <C-l> :NERDTreeToggle<CR>
