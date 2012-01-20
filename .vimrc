" Author: Marcus Carlsson <hi@xintron.se>

for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
    if (f =~ '\v0[0-9].+\.vim')
        exe 'source'.f
    endif
endfor

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

set wildmenu
set wildmode=list:full
set wildignore+=*.pyc

syntax on
filetype plugin indent on

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
