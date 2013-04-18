" Author: Marcus Carlsson <hi@xintron.se>

if !isdirectory('/tmp/xintron/vim')
    call mkdir('/tmp/xintron/vim', 'p', 0700)
endif

for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
    if (f =~ '\v0[0-9].+\.vim')
        exe 'source'.f
    endif
endfor

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Enable *after* loading pathogen plugins
filetype plugin indent on
syntax on

colorscheme xintron

for f in split(globpath(split(&runtimepath, ',')[0], 'after/*.vim'), '\n')
    if (f =~ '\v0[0-9].+\.vim')
        exe 'source'.f
    endif
endfor
